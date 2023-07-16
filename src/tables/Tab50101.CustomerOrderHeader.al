table 50101 "Customer Order Header"
{
    Caption = 'Customer Order Header';
    DataClassification = CustomerContent;
    DrillDownPageID = "Customer Order List";
    LookupPageID = "Customer Order";

    fields
    {
        field(1; "Order No"; Code[20])
        {
            Caption = 'Order No';
        }
        field(2; Customer; Code[20])
        {
            Caption = 'Customer';

            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get(Rec.Customer) then
                    Validate("Customer Name", Customer.Name);

            end;
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(5; "Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Customer Order Line New"."Total Amount" where("Order No" = field("Order No")));
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            TableRelation = Customer.Name;
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
    }
    keys
    {
        key(PK; "Order No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
    begin
        if "Order No" = '' then begin
            ExtSetup.Get();
            ExtSetup.TestField("Cust. Order");
            NoSeriesMgt.InitSeries(ExtSetup."Cust. Order", xRec."No. Series", 0D, "Order No", "No. Series");
        end;
    end;

    var
        ExtSetup: Record "Extension Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

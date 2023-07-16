table 50104 "Posted Customer Order Header"
{
    Caption = 'Customer Order Header';
    DataClassification = CustomerContent;
    DrillDownPageID = "Posted Customer Order List";
    LookupPageID = "Posted Customer Order";

    fields
    {
        field(1; "Order No"; Code[20])
        {
            Caption = 'Order No';
        }
        field(2; Customer; Code[20])
        {
            Caption = 'Customer';
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(5; "Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(8; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining AMount';
        }
        field(9; "Paid Amount"; Decimal)
        {
            Caption = 'Paid AMount';
            TableRelation = "Customer Order Payment".Amount where("Customer Order No" = field("Order No"));
        }
        field(4; "Document Date"; Date)
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
            ExtSetup.TestField("Post. Cust. Order");
            NoSeriesMgt.InitSeries(ExtSetup."Post. Cust. Order", xRec."No. Series", 0D, "Order No", "No. Series");
        end;
    end;

    var
        ExtSetup: Record "Extension Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

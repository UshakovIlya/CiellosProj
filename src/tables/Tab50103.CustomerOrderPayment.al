table 50103 "Customer Order Payment"
{
    Caption = 'Customer Order Payment';
    DataClassification = CustomerContent;
    DrillDownPageID = "Customer Order Payment List";
    // LookupPageID = "Customer Order Payment Card";

    fields
    {
        field(1; "Payment No"; Code[20])
        {
            Caption = 'Payment No';
        }
        field(2; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
        }
        field(3; "Customer Order No"; Code[20])
        {
            Caption = 'Customer Order No';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "No Series"; Code[20])
        {
            Caption = 'No Series';
        }
        field(6; "Date of Payment"; Date)
        {
            Caption = 'Date of Payment';
        }
        field(7; Paid; Boolean)
        {

        }
    }
    keys
    {
        key(PK; "Payment No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "Payment No" = '' then begin
            ExtSetup.Get();
            ExtSetup.TestField("Cust. Order Paymnet");
            NoSeriesMgt.InitSeries(ExtSetup."Cust. Order Paymnet", xRec."No Series", 0D, "Payment No", "No Series");
        end;
        Paid := false;
    end;

    var
        ExtSetup: Record "Extension Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}

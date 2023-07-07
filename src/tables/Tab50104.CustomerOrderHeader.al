table 50104 "Posted Customer Order Header"
{
    Caption = 'Customer Order Header';
    DataClassification = CustomerContent;

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
        field(4; Vendor; Code[20])
        {
            Caption = 'Vendor';
        }
        field(5; "Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(7; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
    }
    keys
    {
        key(PK; "Order No")
        {
            Clustered = true;
        }
    }
}

table 50107 "Posted Customer Order Line New"
{
    Caption = 'Customer Order Line';
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';

            // AutoIncrement = true;
        }
        field(2; "Order No"; Code[20])
        {
            Caption = 'Order No';
        }
        field(4; Qty; Decimal)
        {
            Caption = 'Qty';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; "Amount per Item"; Decimal)
        {
            Caption = 'Amount per Item';
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
        }
        field(8; "Item No"; Code[20])
        {
            Caption = 'Item No';
        }
    }
    keys
    {
        key(PK; "Line No", "Order No")
        {
            Clustered = true;
        }
    }
}

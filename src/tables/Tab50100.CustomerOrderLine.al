table 50100 "Customer Order Line"
{
    Caption = 'Customer Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Code[20])
        {
            Caption = 'Line No';
        }
        field(2; "Order No"; Code[20])
        {
            Caption = 'Order No';
        }
        field(3; "Line Type"; Enum "Sales Line Type")
        {
            Caption = 'Line Type';
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
        field(8; "No"; Code[20])
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

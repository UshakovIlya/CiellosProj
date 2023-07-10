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
            TableRelation = IF ("Line Type" = CONST(" ")) "Standard Text"
            ELSE
            IF ("Line Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Line Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Line Type" = CONST("Charge (Item)")) "Item Charge"
            ELSE
            IF ("Line Type" = CONST(Item)) Item
            else
            if ("Line Type" = const(Resource)) Resource;
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

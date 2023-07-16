table 50100 "Customer Order Line"
{
    Caption = 'Customer Order Line';
    DataClassification = CustomerContent;
    ObsoleteReason = 'New table was created';
    ObsoleteState = Pending;

    fields
    {
        field(1; "Line No"; Code[20])
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
            trigger OnValidate()
            begin
                Validate("Total Amount", Qty * "Amount per Item");
            end;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; "Amount per Item"; Decimal)
        {
            Caption = 'Amount per Item';
            Editable = false;
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
        }
        field(8; "Item No"; Code[20])
        {
            Caption = 'Item No';

            TableRelation = Item;

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if Item.get("Item No") then begin
                    Validate("Amount per Item", Item."Unit Cost");
                    Validate(Description, Item.Description);
                end;
            end;
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

page 50104 "Posted Customer Order Subform"
{
    ApplicationArea = All;
    Caption = 'Posted Customer Order Lines';
    PageType = ListPart;
    SourceTable = "Posted Customer Order Line New";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Item No"; Rec."Item No")
                {
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Amount per Item"; Rec."Amount per Item")
                {
                    ToolTip = 'Specifies the value of the Amount per Item field.';
                }
                field(Qty; Rec.Qty)
                {
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
        }
    }
}

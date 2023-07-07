page 50101 "Customer Order Subform"
{
    ApplicationArea = All;
    Caption = 'Customer Order Subform';
    PageType = ListPart;
    SourceTable = "Customer Order Line";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Amount per Item"; Rec."Amount per Item")
                {
                    ToolTip = 'Specifies the value of the Amount per Item field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ToolTip = 'Specifies the value of the Order No field.';
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

page 50108 "Extension Setup"
{
    ApplicationArea = All;
    Caption = 'Extension Setup';
    PageType = Card;
    SourceTable = "Extension Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Cust. Order"; Rec."Cust. Order")
                {
                    ToolTip = 'Specifies the value of the Cust. Order field.';
                }
                field("Cust. Order Paymnet"; Rec."Cust. Order Paymnet")
                {
                    ToolTip = 'Specifies the value of the Cust. Order Paymnet field.';
                }
                field("Post. Cust. Order"; Rec."Post. Cust. Order")
                {
                    ToolTip = 'Specifies the value of the Post. Cust. Order field.';
                }
            }
        }
    }
}

page 50105 "Posted Customer Order List"
{
    ApplicationArea = All;
    Caption = 'Posted Customer Order List';
    PageType = List;
    SourceTable = "Posted Customer Order Header";
    UsageCategory = Lists;
    CardPageID = "Posted Customer Order";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No"; Rec."Order No")
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.';
                    ApplicationArea = All;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining AMount field.';
                }
                field("Paid Amount"; Rec."Paid Amount")
                {
                    ToolTip = 'Specifies the value of the Paid AMount field.';
                }
            }
        }
    }
}

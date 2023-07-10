page 50106 "Customer Order Payment List"
{
    ApplicationArea = All;
    Caption = 'Customer Order Payment';
    PageType = List;
    SourceTable = "Customer Order Payment";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Payment No"; Rec."Payment No")
                {
                    ToolTip = 'Specifies the value of the Payment No field.';
                }
                field("Customer Order No"; Rec."Customer Order No")
                {
                    ToolTip = 'Specifies the value of the Customer Order No field.';
                }
                field("Customer No"; Rec."Customer No")
                {
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date of Payment"; Rec."Date of Payment")
                {
                    ToolTip = 'Specifies the value of the Date of Payment field.';
                }
            }
        }
    }
}

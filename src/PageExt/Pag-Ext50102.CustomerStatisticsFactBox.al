pageextension 50102 "Customer Statistics FactBox" extends "Customer Statistics FactBox"
{
    layout
    {
        addafter("No.")
        {
            field("Customer Orders Payments Total"; Rec."Customer Orders Payments Total")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Customer Orders Payments Total field.';
            }
            field("Customer Orders Total"; Rec."Customer Orders Total")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Customer Orders Total field.';
            }
        }
    }
}

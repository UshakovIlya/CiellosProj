pageextension 50100 RoleCenter extends "Business Manager Role Center" //9022
{
    actions
    {
        addafter("Chart of Accounts")
        {
            action("Cust Orders")
            {
                Caption = 'Cust Orders';
                ToolTip = 'Executes the Cust Orders action.';
                ApplicationArea = All;
                RunObject = page "Customer Order List";
            }
            action("Posted Cust Orders")
            {
                Caption = 'Posted Cust Orders';
                ToolTip = 'Executes the Cust Orders action.';
                ApplicationArea = All;
                RunObject = page "Posted Customer Order List";
            }
            // action(FF)
            // {
            //     Caption = 'Customer Order Payments';
            //     ToolTip = 'Executes the Customer Order Payments action.';
            //     ApplicationArea = All;
            //     RunObject = report " Posted Customer Orders";
            // }

        }
    }
}

pageextension 50101 "Customer Card" extends "Customer Card"
{
    layout
    {
        movebefore(Name; "Balance (LCY)", "CustSalesLCY - CustProfit - AdjmtCostLCY", AdjCustProfit)

        modify("Balance (LCY)")
        {
            Caption = 'Balanciaga';
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Caption = 'Costiaga';
        }
        modify(AdjCustProfit)
        {
            Caption = 'Profitiaga';
        }
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
    actions
    {
        addbefore(NewSalesQuote)
        {
            action(NewCustOrd)
            {
                Caption = 'New Customer Order';
                ToolTip = 'Executes the New Customer Order action.';

                ApplicationArea = Basic, Suite;
                Image = NewOrder;
                RunObject = Page "Customer Order";
                RunPageLink = Customer = FIELD("No.");
                RunPageMode = Create;
                // trigger OnAction()
                // var
                //     CustOrd: Record "Customer Order Header";
                //     CustOrdPage: PAge "Customer Order";
                // begin
                //     CustOrd.init();
                //     CustOrd.Validate(Customer);
                //     if CustOrd.Insert() then begin
                //         CustOrdPage.SetRecord(CustOrd);
                //         CustOrdPage.Run();
                //     end;
                // end;
            }
            action(NewCustOrdPaym)
            {
                Caption = 'New Customer Order Payment';
                ToolTip = 'Executes the New Customer Order Payment action.';
                Image = NewDocument;
            }
        }
    }
}

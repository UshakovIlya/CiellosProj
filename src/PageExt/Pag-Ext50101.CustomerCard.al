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
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Customer Orders Payments Total field.';
            }
            field("Customer Orders Total"; Rec."Customer Orders Total")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Customer Orders Total field.';
            }
        }
    }
    actions
    {
        addfirst("F&unctions")
        {
            action(DelRec)
            {
                Caption = 'Delete Customer';
                ToolTip = 'Executes the Delete Customer action.';

                ApplicationArea = all;
                Image = Delete;

                trigger OnAction()
                begin
                    if Confirm(CustDeleteLbl, true, Rec."No.") then
                        Rec.Delete(true);
                end;
            }
        }

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
            }
        }

        addfirst(Promoted)
        {
            actionref(DelRecRef; DelRec) { }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Error('Please, try another action');
    end;

    var
        CustDeleteLbl: LAbel 'Do you really want to delete the %1 customer?';
}

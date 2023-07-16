page 50103 "Posted Customer Order"
{
    ApplicationArea = All;
    Caption = 'Posted Customer Order';
    PageType = Card;
    SourceTable = "Posted Customer Order Header";
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Customer; Rec.Customer)
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

            part(PostCustOrderLines; "Posted Customer Order Subform")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Order No" = FIELD("Order No");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SetPayment)
            {
                Caption = 'Set Payment';
                ToolTip = 'Executes the Set Payment action.';
                Visible = SetPaymVis;
                Image = Payment;
                trigger OnAction()
                var
                    PaymentMgt: Codeunit PaymentMgt;
                begin
                    PaymentMgt.CreatePaymentForPostCustOrder(Rec);

                    if Rec."Paid Amount" = rec."Order Amount" then
                        SetPaymVis := false
                    else
                        SetPaymVis := true;
                end;
            }

            action("Show Payments")
            {
                Caption = 'Show PAyments';
                ToolTip = 'Executes the Show PAyments action.';
                Image = PostedPayment;
                trigger OnAction()
                var
                    CustomerOrderSummary: Report " Posted Customer Orders";
                begin
                    CustomerOrderSummary.SetReportRecord(Rec);
                    CustomerOrderSummary.Run();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec."Paid Amount" = rec."Order Amount" then
            SetPaymVis := false
        else
            SetPaymVis := true;
    end;

    var
        SetPaymVis: Boolean;
}

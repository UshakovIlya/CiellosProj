page 50102 "Customer Order List"
{
    ApplicationArea = All;
    Caption = 'Customer Order List';
    PageType = List;
    SourceTable = "Customer Order Header";
    UsageCategory = Lists;
    CardPageID = "Customer Order";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No"; Rec."Order No")
                {
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.';
                }

                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
        }

        area(FactBoxes)
        {
            part(CustStat; "Customer Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD(Customer);
            }
            part(CustDetFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD(Customer);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PostOrder)
            {
                ApplicationArea = All;
                Caption = 'Post Orders';
                Image = Post;

                trigger OnAction()
                var
                    CustomerOrderHeader: Record "Customer Order Header";
                    PostMgt: Codeunit PostingMgt;
                begin
                    CurrPage.SetSelectionFilter(CustomerOrderHeader);

                    if Confirm(ConfirmPostLbl, true) then begin
                        if CustomerOrderHeader.FindSet() then
                            repeat
                                PostMgt.PostCustOrders(CustomerOrderHeader);
                            until CustomerOrderHeader.Next() = 0;
                        CurrPage.Close();
                    end;

                end;
            }
        }
        area(Promoted)
        {
            actionref(PromPostOrd; PostOrder) { }
        }

    }

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Order Amount");
    end;

    var
        ConfirmPostLbl: Label 'Are you sure you want to post these orders?';
}

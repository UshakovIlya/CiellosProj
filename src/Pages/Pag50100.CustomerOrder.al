page 50100 "Customer Order"
{
    Caption = 'Customer Order';
    PageType = Document;
    SourceTable = "Customer Order Header";

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
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
            part(CustOrderLines; "Customer Order Subform")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Order No" = FIELD("Order No");
                UpdatePropagation = Both;
            }
        }

        area(FactBoxes)
        {
            part(CustDetFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD(Customer);
            }
            part(ItemDetails; "Item Invoicing FactBox")
            {
                ApplicationArea = Basic, Suite;
                Provider = CustOrderLines;
                SubPageLink = "No." = FIELD("Item No");
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
                Caption = 'Post Order';
                Image = Post;

                trigger OnAction()
                var
                    PostMgt: Codeunit PostingMgt;
                begin
                    if Confirm(ConfirmPostLbl, true) then begin
                        PostMgt.PostCustOrders(Rec);
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

    var
        ConfirmPostLbl: Label 'Are you sure you want to post the order?';
}

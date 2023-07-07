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
                    Enabled = false;
                    // TableRelation = Customer.Name;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                    ApplicationArea = All;
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.';
                    ApplicationArea = All;
                }
                field("Order No"; Rec."Order No")
                {
                    ToolTip = 'Specifies the value of the Order No field.';
                    ApplicationArea = All;
                }
                field(Vendor; Rec.Vendor)
                {
                    ToolTip = 'Specifies the value of the Vendor field.';
                    ApplicationArea = All;
                    TableRelation = Vendor."No." where("No." = field(Vendor));
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                    ApplicationArea = All;
                    Enabled = false;
                    TableRelation = Vendor.Name;
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
                SubPageLink = "No." = FIELD(No);
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
                begin

                end;
            }
        }
        area(Promoted)
        {
            actionref(PromPostOrd; PostOrder) { }
        }

    }
}

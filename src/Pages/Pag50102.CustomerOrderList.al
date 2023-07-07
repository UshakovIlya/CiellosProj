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
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
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

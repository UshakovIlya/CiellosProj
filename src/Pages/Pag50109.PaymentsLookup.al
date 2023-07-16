page 50109 PaymentsLookup
{
    ApplicationArea = Basic;
    Caption = 'PaymentsLookup';
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Customer; Rec."No.")
                {
                    Caption = 'Customer';
                    Editable = false;
                }
            }
            part(PaymentsSubform; PaymentsSubform)
            {
                Caption = 'Payments';
                ApplicationArea = Basic, Suite;
                SubPageLink = "Customer No" = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(PayPayments)
            {

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        SingleInstMgt.SetCustomerForPayment(Rec);
    end;

    var
        SingleInstMgt: Codeunit SingleInstance;
}

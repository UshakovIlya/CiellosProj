page 50110 PaymentsSubform
{
    ApplicationArea = Basic;
    Caption = 'PaymentsSubform';
    PageType = ListPart;
    SourceTable = "Customer Order Payment";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Payment No"; Rec."Payment No")
                {
                    ToolTip = 'Specifies the value of the Payment No field.';
                }
                field("Customer Order No"; Rec."Customer Order No")
                {
                    ToolTip = 'Specifies the value of the Customer Order No field.';
                }
                field("Date of Payment"; Rec."Date of Payment")
                {
                    ToolTip = 'Specifies the value of the Date of Payment field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetRange(Paid, false);
    end;

    trigger OnInsertRecord(BelowX: Boolean): Boolean
    begin
        SingleInstMgt.GetCustomerForPayment(Rec);
        SingleInstMgt.GetOrderForPayment(Rec);
    end;

    var
        SingleInstMgt: Codeunit SingleInstance;

}

codeunit 50103 PaymentMgt
{
    procedure CreatePaymentForPostCustOrder(var PostCustOrder: Record "Posted Customer Order Header")
    var
        Payments: Record "Customer Order Payment";
        PaymentsLookup: Page PaymentsLookup;
        Customer: Record Customer;
        ChosenCustomer: Record Customer;
        SingleInstMgt: Codeunit SingleInstance;
        DetCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
    begin
        Customer.Get(PostCustOrder.Customer);

        SingleInstMgt.SetOrderForPayment(PostCustOrder);

        PaymentsLookup.SetRecord(Customer);
        PaymentsLookup.LookupMode(true);
        if (PaymentsLookup.RunModal = Action::LookupOK) then begin
            Payments.SetRange("Customer No", Customer."No.");
            Payments.SetRange("Customer Order No", PostCustOrder."Order No");
            Payments.SetRange(Paid, false);
            if Payments.FindSet() then
                repeat
                    if (PostCustOrder."Remaining Amount" - Payments.Amount) < 0 then
                        Error(NotSuffAmount);

                    DetCustLedgEntry.SetRange("Customer No.", Customer."No.");
                    if DetCustLedgEntry.FindFirst() then begin
                        DetCustLedgEntry."Amount (LCY)" := DetCustLedgEntry."Amount (LCY)" - Payments.Amount;
                        Customer.CalcFields("Balance (LCY)");
                    end;

                    PostCustOrder."Remaining Amount" := PostCustOrder."Remaining Amount" - Payments.Amount;
                    PostCustOrder."Paid Amount" := PostCustOrder."Paid Amount" + Payments.Amount;

                    PostCustOrder.Modify();
                    Customer.Modify();
                    DetCustLedgEntry.Modify();
                    Payments.Paid := true;
                    Payments.Modify();
                    Commit();
                until Payments.Next() = 0;

        end;

    end;

    var
        NotSuffAmount: Label 'Not Sufficien amount in Payment';
}

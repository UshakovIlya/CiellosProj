codeunit 50104 EventMgt
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', false, false)]
    local procedure SalesPostYesNo_OnBeforeOnRun(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        PostedCustOrder: Record "Posted Customer Order Header";
    begin
        PostedCustOrder.SetRange(Customer, SalesHeader."Sell-to Customer No.");

        if not PostedCustOrder.IsEmpty() then
            if Dialog.Confirm(CustomerRelatedToPostOrdLbl, true) then
                IsHandled := false
            else
                IsHandled := true;

    end;

    var
        CustomerRelatedToPostOrdLbl: Label 'Customer of Sales Order is related to some Posted Customer Order. Proceed?';
        CustDeleteLbl: LAbel 'Do you really want to delete the %1 customer?';
}

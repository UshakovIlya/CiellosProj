codeunit 50102 PostingMgt
{
    procedure PostCustOrders(var CustOrderHeader: Record "Customer Order Header")
    var
        CustOrderLine: Record "Customer Order Line New";
        PostedCustOrderHeader: Record "Posted Customer Order Header";
        PostedOrderCard: Page "Posted Customer Order";
    begin
        CustOrderHeader.CalcFields("Order Amount");
        if CustOrderHeader."Order Amount" = 0 then
            Error(TOtalAmountErr);

        PostedCustOrderHeader.Init();

        PostedCustOrderHeader.Customer := CustOrderHeader.Customer;
        PostedCustOrderHeader."Customer Name" := CustOrderHeader."Customer Name";
        PostedCustOrderHeader."Order Amount" := CustOrderHeader."Order Amount";
        PostedCustOrderHeader."Remaining Amount" := CustOrderHeader."Order Amount";
        PostedCustOrderHeader."Document Date" := Today;

        if PostedCustOrderHeader.Insert(true) then begin

            CustOrderLine.SetRange("Order No", CustOrderHeader."Order No");

            PostCustOrderLine(PostedCustOrderHeader, CustOrderLine);

            CustOrderLine.SetRange("Order No", CustOrderHeader."Order No");
            CustOrderLine.DeleteAll();
            CustOrderHeader.Delete();
        end;


        PostedOrderCard.SetRecord(PostedCustOrderHeader);
        PostedOrderCard.Run();
    end;

    procedure PostCustOrderLine(var PostedCustOrderHeader: Record "Posted Customer Order Header"; var CustOrderLine: Record "Customer Order Line New")
    var
        PostedCustOrderLine: Record "Posted Customer Order Line New";
    begin
        if CustOrderLine.FindSet() then
            repeat
                PostedCustOrderLine.Init();
                PostedCustOrderLine.TransferFields(CustOrderLine);
                PostedCustOrderLine."Order No" := PostedCustOrderHeader."Order No";
                PostedCustOrderLine.Insert(true);
            until CustOrderLine.Next() = 0;
    end;

    var

    var
        ExtSetup: Record "Extension Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TOtalAmountErr: Label 'Total amount can`t be 0';
        ConfirmPostLbl: Label 'Are you sure you want to post the order?';
}

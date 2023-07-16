report 50100 " Posted Customer Orders"
{
    ApplicationArea = Basic, Suite;
    Caption = ' Posted Customer Orders';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Reports\RDLC\Rep50100.PostedCustomerOrders.rdlc';
    dataset
    {
        dataitem(PostedCustomerOrderHeader; "Posted Customer Order Header")
        {
            DataItemTableView = SORTING("Order No");

            // RequestFilterFields = "Order No";

            column(Customer; Customer)
            {

            }
            column(Order_No; "Order No")
            {

            }
            column(OrderId; OrderId)
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(OrderAmount; "Order Amount")
            {
            }
            column(OrderNo; "Order No")
            {
            }
            column(Remaining_Amount; "Remaining Amount")
            { }
            column(Paid_Amount; "Paid Amount") { }
            column(CustomerLbl; CustomerLbl) { }
            column(OrderAmountLbl; OrderAmountLbl) { }
            column(OrderNoLbl; OrderNoLbl) { }
            column(RemAmountLbl; RemAmountLbl) { }
            column(TotalPaymLbl; TotalPaymLbl) { }


            dataitem("Customer Order Payment"; "Customer Order Payment")
            {
                DataItemTableView = sorting("Payment No") where(Paid = const(true));
                DataItemLink = "Customer Order No" = field("Order No");
                RequestFilterFields = "Date of Payment";
                column(Payment_No; "Payment No")
                {
                }
                column(Date_of_Payment; "Date of Payment")
                { }
                column(Customer_Order_No; "Customer Order No")
                { }
                column(Amount; Amount)
                { }
                column(PaymentNoLbl; PaymentNoLbl) { }
                column(PaymDateLbl; PaymDateLbl) { }
                column(PaymAmountLbl; PaymAmountLbl) { }
            }

            trigger OnPreDataItem()
            begin
                if OrderId <> '' then
                    SetRange("Order No", OrderId);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filters)
                {

                }
            }
        }
    }

    procedure SetReportRecord(PostCustOrd: REcord "Posted Customer Order Header")
    begin
        OrderId := PostCustOrd."Order No";
    end;

    var
        CustomerLbl: Label 'Customer Name';
        OrderNoLbl: Label 'Order No.';
        OrderAmountLbl: Label 'Order Amount';
        RemAmountLbl: Label 'Remaining Amount';
        PaymAmountLbl: Label 'Payment Amount';
        PaymentNoLbl: Label 'Payment No.';
        PaymDateLbl: Label 'Payment Date';
        TotalPaymLbl: Label 'Total Payment';
        OrderId: Code[20];
}

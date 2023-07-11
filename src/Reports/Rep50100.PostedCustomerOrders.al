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
            column(CustomerName; "Customer Name")
            {
            }
            column(OrderAmount; "Order Amount")
            {
            }
            column(OrderNo; "Order No")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }

            // dataitem(PageLoop; "Integer")
            // {
            //     DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

            // }
            // dataitem(PostedCustomerOrderLine; "Posted Customer Order Line")
            // {
            //     column(Line_Type; "Line Type")
            //     {
            //     }
            //     column(No; No)
            //     { }
            //     column(Description; Description)
            //     { }
            //     column(Amount_per_Item; "Amount per Item")
            //     { }
            //     column(Qty; Qty)
            //     { }
            //     column(Total_Amount; "Total Amount")
            //     { }
            // }

            dataitem("Customer Order Payment"; "Customer Order Payment")
            {
                column(Date_of_Payment; "Date of Payment")
                { }
                column(Customer_Order_No; "Customer Order No")
                { }
                column(Amount; Amount)
                { }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}

reportextension 50100 "Customer - Order Summary" extends "Customer - Order Summary"
{
    RDLCLayout = 'src\ReportExt\RDLC\Rep-Ext50100.CustomerOrderSummary.rdlc';
    dataset
    {
        add(Customer)
        {
            column(CustomerOrdersTotal; "Customer Orders Total")
            {
            }
            column(CustomerOrdersPaymentsTotal; "Customer Orders Payments Total")
            {
            }
            column(CustomerOrdersTotalCaption; CustomerOrdersTotalLbl)
            { }
            column(CustomerOrdersPaymentsTotalCaption; CustomerOrdersPaymentsTotalLbl)
            { }
        }
    }
    requestpage
    {
        layout
        {
            addfirst(content)
            {
                field(CustomerOrdersTotalRP; CurrReport.Customer."Customer Orders Total")
                {
                    ToolTip = 'Specifies the value of the Customer.Customer Orders Total field.';
                    ApplicationArea = Basic, Suite;
                }
                field(CustomerOrdersPaymentsTotalRP; CurrReport.Customer."Customer Orders Payments Total")
                {
                    ToolTip = 'Specifies the value of the Customer.Customer Orders Payments Total field.';
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    var
        CustomerOrdersTotalLbl: Label 'Customer Orders Total';
        CustomerOrdersPaymentsTotalLbl: Label 'Customer Order Payments Total';
}

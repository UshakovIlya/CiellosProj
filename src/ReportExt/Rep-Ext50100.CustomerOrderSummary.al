reportextension 50100 "Customer - Order Summary" extends "Customer - Order Summary"
{
    RDLCLayout = 'src\ReportExt\RDLC\Rep-Ext50100.CustomerOrderSummary.rdlc';
    dataset
    {
        modify(Customer)
        {
            trigger OnBeforeAfterGetRecord()
            begin
                CalcFields("Customer Orders Total", "Customer Orders Payments Total");
            end;
        }
        add(Customer)
        {
            column(CustomerOrdersTotal; Format("Customer Orders Total"))
            {
            }
            column(CustomerOrdersPaymentsTotal; Format("Customer Orders Payments Total"))
            {
            }
            column(NumbersSum; Format(Number1 + Number2))
            { }
            column(NumbersSumLbl; NumbersSumLbl) { }
            column(AveragePaymentsPerOrderCaption; CustCityLbl) { }
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
            addlast(Options)
            {
                field(Number1; Number1)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Number1 field.';
                    Caption = 'First Number to Sum';
                }
                field(Number2; Number2)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Number2 field.';
                    Caption = 'Second Number to Sum';
                }
            }
        }
    }

    var
        CustCityLbl: Label 'Average Payment Amount per Order';
        CustomerOrdersTotalLbl: Label 'Customer Orders Total';
        CustomerOrdersPaymentsTotalLbl: Label 'Customer Order Payments Total';
        NumbersSumLbl: Label 'Sum of numbers from req page';
        Number1: Decimal;
        Number2: Decimal;
}

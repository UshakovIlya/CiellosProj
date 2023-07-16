tableextension 50100 Customer extends Customer
{
    fields
    {
        field(50100; "Customer Orders Total"; Decimal)
        {
            Caption = 'Customer Orders Total';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Customer Order Header"."Order Amount" where(Customer = field("No.")));
        }
        field(50101; "Customer Orders Payments Total"; Decimal)
        {
            Caption = 'Customer Orders Payments Total';
            FieldClass = FlowField;
            CalcFormula = sum("Customer Order Payment".Amount where("Customer No" = field("No.")));
        }
    }

    var
        CustDeleteLbl: LAbel 'Do you really want to delete the %1 customer?';

}

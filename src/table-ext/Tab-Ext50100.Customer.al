tableextension 50100 Customer extends Customer
{
    fields
    {
        field(50100; "Customer Orders Total"; Decimal)
        {
            Caption = 'Customer Orders Total';
            FieldClass = FlowField;
            CalcFormula = sum("Customer Order Header"."Order Amount" where(Customer = field("No.")));
        }
        field(50101; "Customer Orders Payments Total"; Decimal)
        {
            Caption = 'Customer Orders Payments Total';
            FieldClass = FlowField;
            CalcFormula = sum("Customer Order Payment".Amount where("Customer No" = field("No.")));
        }
    }
}

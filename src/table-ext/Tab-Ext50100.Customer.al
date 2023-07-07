tableextension 50100 Customer extends Customer
{
    fields
    {
        field(50100; "Customer Orders Total"; Decimal)
        {
            Caption = 'Customer Orders Total';
            DataClassification = ToBeClassified;
        }
        field(50101; "Customer Orders Payments Total"; Decimal)
        {
            Caption = 'Customer Orders Payments Total';
            DataClassification = ToBeClassified;
        }
    }
}

table 50105 "Extension Setup"
{
    Caption = 'Extension Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(4; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(1; "Cust. Order"; Code[20])
        {
            Caption = 'Cust. Order';
            TableRelation = "No. Series";
        }
        field(2; "Post. Cust. Order"; Code[20])
        {
            Caption = 'Post. Cust. Order';
            TableRelation = "No. Series";
        }
        field(3; "Cust. Order Paymnet"; Code[20])
        {
            Caption = 'Cust. Order Paymnet';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}

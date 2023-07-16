codeunit 50105 SingleInstance
{
    SingleInstance = true;

    procedure SetCustomerForPayment(var Customer: Record Customer)
    begin
        CustomerId := Customer."No.";
    end;

    procedure GetCustomerForPayment(var CustomerOrderPayment: Record "Customer Order Payment")
    begin
        CustomerOrderPayment.Validate("Customer No", CustomerId);
    end;

    procedure SetOrderForPayment(var PostedCustomerOrderHeader: Record "Posted Customer Order Header")
    begin
        OrderId := PostedCustomerOrderHeader."Order No";
    end;

    procedure GetOrderForPayment(var CustomerOrderPayment: Record "Customer Order Payment")
    begin
        CustomerOrderPayment.Validate("Customer Order No", OrderId);
    end;

    var
        CustomerId: Code[20];
        OrderId: Code[20];
}

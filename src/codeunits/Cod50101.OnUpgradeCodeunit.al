codeunit 50101 OnUpgradeCodeunit
{
    Subtype = Upgrade;


    trigger OnCheckPreconditionsPerCompany()
    var
        Customer: REcord Customer;
        Vendor: Record Vendor;
    begin
        // if Customer.IsEmpty then
        //     Error('You don`t have customers for this company');
        // if Vendor.IsEmpty then
        //     Error('You don`t have Vendors for this company');
    end;

    trigger OnCheckPreconditionsPerDatabase()
    var
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion = Version.Create(1, 1, 0, 0) then
                Error('This version is not compatible');
    end;

    trigger OnUpgradePerCompany()
    begin
        // TransferOldCustOrderLineToNew();
        // TransferOldPostedCustOrderLineToNew();
    end;

    trigger OnUpgradePerDatabase()
    var
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion = Version.Create(1, 1, 0, 0) then
                Error('Whatever here might be');
    end;

    trigger OnValidateUpgradePerCompany()
    var
    begin
        // CheckTransferOldCustOrderLineToNew();
        // CheckTransferOldPostedCustOrderLineToNew();
    end;

    trigger OnValidateUpgradePerDatabase()
    var
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion = Version.Create(1, 1, 0, 0) then
                Error('Whatever here might be');
    end;


    procedure TransferOldCustOrderLineToNew()
    var
        OldCustOrdLine: Record "Customer Order Line";
        NewCustOrdLine: Record "Customer Order Line New";
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion <> Version.Create(1, 5, 0, 0) then
                exit;

        OldCustOrdLine.Reset();
        if OldCustOrdLine.FindSet() then
            repeat
                NewCustOrdLine.Init();
                NewCustOrdLine."Item No" := OldCustOrdLine."Item No";
                NewCustOrdLine.Description := OldCustOrdLine.Description;
                NewCustOrdLine."Amount per Item" := OldCustOrdLine."Amount per Item";
                NewCustOrdLine."Order No" := OldCustOrdLine."Order No";
                NewCustOrdLine.Qty := OldCustOrdLine.Qty;
                NewCustOrdLine."Total Amount" := OldCustOrdLine."Total Amount";

                NewCustOrdLine.Insert();
            until OldCustOrdLine.Next() = 0;
    end;

    procedure TransferOldPostedCustOrderLineToNew()
    var
        OldCustOrdLine: Record "Posted Customer Order Line";
        NewCustOrdLine: Record "Posted Customer Order Line New";
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion <> Version.Create(1, 5, 0, 0) then
                exit;

        OldCustOrdLine.Reset();
        if OldCustOrdLine.FindSet() then
            repeat
                NewCustOrdLine.Init();
                NewCustOrdLine."Item No" := OldCustOrdLine."Item No";
                NewCustOrdLine.Description := OldCustOrdLine.Description;
                NewCustOrdLine."Amount per Item" := OldCustOrdLine."Amount per Item";
                NewCustOrdLine."Order No" := OldCustOrdLine."Order No";
                NewCustOrdLine.Qty := OldCustOrdLine.Qty;
                NewCustOrdLine."Total Amount" := OldCustOrdLine."Total Amount";

                NewCustOrdLine.Insert();
            until OldCustOrdLine.Next() = 0;
    end;



    procedure CheckTransferOldCustOrderLineToNew()
    var
        OldCustOrdLine: Record "Customer Order Line";
        NewCustOrdLine: Record "Customer Order Line New";
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion <> Version.Create(1, 5, 0, 0) then
                exit;

        OldCustOrdLine.Reset();
        if OldCustOrdLine.FindSet() then
            repeat
                NewCustOrdLine.SetRange("Order No", OldCustOrdLine."Order No");

                if not NewCustOrdLine.Find() then
                    Error(LinesDidntMoveErr);

            until OldCustOrdLine.Next() = 0;
    end;

    procedure CheckTransferOldPostedCustOrderLineToNew()
    var
        OldCustOrdLine: Record "Posted Customer Order Line";
        NewCustOrdLine: Record "Posted Customer Order Line New";
    begin
        if NavApp.GetCurrentModuleInfo(MyAppInfo) then
            if MyAppInfo.DataVersion <> Version.Create(1, 5, 0, 0) then
                exit;

        OldCustOrdLine.Reset();
        if OldCustOrdLine.FindSet() then
            repeat
                NewCustOrdLine.SetRange("Order No", OldCustOrdLine."Order No");

                if not NewCustOrdLine.Find() then
                    Error(LinesDidntMoveErr);

            until OldCustOrdLine.Next() = 0;
    end;

    var
        MyAppInfo: ModuleInfo;
        LinesDidntMoveErr: Label 'Lines Didn`t move';
}

codeunit 50100 OnInstallCodeunit
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        NavApp.GetCurrentModuleInfo(MyAppInfo);

        if MyAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then begin
            SetNoSeries();
            SetExtSetup();
        end;
    end;

    trigger OnInstallAppPerDatabase()
    begin
        NavApp.GetCurrentModuleInfo(MyAppInfo);

        if MyAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then begin

        end;
    end;

    local procedure SetExtSetup()
    begin
        if not MyExtSetUp.Get() then begin
            MyExtSetUp.Init();
            MyExtSetUp."Cust. Order" := 'CORD';
            MyExtSetUp."Post. Cust. Order" := 'POST-CORD';
            MyExtSetUp."Cust. Order Paymnet" := 'PAYM';
            MyExtSetUp.Insert();
        end;
    end;

    local procedure SetNoSeries()
    begin
        if not NoSeries.Get('CORD') then begin
            NoSeries.Init();
            NoSeries.Code := 'CORD';
            NoSeries.Validate("Default Nos.", true);
            NoSeries.Validate("Manual Nos.", true);

            if NoSeries.Insert() then begin
                NoSeriesLines.Init();
                NoSeriesLines."Series Code" := 'CORD';
                NoSeriesLines."Starting No." := 'CORD-000001';
                NoSeriesLines."Ending No." := 'CORD-999999';
                if NoSeriesLines.Insert() then;
            end;
        end;

        if not NoSeries.Get('POST-CORD') then begin
            NoSeries.Init();
            NoSeries.Code := 'POST-CORD';
            NoSeries.Validate("Default Nos.", true);
            NoSeries.Validate("Manual Nos.", true);

            if NoSeries.Insert() then begin
                NoSeriesLines.Init();
                NoSeriesLines."Series Code" := 'POST-CORD';
                NoSeriesLines."Starting No." := 'POST-CORD-000001';
                NoSeriesLines."Ending No." := 'POST-CORD-999999';
                if NoSeriesLines.Insert() then;
            end;
        end;

        if not NoSeries.Get('PAYM') then begin
            NoSeries.Init();
            NoSeries.Code := 'PAYM';
            NoSeries.Validate("Default Nos.", true);
            NoSeries.Validate("Manual Nos.", true);

            if NoSeries.Insert() then begin
                NoSeriesLines.Init();
                NoSeriesLines."Series Code" := 'PAYM';
                NoSeriesLines."Starting No." := 'PAYM-000001';
                NoSeriesLines."Ending No." := 'PAYM-999999';
                if NoSeriesLines.Insert() then;
            end;
        end;
    end;

    var
        MyAppInfo: ModuleInfo;
        NoSeries: Record "No. Series";
        NoSeriesLines: Record "No. Series Line";
        MyExtSetUp: Record "Extension Setup";
}

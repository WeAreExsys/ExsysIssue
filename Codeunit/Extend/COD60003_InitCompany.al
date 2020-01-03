codeunit 60003 InitCompany
{
    trigger OnRun()
    begin

    end;

    local procedure initExsysCue()
    var
        ExsysCue: Record "Exsys-Issue Cue";
    begin
        with ExsysCue do
            if not FindFirst then begin
                init;
                insert;
            end;
    end;

    local procedure initProjectManagementSetup()
    var
        ProjectMgtSetup: Record "Project Management Setup";
    begin
        with ProjectMgtSetup do
            if not FindFirst then begin
                init;
                insert;
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Company-Initialize", 'OnCompanyInitialize', '', false, false)]
    local procedure AfterInitCompany()

    begin
        initExsysCue();
        initProjectManagementSetup();

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnAfterCompanyOpen', '', true, true)]
    local procedure AfterLoginManagement()
    begin
        initExsysCue();
        initProjectManagementSetup();
    end;

    var
        myInt: Integer;
}
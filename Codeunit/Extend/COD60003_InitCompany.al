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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Company-Initialize", 'OnCompanyInitialize', '', false, false)]
    local procedure AfterInitCompany()

    begin
        initExsysCue();

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnAfterCompanyOpen', '', true, true)]
    local procedure AfterLoginManagement()
    begin
        initExsysCue();
    end;

    var
        myInt: Integer;
}
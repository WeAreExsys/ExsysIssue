codeunit 60004 "FTP URL"
{
    trigger OnRun()
    begin
        runninglink();
    end;

    local procedure runninglink()
    var
        myFTP: TextConst ENU = 'ftp://ftp.exsys.co.th';
    begin
        Hyperlink(myFTP);
    end;

    var
        myInt: Integer;
}
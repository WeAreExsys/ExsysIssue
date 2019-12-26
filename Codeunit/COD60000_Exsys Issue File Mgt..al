codeunit 60000 "Exsys Issue File Mgt."
{

    trigger OnRun();
    begin
    end;

    var
        issueline: Record "Issue Line";
        icount: Integer;
        xx: DateTime;
        TempBlob: Codeunit "Temp Blob";
        FileMgt: Codeunit "File Management";
        RecRef: RecordRef;
        myFieldRef: FieldRef;
        txt: Text;
        FileName: Text;

    procedure Upload_file(IssueNo: Code[10]);
    var
        IssueAttached: Record "Issue Attach File";
    begin
        FileName := '';
        IssueAttached.SETCURRENTKEY(IssueAttached."Issue No.", IssueAttached."Line No.");
        IssueAttached.SETRANGE("Issue No.", IssueNo);
        if IssueAttached.FINDLAST then
            IssueAttached."Line No." := IssueAttached."Line No." + 10000
        else
            IssueAttached."Line No." := 10000;

        IssueAttached."Issue No." := IssueNo;

        FileName := FileMgt.BLOBImport(TempBlob, '');
        TempBlob.ToRecordRef(RecRef, IssueAttached.FieldNo("Attached File"));
        myFieldRef := RecRef.Field(IssueAttached.FieldNo("Attached File"));
        IssueAttached."File Name" := FileName;
        IssueAttached."Creation Date" := CURRENTDATETIME;
        IssueAttached."Created By" := USERID;
        if FileName = '' then
            exit;

        IssueAttached."Attached File" := myFieldRef.Value;
        IssueAttached.INSERT;
    end;
}


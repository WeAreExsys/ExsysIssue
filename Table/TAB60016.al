table 60016 "Issue Attach File"
{

    fields
    {
        field(1; "Issue No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Path File"; Text[250])
        {
        }
        field(4; "Path File2"; Text[250])
        {
        }
        field(5; "Attached File"; BLOB)
        {
        }
        field(6; "File Name"; Text[250])
        {
        }
        field(7; "Creation Date"; DateTime)
        {
        }
        field(8; "Created By"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Issue No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //Exsys-Golf
        if "Created By" <> USERID then
            ERROR(Txt0001);

        //*
    end;

    var
        Txt0001: Label 'You don''t have permission';

    procedure ExportAttachedFile(ShowFileDialog: Boolean): Text;
    var
        TempBlobCU: Codeunit "Temp Blob";
        FileMgt: Codeunit "File Management";
    begin

        //Added by Exsys-CS 20151016
        CALCFIELDS("Attached File");
        if "Attached File".HASVALUE then begin
            TempBlobCU.FromRecord(Rec, FieldNo("Attached File"));
            exit(FileMgt.BLOBExport(TempBlobCU, "File Name", ShowFileDialog));
        end;
    end;
}


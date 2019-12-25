page 60024 "Issue Attach File"
{
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Issue Attach File";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Issue No.";"Issue No.")
                {
                    Editable = false;
                }
                field("Line No.";"Line No.")
                {
                    Editable = false;
                }
                field("File Name";"File Name")
                {
                    Editable = false;
                }
                field("Creation Date";"Creation Date")
                {
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup8)
            {
                action("Import File")
                {
                    Caption = 'Import File';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //Added by Exsys-CS 20151016
                        ExsysFileMgt.Upload_file("Issue No.")
                    end;
                }
                action("Export File")
                {
                    Caption = 'Export File';
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //Added by Exsys-CS 20151016
                        ExportAttachedFile(true);
                    end;
                }
                separator(Separator10)
                {
                }
                action("Upload File")
                {
                    Caption = 'Upload File';
                    Image = FileContract;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-Golf
                        CLEAR(FileMgt);
                        CLEAR(CommMgt);
                        IssueNotification.GET;
                        IssueNotification.TESTFIELD("Attach Path File");
                        PathFile := CommMgt.OpenFile('Save as','',0,'*.*',1);

                        //Find File Name
                        PathFileName := PathFile;
                        ExistFileName := false;
                        repeat
                          if STRPOS(PathFileName,'/') <> 0 then
                          begin
                            Position := STRPOS(PathFileName,'/');
                            PathFileName := COPYSTR(PathFileName,Position+1);
                          end else
                            ExistFileName := true;
                        until ExistFileName = true;

                        //Cut Folder Path File
                        Position := STRPOS(PathFile,PathFileName);
                        PathFile := COPYSTR(PathFile,1,Position-2);

                        //Upload File
                        UpToFile := IssueNotification."Attach Path File"+'/'+PathFileName;
                        UPLOAD('Upload',PathFile,'',PathFileName,UpToFile);

                        MESSAGE('Success');
                        //*
                    end;
                }
            }
        }
    }

    var
        FileMgt : Codeunit "File Management";
        IssueNotification : Record "Issue Notification";
        CommMgt : Codeunit Codeunit50000;
        PathFile : Text[1024];
        PathFileName : Text[100];
        Position : Integer;
        ExistFileName : Boolean;
        UpToFile : Text[1024];
        ExsysFileMgt : Codeunit "Exsys Issue File Mgt.";
}


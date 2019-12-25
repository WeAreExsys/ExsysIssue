page 60023 "Issue Notification"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Issue Notification";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Send E-Mail";"Send E-Mail")
                {
                }
                field("Attach Path File";"Attach Path File")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        FileMgt : Codeunit "File Management";
        TempBlob : Record TempBlob;
        FileName : Text[1024];
}


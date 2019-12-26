page 60028 "Change Request List"
{
    // version Issue

    CardPageID = "Change Request Document";
    Editable = false;
    PageType = List;
    SourceTable = "Change Request Header";
    SourceTableView = SORTING("No.")
                      WHERE(Holiday=CONST(false),
                            Leave=CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("No.";"No.")
                {
                }
                field(Type;Type)
                {
                }
                field("Project No.";"Project No.")
                {
                }
                field("Received From Customer Name";"Received From Customer Name")
                {
                }
                field("Chargable Usage Day";"Chargable Usage Day")
                {
                }
                field("Received Date";"Received Date")
                {
                }
                field(Status;Status)
                {
                }
                field("Issue No.";"Issue No.")
                {
                }
                field("Created to Issue";"Created to Issue")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    var
        NoFilter : Code[20];
}


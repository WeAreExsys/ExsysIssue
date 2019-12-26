page 60083 "My Project"
{
    PageType = ListPart;
    SourceTable = Project;
    SourceTableView = SORTING("No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Registered Date";"Registered Date")
                {
                }
                field(Status;Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}


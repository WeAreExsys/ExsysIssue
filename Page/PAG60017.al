page 60017 "Project Location"
{
    PageType = List;
    SourceTable = "Project Location";
    SourceTableView = SORTING("Project No.",Code);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
                field("Transportation Rate";"Transportation Rate")
                {
                }
            }
        }
    }

    actions
    {
    }
}


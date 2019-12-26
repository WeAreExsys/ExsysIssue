page 60019 "Project Location List"
{
    PageType = List;
    SourceTable = "Project Location";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No.";"Project No.")
                {
                }
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


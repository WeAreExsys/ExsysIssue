page 60004 "Project Phase List"
{
    // version Issue

    PageType = List;
    SourceTable = "Project Phase";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Ending Date";"Ending Date")
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
        area(creation)
        {
        }
    }
}


page 60059 "Localize Package List"
{
    // version Package License Localization

    CardPageID = "Localize Package";
    PageType = List;
    SourceTable = "Localize Package";

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
                field("Create By User";"Create By User")
                {
                }
                field("Create Date";"Create Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}


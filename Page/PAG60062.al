page 60062 "Localize Topic List"
{
    // version Package License Localization

    CardPageID = "Localize Topic";
    Editable = false;
    PageType = List;
    SourceTable = "Localize Topic";

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
            }
        }
    }

    actions
    {
    }
}


page 60061 "Localize Package subform"
{
    // version Package License Localization

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Localize Package Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Object Type";"Object Type")
                {
                }
                field("From ID";"From ID")
                {
                }
                field("To ID";"To ID")
                {
                }
            }
        }
    }

    actions
    {
    }
}


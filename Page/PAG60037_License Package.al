page 60037 "License Package"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "License Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Package No.";"Package No.")
                {
                }
                field("Package Name";"Package Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}


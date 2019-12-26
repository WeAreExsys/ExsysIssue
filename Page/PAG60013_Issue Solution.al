page 60013 "Issue Solution"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Issue Solutions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    Editable = false;
                    Visible = false;
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


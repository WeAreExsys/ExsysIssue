page 60018 "MA Subform"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "MA & Chargable Service";
    SourceTableView = SORTING("Issue No.","Project No.","Line No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                }
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


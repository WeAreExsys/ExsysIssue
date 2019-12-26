page 60036 "Exsys Fix bug List"
{
    CardPageID = "Exsys Fixbug Document";
    PageType = List;
    SourceTable = "Technical Log Header";
    SourceTableView = SORTING("Document Type","No.")
                      WHERE("Document Type"=CONST("Fix Bug"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field(Description;Description)
                {
                }
                field("Created By User ID";"Created By User ID")
                {
                }
            }
        }
    }

    actions
    {
    }
}


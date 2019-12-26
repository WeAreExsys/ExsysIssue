page 60033 "Exsys Localize List"
{
    CardPageID = "Exsys Localize Document";
    PageType = List;
    SourceTable = "Technical Log Header";
    SourceTableView = SORTING("Document Type","No.")
                      WHERE("Document Type"=CONST(Localize));

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


page 60052 "Document Homeroom List"
{
    CardPageID = "Document Homeroom";
    Editable = false;
    PageType = List;
    SourceTable = "Issue Header";
    SourceTableView = WHERE("Document Homeroom"=CONST(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No.";"No.")
                {
                }
                field("Document Date";"Document Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}


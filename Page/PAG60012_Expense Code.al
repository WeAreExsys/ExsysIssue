page 60012 "Expense Code"
{
    PageType = List;
    SourceTable = "Expense Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                }
                field(Description;Description)
                {
                }
                field("Transportation Rate";"Transportation Rate")
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
            }
        }
    }

    actions
    {
    }
}


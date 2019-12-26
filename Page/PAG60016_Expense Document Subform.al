page 60016 "Expense Documents Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Expense Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Code";"Expense Code")
                {
                }
                field(Description;Description)
                {
                }
                field("Project No.";"Project No.")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("From Date";"From Date")
                {
                }
                field("To Date";"To Date")
                {
                }
                field("Issue No.";"Issue No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit Amount";"Unit Amount")
                {
                }
                field(Amount;Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}


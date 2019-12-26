page 60084 "Exsys-Issue Expense"
{
    PageType = CardPart;
    SourceTable = "Exsys-Issue Cue";

    layout
    {
        area(content)
        {
            cuegroup(Control2)
            {
                field("Expense Doc.";"Expense Doc.")
                {
                    Caption = 'Expense Document';
                    DrillDownPageID = "Expense Document List";
                }
                field("Release Expense Document";"Release Expense Document")
                {
                    DrillDownPageID = "Release Expense Document";
                }
            }
        }
    }

    actions
    {
    }

    var
        TaskSetup : Integer;
}


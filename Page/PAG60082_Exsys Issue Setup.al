page 60082 "Exsys-Issue Setup"
{
    PageType = CardPart;
    SourceTable = "Exsys-Issue Cue";

    layout
    {
        area(content)
        {
            cuegroup(Control2)
            {
                field("Task Setup";"Task Setup")
                {
                    DrillDownPageID = "Task List";
                }
                field("Project Setup";"Project Setup")
                {
                    DrillDownPageID = "Project List";
                }
                field("Expense Code Setup";"Expense Code Setup")
                {
                    DrillDownPageID = "Expense Code";
                }
            }
            cuegroup("Other Setup")
            {
                Caption = 'Other Setup';
                field("Project Management Setup";"Project Management Setup")
                {
                    DrillDownPageID = "Project Management Setup";
                    Image = Checklist;
                }
                field("Company Infomation";"Company Infomation")
                {
                    DrillDownPageID = "Company Information";
                    Image = Checklist;
                }
                field("No. Series";"No. Series")
                {
                    DrillDownPageID = "No. Series";
                    Image = Checklist;
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


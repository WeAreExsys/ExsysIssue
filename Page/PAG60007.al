page 60007 "Issue Document Subform"
{
    // version Issue

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Issue Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    Visible = false;
                }
                field("Task No.";"Task No.")
                {
                }
                field("Task Description";"Task Description")
                {
                    StyleExpr = TRUE;
                }
                field("Assigned to User";"Assigned to User")
                {
                }
                field("Plan Start Date";"Plan Start Date")
                {
                }
                field("Plan Finished Date";"Plan Finished Date")
                {
                }
                field(Active;Active)
                {
                }
                field("Assigned by User";"Assigned by User")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        IssueLine : Record "Issue Line";
}


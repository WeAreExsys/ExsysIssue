page 60027 "Change Req Document Subform"
{
    // version Issue

    AutoSplitKey = true;
    Caption = 'Description of Requests';
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Change Request Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                }
                field("Task Description";"Task Description")
                {
                    StyleExpr = TRUE;
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


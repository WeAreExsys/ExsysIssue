page 60081 "Exsys-Issue Activities"
{
    // version Issue - Role Center Activities

    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Exsys-Issue Cue";

    layout
    {
        area(content)
        {
            cuegroup(Issues)
            {
                Caption = 'Issues';
                field("Issues List"; "Issues List")
                {
                    DrillDownPageID = "Issue List";
                }
                field("Issue-To Do"; "Issue-To Do")
                {
                    Caption = 'To Do';
                    Visible = false;
                }
                field(IssueByUser; IssueByUser)
                {
                    Caption = 'In Process';
                    DrillDownPageID = "Issue by User";
                    Visible = false;
                }
                field("Issue-Close"; "Issue-Close")
                {
                    Caption = 'Done';
                    Visible = false;
                }
                field("Your Task"; "Your Task")
                {
                    Image = Checklist;
                    Visible = false;

                    trigger OnDrillDown();
                    begin
                        PAGE.RUN(60056);
                    end;
                }
                field("Change Request Document"; "Change Request Document")
                {
                    Image = Checklist;

                    trigger OnDrillDown();
                    begin
                        PAGE.RUN(60028);
                    end;
                }

                actions
                {
                    action("New Issues")
                    {
                        RunObject = Page "Issue Document";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("MA & Expense")
            {
                Caption = 'Maintenance Plan';
                field("MA List"; "MA List")
                {
                    DrillDownPageID = "MA List";
                }

                actions
                {
                    action("New Expense Document")
                    {
                        RunObject = Page "Expense Document";
                        RunPageMode = Create;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        CalculateCueFieldValue;
    end;

    trigger OnInit();
    begin
        //
    end;

    trigger OnOpenPage();
    begin
        SETFILTER(UserFilter, USERID);
    end;

    local procedure CalculateCueFieldValue();
    begin
        IssueByUser := CalcListByUser;
    end;
}


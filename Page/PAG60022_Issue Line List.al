page 60022 "Issue Line List"
{
    PageType = List;
    SourceTable = "Issue Line";
    SourceTableView = SORTING("Issue No.","Task No.","Line No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Issue No.";"Issue No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Project No.";"Project No.")
                {
                }
                field("Issue Description";"Issue Description")
                {
                }
                field("Task No.";"Task No.")
                {
                }
                field("Task Description";"Task Description")
                {
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
                field("Actual Start Date";"Actual Start Date")
                {
                }
                field("Actual Finished Date";"Actual Finished Date")
                {
                }
                field(Active;Active)
                {
                }
                field("Assigned by User";"Assigned by User")
                {
                }
                field("Required Sign-off";"Required Sign-off")
                {
                }
                field(Onsite;Onsite)
                {
                }
                field("Commit Date";"Commit Date")
                {
                }
                field("Delivery Date";"Delivery Date")
                {
                }
                field(Department;Department)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Issue Document")
            {
                Image = DocumentEdit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    //Exsys-Wichit 070915
                    IssueHeader.SETRANGE("No.","Issue No.");
                    CLEAR(PageIssueDoc);
                    PageIssueDoc.SETTABLEVIEW(IssueHeader);
                    PageIssueDoc.RUN;
                    //+
                end;
            }
        }
    }

    var
        IssueHeader : Record "Issue Header";
        PageIssueDoc : Page "Issue Document";
}


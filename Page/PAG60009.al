page 60009 "Issue by User"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Issue Line";
    SourceTableView = SORTING("Assigned to User","Plan Start Date","Plan Finished Date")
                      WHERE(Active=CONST(true),
                            closed=CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Issue No.";"Issue No.")
                {
                    Editable = false;
                }
                field("Issue Description";"Issue Description")
                {
                }
                field("Task No.";"Task No.")
                {
                    Editable = false;
                }
                field("Task Description";"Task Description")
                {
                    Editable = false;
                }
                field("Assigned to User";"Assigned to User")
                {
                }
                field("Plan Start Date";"Plan Start Date")
                {
                    Editable = false;
                }
                field("Plan Finished Date";"Plan Finished Date")
                {
                    Editable = false;
                }
                field("Actual Start Date";"Actual Start Date")
                {
                }
                field("Actual Finished Date";"Actual Finished Date")
                {
                }
                field(Active;Active)
                {
                    Editable = false;
                }
                field("Assigned by User";"Assigned by User")
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

    trigger OnModifyRecord() : Boolean;
    begin
        TESTFIELD("Assigned by User",USERID);
    end;

    trigger OnOpenPage();
    begin
        //Exsys-Wichit 030915
        SETRANGE("Assigned to User",USERID);
        CurrPage.UPDATE;
        //+
    end;

    var
        IssueHeader : Record "Issue Header";
        PageIssueDoc : Page "Issue Document";
}


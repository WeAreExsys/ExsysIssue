page 60020 "Release Expense Document"
{
    CardPageID = "Expense Document";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Expense Header";
    SourceTableView = SORTING("No.")
                      WHERE(Status=CONST(Release));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Requested by";"Requested by")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field(Status;Status)
                {
                }
                field(Paid;Paid)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Reopen)
            {
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    //Exsys-Wichit 070915
                    if not CONFIRM('Do you want to Reopen Expense Document No.%1',false,"No.") then
                      exit;

                    Status := Status::Open;
                    CurrPage.UPDATE(true);
                    //+
                end;
            }
        }
    }
}


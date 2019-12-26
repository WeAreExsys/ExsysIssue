page 60014 "Expense Document List"
{
    CardPageID = "Expense Document";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Expense Header";
    SourceTableView = SORTING("Document Date")
                      ORDER(Descending);

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

    trigger OnOpenPage();
    begin
        //Exsys-Golf 240915
        FILTERGROUP(2);
        SETRANGE("Requested by",USERID);
        FILTERGROUP(0);
        //*
    end;
}


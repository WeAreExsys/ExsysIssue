page 60002 "Project List"
{
    // version Issue

    CardPageID = "Project Card";
    Editable = false;
    PageType = List;
    SourceTable = Project;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field(Name; Name)
                {
                }
                field("Registered Date"; "Registered Date")
                {
                }
                field(Status; Status)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Phase)
            {
                Image = Task;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Phase List";
                RunPageLink = "Project No." = FIELD("No.");
            }
            action(Location)
            {
                Image = Bin;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Location";
                RunPageLink = "Project No." = FIELD("No.");
            }
            action("License Package")
            {
                Image = SetupLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "License Package";
                RunPageLink = "Project No." = FIELD("No.");
            }
            /*
            action("Export License Package")
            {
                Image = Excel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction();
                var
                    SQLConnection : Codeunit "SQL Connection";
                begin
                    //Exsys-Wichit 180118
                    CLEAR(SQLConnection);
                    SQLConnection.ShowObjList(Rec);
                    //+
                end;
            }*/

            separator(Separator12)
            {
            }
            action("MA Plan")
            {
                Image = MaintenanceLedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "MA List";
                RunPageLink = "Project No." = FIELD("No.");
            }
        }
    }
}


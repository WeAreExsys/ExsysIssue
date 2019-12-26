page 60003 "Project Card"
{
    // version Issue

    PageType = Card;
    SourceTable = Project;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Registered Date";"Registered Date")
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
        area(creation)
        {
            action(Phase)
            {
                Image = Task;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Phase List";
                RunPageLink = "Project No."=FIELD("No.");
            }
            action(Location)
            {
                Image = Bin;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Project Location";
                RunPageLink = "Project No."=FIELD("No.");
            }
            separator(Separator10)
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
                RunPageLink = "Project No."=FIELD("No.");
            }
        }
    }
}


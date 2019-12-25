page 60010 "Issue List"
{
    // version Issue

    CardPageID = "Issue Document";
    Editable = false;
    PageType = List;
    SourceTable = "Issue Header";
    SourceTableView = SORTING("No.")
                      WHERE(Holiday=CONST(false),
                            Leave=CONST(false),
                            "Document Homeroom"=CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("No.";"No.")
                {
                }
                field(Type;Type)
                {
                }
                field(Description;Description)
                {
                }
                field("Project No.";"Project No.")
                {
                }
                field("MA No.";"MA No.")
                {
                }
                field("Ref. Issue No.";"Ref. Issue No.")
                {
                }
                field("Change Request No.";"Change Request No.")
                {
                }
                field("Service Log Sheet No.";"Service Log Sheet No.")
                {
                }
                field("MA Usage Day";"MA Usage Day")
                {
                }
                field("Chargable Usage Day";"Chargable Usage Day")
                {
                }
                field("Received Date";"Received Date")
                {
                }
                field("Expected Starting Date";"Expected Starting Date")
                {
                }
                field("Expected Finished Date";"Expected Finished Date")
                {
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                }
                field("Current User";"Current User")
                {
                }
                field("Current Task";"Current Task")
                {
                }
                field("Current Start Date";"Current Start Date")
                {
                }
                field("Current Finished Date";"Current Finished Date")
                {
                }
                field("Actual Start Date";"Actual Start Date")
                {
                }
                field("Actual Finished Date";"Actual Finished Date")
                {
                }
                field(Status;Status)
                {
                }
                field(Onsite;Onsite)
                {
                }
                field(Closed;Closed)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup27)
            {
                action(Holiday)
                {
                    Caption = 'Holiday';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Issue Document";
                    RunPageView = SORTING("No.")
                                  WHERE(Holiday=CONST(true));
                }
                action(Leave)
                {
                    Caption = 'Leave';
                    Image = AbsenceCalendar;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Issue Document";
                    RunPageView = SORTING("No.")
                                  WHERE(Leave=CONST(true));
                }
            }
        }
    }

    var
        NoFilter : Code[20];
}


page 60000 "MA List"
{
    // version Issue

    CardPageID = "MA Card";
    Editable = false;
    PageType = List;
    SourceTable = "Maintenance Agreement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Project No.";"Project No.")
                {
                }
                field(Note;Note)
                {
                }
                field(Status;Status)
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field("Ending Date (MA)";"Ending Date (MA)")
                {
                }
                field("MA Day";"MA Day")
                {
                }
                field("Usage Day";"Usage Day")
                {
                }
                field("MA Remaining";"MA Remaining")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        //Exsys-Wichit 220915
        CALCFIELDS("Usage Day");
        "MA Remaining" := "MA Day" - "Usage Day";
        //+
    end;
}


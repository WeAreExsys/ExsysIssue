page 60001 "MA Card"
{
    // version Issue

    PageType = Card;
    SourceTable = "Maintenance Agreement";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        //Exsys-Wichit 160615
                        if AssistEdit(xRec) then
                          CurrPage.UPDATE;
                        //+
                    end;
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


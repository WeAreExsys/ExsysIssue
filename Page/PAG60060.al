page 60060 "Localize Package"
{
    // version Package License Localization

    PageType = Card;
    SourceTable = "Localize Package";

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
                        if AssistEdit(xRec) then
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Create By User";"Create By User")
                {
                    Editable = false;
                }
                field("Create Date";"Create Date")
                {
                }
            }
            part(Control5;"Localize Package subform")
            {
                SubPageLink = "No."=FIELD("No.");
                SubPageView = SORTING("No.","Topic No.");
            }
        }
    }

    actions
    {
    }
}


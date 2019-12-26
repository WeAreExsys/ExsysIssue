page 60053 "Document Homeroom"
{
    PageType = Document;
    SourceTable = "Issue Header";

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
                field("Document Date";"Document Date")
                {
                }
            }
            part(Control5;"Document Homeroom subform")
            {
                SubPageLink = "Issue No."=FIELD("No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //Exsys-Golf
        "Document Homeroom" := true;
        //*
    end;
}


page 60031 "Exsys Localize Document"
{
    RefreshOnActivate = true;
    SourceTable = "Technical Log Header";
    SourceTableView = SORTING("Document Type","No.")
                      WHERE("Document Type"=CONST(Localize));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        ///Exsys-Wichit 160615
                        if AssistEdit(xRec) then
                          CurrPage.UPDATE;
                        //+
                    end;
                }
                field("Document Date";"Document Date")
                {
                }
                field(Description;Description)
                {
                }
                field("Created By User ID";"Created By User ID")
                {
                    Editable = false;
                }
            }
            part(Control7;"Exsys Localize Subform")
            {
                SubPageLink = "Document Type"=FIELD("Document Type"),
                              "Document No."=FIELD("No.");
            }
        }
    }

    actions
    {
    }
}


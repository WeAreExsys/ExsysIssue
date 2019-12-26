page 60015 "Expense Document"
{
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Expense Header";

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
                field("Requested by";"Requested by")
                {
                    Editable = false;
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
                field("Total Amount";"Total Amount")
                {
                }
            }
            part(Control7;"Expense Documents Subform")
            {
                SubPageLink = "Document No."=FIELD("No.");
                SubPageView = SORTING("Document No.","Line No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Expense Document")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    //Exsys-Wichit 22095
                    CurrPage.SETSELECTIONFILTER(Rec);
                    REPORT.RUN(REPORT::"Expense Document",true,false,Rec);
                    //+
                end;
            }
        }
    }
}


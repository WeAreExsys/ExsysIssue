page 60054 "Document Homeroom subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Issue Line";
    SourceTableView = SORTING("Issue No.","Line No.")
                      WHERE("Document Homeroom"=CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    Editable = false;
                }
                field("Assigned to User";"Assigned to User")
                {
                    Caption = 'Reponsibility';
                }
                field("Select Project No.";"Select Project No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Plan Start Date";"Plan Start Date")
                {
                    ShowMandatory = true;
                }
                field("Plan Finished Date";"Plan Finished Date")
                {
                    ShowMandatory = true;
                }
                field(Remark;Remark)
                {
                }
                field(closed;closed)
                {
                    Editable = false;
                }
                field("Actual Finished Date";"Actual Finished Date")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Function")
            {
                Caption = 'Function';
                action("Import External Document")
                {
                    Caption = 'Import External Document';
                    Image = ImportDatabase;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //Exsys-GOlf
                        CLEAR(InputDialog);
                        InputDialog.LOOKUPMODE(true);
                        if InputDialog.RUNMODAL = ACTION::LookupOK then
                          InputDialog.ReturnValue(ReponseCode)
                        else
                          exit;

                        if ReponseCode = '' then
                          ERROR('You must specify Reponsibility first !!');

                        CLEAR(ImportExternal);
                        ImportExternal.SetProperties("Issue No.",ReponseCode);
                        ImportExternal.RUN;
                        CurrPage.UPDATE(false);
                        //*
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        //Exsys-Golf
        TESTFIELD("Assigned to User");
        TESTFIELD("Plan Start Date");
        TESTFIELD("Plan Finished Date");
        //*
    end;

    var
        ImportExternal : XMLport "Import External Homeroom Doc.";
        ReponseCode : Code[80];
        InputDialog : Page "Req. Page for Import Homeroom";
}


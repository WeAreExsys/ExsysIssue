page 60057 "Tracking Working on Your Team"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Issue Line";
    SourceTableView = SORTING("Issue No.","Line No.")
                      WHERE("Document Homeroom"=CONST(true));

    layout
    {
        area(content)
        {
            group(Control13)
            {
                field(OpenOnly;OpenOnly)
                {
                    Caption = 'Open';

                    trigger OnValidate();
                    begin
                        UpdateClose;
                        CurrPage.UPDATE(false);
                    end;
                }
            }
            repeater(Group)
            {
                Editable = false;
                field(closed;closed)
                {
                    Caption = 'Finished';
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field("Assigned to User";"Assigned to User")
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field("Line No.";"Line No.")
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field("Select Project No.";"Select Project No.")
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field(Description;Description)
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field("Plan Start Date";"Plan Start Date")
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field("Plan Finished Date";"Plan Finished Date")
                {
                    Editable = false;
                    StyleExpr = ForeTxt;
                }
                field("Actual Finished Date";"Actual Finished Date")
                {
                }
                field(Remark;Remark)
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
        if ("Plan Finished Date" < CURRENTDATETIME) and (not closed) then
          ForeTxt := 'Attention'
        else
          ForeTxt := 'Standard';
    end;

    trigger OnOpenPage();
    begin
        FILTERGROUP(2);
        SETRANGE("Create By",USERID);
        FILTERGROUP(0);
        OpenOnly := true;
        UpdateClose;
    end;

    var
        ForeTxt : Text[50];
        OpenOnly : Boolean;

    local procedure UpdateClose();
    begin
        if not OpenOnly then
          SETRANGE(closed)
        else
          SETRANGE(closed,false);
    end;
}


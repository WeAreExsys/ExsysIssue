page 60056 "Update Your Task"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Issue Line";
    SourceTableView = SORTING("Issue No.","Line No.")
                      WHERE("Document Homeroom"=CONST(true),
                            closed=CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Date";"Document Date")
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
                    StyleExpr = ForeTxt;
                }
                field(closed;closed)
                {
                    Caption = 'Finished';

                    trigger OnValidate();
                    begin
                        if "Actual Finished Date" = 0DT then
                          "Actual Finished Date" := CURRENTDATETIME;
                        CurrPage.UPDATE(true);
                    end;
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
        if "Plan Finished Date" < CURRENTDATETIME then
          ForeTxt := 'Attention'
        else
          ForeTxt := 'Standard';
    end;

    trigger OnOpenPage();
    begin
        FILTERGROUP(2);
        SETRANGE("Assigned to User",USERID);
        FILTERGROUP(0);
    end;

    var
        ForeTxt : Text[50];
}


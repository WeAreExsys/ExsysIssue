xmlport 60000 "Import External Homeroom Doc."
{
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(IntegerRec; Integer)
            {
                AutoSave = false;
                XmlName = 'IntegerRec';
                UseTemporary = true;
                textelement(ProjectNo)
                {
                }
                textelement(DescriptionTxt)
                {
                }
                textelement(PlanStartDate)
                {
                }
                textelement(PlanEndingDate)
                {
                }
                textelement(RemarkTxt)
                {
                }

                trigger OnAfterInsertRecord();
                begin
                    //Exsys-Golf
                    IF NOT HeaderRow THEN
                        InsertIssueLine;
                    HeaderRow := FALSE;

                    //*
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnInitXmlPort();
    begin
        HeaderRow := TRUE;
    end;

    trigger OnPostXmlPort();
    begin
        Window.CLOSE;
    end;

    trigger OnPreXmlPort();
    begin
        IF DocNo = '' THEN
            ERROR('You must set document No. in properties function !!');

        IF ReponseCode = '' THEN
            ERROR('You must specify Reponsibility first ');
        Window.OPEN('Importing Document');
    end;

    var
        DocNo: Code[20];
        IssueLine: Record "Issue Line";
        ReponseCode: Code[80];
        NextLineNo: Integer;
        Window: Dialog;
        HeaderRow: Boolean;
        varDate: Date;
        TmpTxt: Text[30];

    procedure SetProperties(var PassDocNo: Code[20]; var PassReponseCocde: Code[80]);
    begin
        //Exsys-Golf
        DocNo := PassDocNo;
        ReponseCode := PassReponseCocde;
        //*
    end;

    local procedure InsertIssueLine();
    begin
        //Exsys-Golf
        IF (PlanStartDate = '') OR (PlanEndingDate = '') THEN
            ERROR('Plan Start date or Plan Ending Date must have a value');

        IssueLine.RESET;
        IssueLine.SETRANGE("Issue No.", DocNo);
        IF IssueLine.FINDLAST THEN
            NextLineNo := IssueLine."Line No." + 10000
        ELSE
            NextLineNo := 10000;

        IssueLine.RESET;
        IssueLine.INIT;
        IssueLine."Issue No." := DocNo;
        IssueLine."Line No." := NextLineNo;
        IssueLine."Assigned to User" := ReponseCode;
        IssueLine.VALIDATE("Select Project No.", ProjectNo);
        IssueLine.Description := DescriptionTxt;
        EVALUATE(varDate, PlanStartDate);
        varDate := DMY2DATE(DATE2DMY(varDate, 1), DATE2DMY(varDate, 2), (DATE2DMY(varDate, 3) + 543)); //Convert Year 543
        IssueLine."Plan Start Date" := CREATEDATETIME(varDate, 0T);
        EVALUATE(varDate, PlanEndingDate);
        varDate := DMY2DATE(DATE2DMY(varDate, 1), DATE2DMY(varDate, 2), (DATE2DMY(varDate, 3) + 543)); //Convert Year 543
        IssueLine."Plan Finished Date" := CREATEDATETIME(varDate, 0T);
        IssueLine.Remark := RemarkTxt;
        IssueLine.INSERT(TRUE);
        //*
    end;
}


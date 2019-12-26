page 60050 "Resource Usage"
{
    // version Issue

    Caption = 'Resource Usage';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = ListPlus;
    SaveValues = true;
    SourceTable = "User Setup";

    layout
    {
        area(content)
        {
            group("Matrix Options")
            {
                Caption = 'Matrix Options';
                field(PeriodType;PeriodType)
                {
                    Caption = 'View by';
                    Editable = false;
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';

                    trigger OnValidate();
                    begin
                        SetColumns(SetWanted::Initial);
                        UpdateMatrixSubform;
                    end;
                }
                field("Active type";ActiveType)
                {
                    Caption = 'Active';

                    trigger OnValidate();
                    begin
                        UpdateMatrixSubform;
                    end;
                }
                field(Closed;ClosedOption)
                {
                    Caption = 'Is Closed?';

                    trigger OnValidate();
                    begin
                        UpdateMatrixSubform;
                    end;
                }
                field(QtyType;QtyType)
                {
                    Caption = 'View as';
                    OptionCaption = 'Net Change,Balance at Date';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        UpdateMatrixSubform;
                    end;
                }
            }
            part(MatrixForm;"Resource Usage Matrix")
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Previous Set")
            {
                Caption = 'Previous Set';
                Image = PreviousSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    SetColumns(SetWanted::Previous);
                    UpdateMatrixSubform;
                end;
            }
            action("Previous Column")
            {
                Caption = 'Previous Column';
                Image = PreviousRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    SetColumns(SetWanted::PreviousColumn);
                    UpdateMatrixSubform;
                end;
            }
            action("Next Column")
            {
                Caption = 'Next Column';
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    SetColumns(SetWanted::NextColumn);
                    UpdateMatrixSubform;
                end;
            }
            action("Next Set")
            {
                Caption = 'Next Set';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    SetColumns(SetWanted::Next);
                    UpdateMatrixSubform;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        SetColumns(SetWanted::Initial);
        UpdateMatrixSubform;
    end;

    var
        MatrixRecords : array [32] of Record Date;
        PeriodType : Option Day,Week,Month,Quarter,Year,"Accounting Period";
        QtyType : Option "Net Change","Balance at Date";
        MatrixColumnCaptions : array [32] of Text[1024];
        ColumnSet : Text[1024];
        SetWanted : Option Initial,Previous,Same,Next,PreviousColumn,NextColumn;
        PKFirstRecInCurrSet : Text[100];
        CurrSetLength : Integer;
        Leave : Boolean;
        Onsite : Boolean;
        ActiveType : Option All,Yes,No;
        ClosedOption : Option All,Yes,No;

    procedure SetColumns(SetWanted : Option Initial,Previous,Same,Next,PreviousColumn,NextColumn);
    var
        MatrixMgt : Codeunit "Matrix Management";
    begin
        MatrixMgt.GeneratePeriodMatrixData(SetWanted,12,false,PeriodType,'',
          PKFirstRecInCurrSet,MatrixColumnCaptions,ColumnSet,CurrSetLength,MatrixRecords);
    end;

    procedure UpdateMatrixSubform();
    begin
        CurrPage.MatrixForm.PAGE.Load(PeriodType,QtyType,MatrixColumnCaptions,MatrixRecords,CurrSetLength,ActiveType,ClosedOption);
        CurrPage.UPDATE(false);
    end;
}


page 60051 "Resource Usage Matrix"
{
    // version Issue

    Caption = 'Resource Usage Matrix';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "User Setup";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                FreezeColumn = "Full Name";
                field("User ID"; "User ID")
                {
                    Importance = Promoted;
                    Width = 30;

                }
                field("Full Name"; "Full Name")
                {
                }
                field(Field1; MATRIX_CellData[1])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[1];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText1;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(1)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[2];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText2;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(2)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[3];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText3;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(3)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[4];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText4;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(4)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[5];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText5;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(5)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[6];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText6;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(6)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[7];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText7;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(7)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[8];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText8;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(8)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[9];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText9;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(9)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[10];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText10;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(10)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[11];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText11;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(11)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    //BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[12];
                    //DecimalPlaces = 0:0;
                    Editable = false;
                    StyleExpr = StyleText12;

                    trigger OnDrillDown();
                    begin
                        MatrixOnDrillDown(12)
                    end;

                    trigger OnValidate();
                    begin
                        ValidateCapacity(12);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Resource")
            {
                Caption = '&Resource';
                Image = Resource;
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "User Setup";
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    var
        MATRIX_CurrentColumnOrdinal: Integer;
    begin
        MATRIX_CurrentColumnOrdinal := 0;
        while MATRIX_CurrentColumnOrdinal < MATRIX_NoOfMatrixColumns do begin
            MATRIX_CurrentColumnOrdinal := MATRIX_CurrentColumnOrdinal + 1;
            MATRIX_OnAfterGetRecord(MATRIX_CurrentColumnOrdinal);
        end;
    end;

    trigger OnInit();
    begin
        ClearStyleText;
    end;

    var
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        QtyType: Option "Net Change","Balance at Date";
        MatrixRecords: array[32] of Record Date;
        MATRIX_NoOfMatrixColumns: Integer;
        MATRIX_CellData: array[32] of Text[500];
        MATRIX_ColumnCaption: array[32] of Text[1024];
        setTextStyle: Text[20];
        varStyleText: array[12] of Text[20];
        StyleText1: Text[20];
        StyleText2: Text[20];
        StyleText3: Text[20];
        StyleText4: Text[20];
        StyleText5: Text[20];
        StyleText6: Text[20];
        StyleText7: Text[20];
        StyleText8: Text[20];
        StyleText9: Text[20];
        StyleText10: Text[20];
        StyleText11: Text[20];
        StyleText12: Text[20];
        StyleTextLeave: Text[20];
        StyleTextOnsite: Text[20];
        ActiveType: Option All,Yes,No;
        varDateTime: DateTime;
        ok: Boolean;
        ClosedOption: Option All,Yes,No;
        StyleTextHoliday: Text[20];

    local procedure SetDateFilter(ColumnID: Integer);
    begin
        if MatrixRecords[ColumnID]."Period Start" = MatrixRecords[ColumnID]."Period End" then
            SETRANGE("Date Filter", MatrixRecords[ColumnID]."Period Start")
        else
            SETRANGE("Date Filter", MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End");

        if ActiveType = ActiveType::Yes then
            SETRANGE("Active Filter", true)
        else
            if ActiveType = ActiveType::No then
                SETRANGE("Active Filter", false)
            else
                SETRANGE("Active Filter");


        if ClosedOption = ClosedOption::Yes then
            SETRANGE("Closed Filter", true)
        else
            if ClosedOption = ClosedOption::No then
                SETRANGE("Closed Filter", false)
            else
                SETRANGE("Closed Filter");
    end;

    local procedure MATRIX_OnAfterGetRecord(ColumnID: Integer);
    var
        IssueLine: Record "Issue Line";
        iCount: Integer;
        IssueLine2: Record "Issue Line";
        varIsNotFoundLeave: Boolean;
        varIsNotFoundOnsite: Boolean;
        varIsNotFoundHoliday: Boolean;
        i: Integer;
    begin
        //SetDateFilter(ColumnID);
        //CALCFIELDS(Capacity);
        //IF Capacity <> 0 THEN
        //  MATRIX_CellData[ColumnID] := Capacity
        //ELSE
        //  MATRIX_CellData[ColumnID] := 0;


        SetDateFilter(ColumnID);
        IssueLine.RESET;
        IssueLine.SETCURRENTKEY("Assigned to User", "Plan Start Date", "Plan Finished Date");
        IssueLine.SETRANGE(IssueLine."Assigned to User", "User ID");
        //IssueLine.SETFILTER("Plan Start Date",'<='+GETFILTER("Date Filter") );
        //Exsys-Golf Comment

        IssueLine.SETFILTER("Plan Start Date", '<=' + FORMAT(CREATEDATETIME(MatrixRecords[ColumnID]."Period Start", 235900T)));
        IssueLine.SETFILTER("Plan Finished Date", '>=' + GETFILTER("Date Filter"));
        //Exsys-Golf 260417
        //issueLine.SETFILTER("Document Date",GETFILTER("Date Filter"));
        //*
        IssueLine.SETFILTER(Status, '<>%1', IssueLine.Status::Cancel);
        IssueLine.SETFILTER(Active, GETFILTER("Active Filter"));
        IssueLine.SETFILTER(closed, GETFILTER("Closed Filter"));
        iCount := IssueLine.COUNT;
        //Exsys-Golf Comment 201015
        //MATRIX_CellData[ColumnID] :=iCount ;//Usage
        if iCount <> 0 then
            MATRIX_CellData[ColumnID] := FORMAT(iCount) //Usage
        else
            MATRIX_CellData[ColumnID] := '';
        //*

        IssueLine.SETRANGE(Leave, true);
        varIsNotFoundLeave := IssueLine.ISEMPTY;

        //Exsys-Golf 201015
        if not varIsNotFoundLeave then
            MATRIX_CellData[ColumnID] := 'LEAVE' + ' ' + '(' + MATRIX_CellData[ColumnID] + ')';
        //*

        IssueLine.SETRANGE(Leave);

        IssueLine.SETRANGE(Onsite, true);
        varIsNotFoundOnsite := IssueLine.ISEMPTY;
        //Exsys-Golf 201015
        if varIsNotFoundLeave and (not varIsNotFoundOnsite) then
            MATRIX_CellData[ColumnID] := 'Onsite' + ' ' + '(' + MATRIX_CellData[ColumnID] + ')';
        //*

        //Exsys-Golf 201015 Holiday
        IssueLine.SETRANGE(Active);
        IssueLine.SETRANGE(closed);
        IssueLine.SETRANGE("Assigned to User");
        IssueLine.SETRANGE(Onsite);
        IssueLine.SETRANGE(Holiday, true);
        varIsNotFoundHoliday := IssueLine.ISEMPTY;
        if varIsNotFoundLeave and
           varIsNotFoundOnsite and
           (not varIsNotFoundHoliday) then begin
            IssueLine.FINDFIRST;
            MATRIX_CellData[ColumnID] := IssueLine."Task Description" + ' ' + '(' + MATRIX_CellData[ColumnID] + ')';
        end;
        //*

        //IssueLine2.RESET;
        //IssueLine2.SETCURRENTKEY ("Assigned to User","Plan Start Date","Plan Finished Date");
        //IssueLine2.SETRANGE("Assigned to User","User ID");
        ////IssueLine2.SETFILTER("Plan Start Date",'<='+GETFILTER("Date Filter") );
        //IssueLine2.SETFILTER("Plan Start Date",'<='+FORMAT(CREATEDATETIME(MatrixRecords[ColumnID]."Period Start",235900T)));
        //IssueLine2.SETFILTER("Plan Finished Date",'>='+GETFILTER("Date Filter") );
        //IssueLine2.SETFILTER(Active,GETFILTER("Active Filter") );
        //IssueLine2.SETRANGE(Leave,TRUE);
        //varIsNotFoundLeave := IssueLine2.ISEMPTY;

        //IssueLine2.RESET;
        //IssueLine2.SETCURRENTKEY ("Assigned to User","Plan Start Date","Plan Finished Date");
        //IssueLine2.SETRANGE("Assigned to User","User ID");
        //IssueLine2.SETFILTER("Plan Start Date",'<='+FORMAT(CREATEDATETIME(MatrixRecords[ColumnID]."Period Start",235900T)));
        //IssueLine2.SETFILTER("Plan Finished Date",'>='+GETFILTER("Date Filter") );
        //IssueLine2.SETFILTER(Active,GETFILTER("Active Filter") );
        //IssueLine2.SETRANGE(Onsite,TRUE);
        //varIsNotFoundOnsite := IssueLine2.ISEMPTY;

        StyleTextLeave := 'Unfavorable';
        StyleTextOnsite := 'Favorable';
        StyleTextHoliday := 'Ambiguous';
        //StyleTextOnsite := 'StrongAccent';

        if ColumnID = 1 then if not varIsNotFoundLeave then StyleText1 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText1 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText1 := StyleTextHoliday else StyleText1 := 'Normal';
        if ColumnID = 2 then if not varIsNotFoundLeave then StyleText2 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText2 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText2 := StyleTextHoliday else StyleText2 := 'Normal';
        if ColumnID = 3 then if not varIsNotFoundLeave then StyleText3 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText3 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText3 := StyleTextHoliday else StyleText3 := 'Normal';
        if ColumnID = 4 then if not varIsNotFoundLeave then StyleText4 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText4 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText4 := StyleTextHoliday else StyleText4 := 'Normal';
        if ColumnID = 5 then if not varIsNotFoundLeave then StyleText5 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText5 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText5 := StyleTextHoliday else StyleText5 := 'Normal';
        if ColumnID = 6 then if not varIsNotFoundLeave then StyleText6 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText6 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText6 := StyleTextHoliday else StyleText6 := 'Normal';
        if ColumnID = 7 then if not varIsNotFoundLeave then StyleText7 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText7 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText7 := StyleTextHoliday else StyleText7 := 'Normal';
        if ColumnID = 8 then if not varIsNotFoundLeave then StyleText8 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText8 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText8 := StyleTextHoliday else StyleText8 := 'Normal';
        if ColumnID = 9 then if not varIsNotFoundLeave then StyleText9 := StyleTextLeave else if not varIsNotFoundOnsite then StyleText9 := StyleTextOnsite else if not varIsNotFoundHoliday then StyleText9 := StyleTextHoliday else StyleText9 := 'Normal';
        if ColumnID = 10 then
            if not varIsNotFoundLeave then
                StyleText10 := StyleTextLeave else
                if not varIsNotFoundOnsite then
                    StyleText10 := StyleTextOnsite
                else
                    if not varIsNotFoundHoliday then StyleText10 := StyleTextHoliday else StyleText10 := 'Normal';
        if ColumnID = 11 then
            if not varIsNotFoundLeave then
                StyleText11 := StyleTextLeave else
                if not varIsNotFoundOnsite then
                    StyleText11 := StyleTextOnsite
                else
                    if not varIsNotFoundHoliday then StyleText11 := StyleTextHoliday else StyleText11 := 'Normal';
        if ColumnID = 12 then
            if not varIsNotFoundLeave then
                StyleText12 := StyleTextLeave else
                if not varIsNotFoundOnsite then
                    StyleText12 := StyleTextOnsite
                else
                    if not varIsNotFoundHoliday then StyleText12 := StyleTextHoliday else StyleText12 := 'Normal';
        //END;
    end;

    procedure Load(PeriodType1: Option Day,Week,Month,Quarter,Year,"Accounting Period"; QtyType1: Option "Net Change","Balance at Date"; MatrixColumns1: array[32] of Text[1024]; var MatrixRecords1: array[32] of Record Date; NoOfMatrixColumns1: Integer; ActiveType1: Option All,Yes,No; ClosedOption1: Option All,Yes,No);
    var
        i: Integer;
    begin
        PeriodType := PeriodType1;
        QtyType := QtyType1;
        ActiveType := ActiveType1;
        ClosedOption := ClosedOption1;
        COPYARRAY(MATRIX_ColumnCaption, MatrixColumns1, 1);
        for i := 1 to ARRAYLEN(MatrixRecords) do
            MatrixRecords[i].COPY(MatrixRecords1[i]);
        MATRIX_NoOfMatrixColumns := NoOfMatrixColumns1;
    end;

    procedure MatrixOnDrillDown(ColumnID: Integer);
    var
        ResCapacityEntries: Record "Res. Capacity Entry";
        IssueLine: Record "Issue Line";
        IssueLinePage: Page "Issue Lines";
    begin
        SetDateFilter(ColumnID);
        IssueLine.RESET;
        IssueLine.SETCURRENTKEY("Assigned to User", "Plan Start Date", "Plan Finished Date");
        IssueLine.SETRANGE(IssueLine."Assigned to User", "User ID");
        IssueLine.SETFILTER("Plan Start Date", '<=' + FORMAT(CREATEDATETIME(MatrixRecords[ColumnID]."Period Start", 235900T)));
        IssueLine.SETFILTER("Plan Finished Date", '>=' + GETFILTER("Date Filter"));
        //Exsys-Golf 260417
        //IssueLine.SETFILTER("Document Date",GETFILTER("Date Filter"));
        //*
        IssueLine.SETFILTER(Status, '<>%1', IssueLine.Status::Cancel);
        IssueLine.SETFILTER(Active, GETFILTER("Active Filter"));
        IssueLine.SETFILTER(closed, GETFILTER("Closed Filter"));

        //PAGE.RUN(0,IssueLine);
        CLEAR(IssueLinePage);
        IssueLinePage.SETTABLEVIEW(IssueLine);
        IssueLinePage.EDITABLE(false);
        IssueLinePage.RUN;
    end;

    procedure ValidateCapacity(MATRIX_ColumnOrdinal: Integer);
    begin
        //SetDateFilter(MATRIX_ColumnOrdinal);
        //CALCFIELDS(Capacity);
        //VALIDATE(Capacity,MATRIX_CellData[MATRIX_ColumnOrdinal]);
    end;

    local procedure ClearStyleText();
    begin
        StyleText1 := '';
        StyleText2 := '';
        StyleText3 := '';
        StyleText4 := '';
        StyleText5 := '';
        StyleText6 := '';
        StyleText7 := '';
        StyleText8 := '';
        StyleText9 := '';
        StyleText11 := '';
        StyleText12 := '';
        CLEAR(varStyleText)
    end;
}


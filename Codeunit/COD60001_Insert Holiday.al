codeunit 60001 "Insert Holiday"
{

    trigger OnRun();
    begin
        //  iY:= 2015;
        //  iW:=1;

        for iY:=2016 to 2025 do begin
         for iW := 1 to 52 do begin
          //MESSAGE(FORMAT(iY)+':'+FORMAT(iW));
          CLEAR(LineNo);
          IssueLine.RESET;
          IssueLine.SETCURRENTKEY("Issue No.","Line No.");
          IssueLine.SETRANGE("Issue No.",'HOLIDAY');
          if IssueLine.FINDLAST then begin

            LineNo := IssueLine."Line No.";
            //MESSAGE(FORMAT(LineNo));
          end;

          LineNo +=10000;
          IssueLine."Line No." := LineNo;
          IssueLine."Task No." :=  '0100';
          IssueLine."Task Description" := 'Sat';
          IssueLine.VALIDATE("Plan Start Date",CREATEDATETIME(DWY2DATE(6 ,iW ,iY),000000T));
          IssueLine.Holiday := true;
          IssueLine.INSERT;


          LineNo +=10000;
          IssueLine."Line No." := LineNo;
          IssueLine."Task No." :=  '0100';
          IssueLine."Task Description" := 'Sun';
          IssueLine.VALIDATE("Plan Start Date",CREATEDATETIME(DWY2DATE(7 ,iW ,iY),000000T));
            IssueLine.Holiday := true;
            IssueLine.INSERT;

          //DWY2DATE(6 iw ,iY))  ;//Sat
          //DWY2DATE(7 iw ,iY))  ;//Sun
         end;
         MESSAGE('OK');
        end;
    end;

    var
        iW : Integer;
        iY : Integer;
        IssueLine : Record "Issue Line";
        LineNo : Integer;
}


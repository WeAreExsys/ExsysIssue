table 60003 "Issue Header"
{
    // version Exsys-Issue v1.0

    DrillDownPageID = "Issue List";
    LookupPageID = "Issue List";

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 160615
                if "No." <> xRec."No." then begin
                  MgtSetup.GET;
                  if "Document Homeroom" then
                    NoSeriesMgt.TestManual(MgtSetup."Homeroom Nos.")
                  else
                    NoSeriesMgt.TestManual(MgtSetup."Issue Document Nos.");
                  "No. Series" := '';
                end;
                //+
            end;
        }
        field(2;"Project No.";Code[20])
        {
            TableRelation = Project."No.";
        }
        field(3;Type;Option)
        {
            InitValue = Maintenance;
            OptionCaption = 'Implement,Maintenance,Chargable Service,Other,MA Ref.,Installation';
            OptionMembers = Implement,Maintenance,"Chargable Service",Other,"MA Ref.",Installation;

            trigger OnValidate();
            begin
                //Exsys-Wichit 0709156
                if Type <> xRec.Type then
                  if (Type <> Type::Maintenance) and (Type <> Type::"MA Ref.") then
                  "MA No." := '';
                //+

                //Exsys-keng050915
                if Type = Type::"Chargable Service" then begin
                  if not CONFIRM('Do you want to generate change request no.',false) then
                    exit;

                  MgtSetup.GET;
                  MgtSetup.TESTFIELD("Change Request Nos.");
                  "Change Request No." := NoSeriesMgt.GetNextNo(MgtSetup."Change Request Nos.",WORKDATE,true);

                end;
                //+
            end;
        }
        field(4;"MA No.";Code[20])
        {
            FieldClass = Normal;
            TableRelation = IF (Type=FILTER(Maintenance|"MA Ref.")) "Maintenance Agreement"."No." WHERE ("Project No."=FIELD("Project No."),
                                                                                                         Status=CONST(Active));
        }
        field(5;"Phase No.";Code[20])
        {
            TableRelation = IF (Type=CONST(Implement)) "Project Phase"."No." WHERE ("Project No."=FIELD("Project No."));
        }
        field(6;Description;Text[250])
        {
        }
        field(7;Closed;Boolean)
        {
            Editable = false;
        }
        field(8;"MA Usage Day";Decimal)
        {

            trigger OnValidate();
            begin
                if (Type <> Type::Maintenance) and (Type <> Type::"MA Ref.") then
                    ERROR('Type must be Maintenance or MA Ref.');

                //Exsys-Wichit 070915
                ChkMARemaining;
                //+
            end;
        }
        field(9;"Received Date";DateTime)
        {

            trigger OnValidate();
            begin
                if "Expected Starting Date" = 0DT then
                   "Expected Starting Date" := "Received Date";
                if "Expected Finished Date" = 0DT then
                   "Expected Finished Date" := "Received Date";
            end;
        }
        field(10;"Expected Starting Date";DateTime)
        {

            trigger OnValidate();
            var
                mytime : Time;
            begin
                if DT2TIME( "Expected Starting Date")=000000T then   begin
                  "Expected Starting Date":=  CREATEDATETIME(DT2DATE( "Expected Starting Date"),090000T)   ;
                  "Expected Finished Date" := CREATEDATETIME(DT2DATE( "Expected Starting Date"),180000T);
                end;
            end;
        }
        field(11;"Expected Finished Date";DateTime)
        {

            trigger OnValidate();
            begin
                if DT2TIME("Expected Finished Date")=000000T then   begin
                  "Expected Finished Date" := CREATEDATETIME(DT2DATE( "Expected Finished Date"),180000T);
                end;
            end;
        }
        field(12;"Current Task";Text[50])
        {
            CalcFormula = Lookup("Issue Line"."Task Description" WHERE ("Issue No."=FIELD("No."),
                                                                        Active=CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Current User";Text[50])
        {
            CalcFormula = Lookup("Issue Line"."Assigned to User" WHERE ("Issue No."=FIELD("No."),
                                                                        Active=CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;"Current Start Date";DateTime)
        {
            CalcFormula = Lookup("Issue Line"."Plan Start Date" WHERE ("Issue No."=FIELD("No."),
                                                                       Active=CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Current Finished Date";DateTime)
        {
            CalcFormula = Lookup("Issue Line"."Plan Finished Date" WHERE ("Issue No."=FIELD("No."),
                                                                          Active=CONST(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"Task No.";Code[20])
        {
            CalcFormula = Lookup("Issue Line"."Task No." WHERE ("Issue No."=FIELD("No.")));
            FieldClass = FlowField;
        }
        field(17;"Actual Start Date";DateTime)
        {
            CalcFormula = Lookup("Issue Line"."Actual Start Date" WHERE ("Issue No."=FIELD("No.")));
            FieldClass = FlowField;
        }
        field(18;"Actual Finished Date";DateTime)
        {
            CalcFormula = Lookup("Issue Line"."Actual Finished Date" WHERE ("Issue No."=FIELD("No.")));
            FieldClass = FlowField;
        }
        field(20;Onsite;Boolean)
        {

            trigger OnValidate();
            begin
                //Exsys-keng050915
                /*IF Onsite = TRUE THEN
                   MESSAGE('Dont forget to input service log sheet No.')
                ELSE
                   "Service Log Sheet No." := '';    */
                //+

            end;
        }
        field(21;"Required Sign-off";Boolean)
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 030915
                /*
                IF "Required Sign-off" THEN BEGIN
                  CLEAR(LineNo);
                  IssueLine.RESET;
                  IssueLine.SETRANGE("Issue No.","No.");
                  IF IssueLine.FINDLAST THEN
                    LineNo := IssueLine."Line No.";
                
                  TaskDetail.RESET;
                  TaskDetail.SETRANGE("Required Sign-off",TRUE);
                  IF TaskDetail.FINDFIRST THEN BEGIN
                    IssueLine.RESET;
                    IssueLine.INIT;
                    IssueLine."Issue No." := "No.";
                    IssueLine."Line No." := LineNo +10000;
                    IssueLine.VALIDATE("Task No.",TaskDetail."No.");
                    IssueLine.VALIDATE("Task Description",TaskDetail.Description);
                    IssueLine.INSERT;
                  END;
                END ELSE BEGIN
                  IssueLine.RESET;
                  IssueLine.SETRANGE("Issue No.","No.");
                  IssueLine.SETRANGE("Required Sign-off",TRUE);
                  IF IssueLine.FINDFIRST THEN BEGIN
                    IssueLine.DELETEALL;
                  END;
                END;
                */
                //+.

            end;
        }
        field(22;"Created By";Code[50])
        {
            Editable = false;
            TableRelation = User."User Name";
        }
        field(23;"Change Request No.";Code[20])
        {
            TableRelation = "Change Request Header"."No." WHERE (Status=CONST(Release));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                //Exsys-keng050915
                //TESTFIELD(Onsite,TRUE);
                //+
            end;
        }
        field(24;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        THA='ชุดหมายเลข';
            Description = 'Exsys-Wichit';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(25;"Chargable Usage Day";Decimal)
        {

            trigger OnValidate();
            begin
                if (Type <> Type::Maintenance) and (Type <> Type::"Chargable Service") then
                    ERROR('Type must be Maintenance or Chargable Service.');
            end;
        }
        field(26;"Ref. Issue No.";Code[20])
        {
            TableRelation = IF (Type=CONST("MA Ref.")) "Issue Header"."No." WHERE ("Project No."=FIELD("Project No."),
                                                                                   Type=FILTER(Maintenance));
        }
        field(27;"Service Log Sheet No.";Code[20])
        {
        }
        field(28;Status;Option)
        {
            OptionCaption = 'Open,Release,Cancel';
            OptionMembers = Open,Release,Cancel;

            trigger OnValidate();
            begin
                //Exsys-Wichit 070915
                if Status = Status::Release then
                  if (Type = Type::Maintenance) or (Type = Type::"MA Ref.") then
                    ChkMARemaining;
                //+
            end;
        }
        field(29;Active;Boolean)
        {
            CalcFormula = Exist("Issue Line" WHERE ("Issue No."=FIELD("No.")));
            Description = 'Exsys-Wichit';
            FieldClass = FlowField;
        }
        field(30;"No. Person Onsite";Integer)
        {
            CalcFormula = Count("Issue Line" WHERE ("Issue No."=FIELD("No."),
                                                    Onsite=CONST(true)));
            Description = 'Exsys-Wichit/';
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                //Exsys-Wichit 090915
                IssueLine.RESET;
                IssueLine.SETRANGE("Issue No.","No.");
                IssueLine.SETRANGE(Onsite,true);
                if IssueLine.FINDSET then begin
                  if IssueLine.COUNT <> "No. Person Onsite" then begin
                    if not CONFIRM('Do you want to Delete All Onsite Line.',false) then begin
                      "No. Person Onsite" := IssueLine.COUNT;
                      exit;
                    end;
                    IssueLine.DELETEALL;
                    "No. Person Onsite" := 0;
                  end;
                end;
                //+
            end;
        }
        field(31;"Promised Delivery Date";Date)
        {
        }
        field(32;"Received From Customer Name";Text[100])
        {
        }
        field(33;"PO Number";Text[30])
        {
        }
        field(34;Leave;Boolean)
        {
            Description = 'Exsys-CS';
        }
        field(35;Uploaded_File;BLOB)
        {
        }
        field(36;Holiday;Boolean)
        {
            Description = 'Exsys-Golf -> Holiday on Resouce usage';
        }
        field(50000;"Exist Attach File";Boolean)
        {
            CalcFormula = Exist("Issue Attach File" WHERE ("Issue No."=FIELD("No.")));
            Description = 'Exsys-Golf';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001;"Document Date";Date)
        {
        }
        field(50002;"Name of Consultant";Text[100])
        {
        }
        field(50003;"Description 2";Text[250])
        {
        }
        field(50004;"Document Homeroom";Boolean)
        {
            Description = 'Exsys-Golf -> Homeroom Tracking to do for our';
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
        key(Key2;"Expected Starting Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        IssueLine.RESET;
        IssueLine.SETRANGE("Issue No.","No.");
        if IssueLine.FIND('-') then
          IssueLine.DELETEALL;
    end;

    trigger OnInsert();
    begin
        //Exsys-Wichit 030915
        if "No." = '' then
          InitInsert;

        "Received Date" := CURRENTDATETIME;
        "Created By" := USERID;
        //+

        //Exsys-Golf
        "Document Date" := TODAY;
        //*
    end;

    var
        IssueHeader : Record "Issue Header";
        IssueLine : Record "Issue Line";
        MgtSetup : Record "Project Management Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Text051 : TextConst ENU='%1 already exists.',THA='การขาย %1 %2 มีอยู่แล้ว';
        LineNo : Integer;
        TaskDetail : Record Task;
        MaintAgreement : Record "Maintenance Agreement";

    procedure AssistEdit(OldIssueHeader : Record "Issue Header") : Boolean;
    var
        IssueHeader2 : Record "Issue Header";
    begin
        //Exsys-Wichit 160615
        with IssueHeader do begin
          COPY(Rec);
          MgtSetup.GET;
          if "Document Homeroom" then
            begin
              MgtSetup.TESTFIELD("Homeroom Nos.");
              if NoSeriesMgt.SelectSeries(MgtSetup."Homeroom Nos.",OldIssueHeader."No. Series","No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                if IssueHeader2.GET("No.") then
                  ERROR(Text051,"No.");
                Rec := IssueHeader;
                exit(true);
              end;
            end else begin
              MgtSetup.TESTFIELD("Issue Document Nos.");
              if NoSeriesMgt.SelectSeries(MgtSetup."Issue Document Nos.",OldIssueHeader."No. Series","No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                if IssueHeader2.GET("No.") then
                  ERROR(Text051,"No.");
                Rec := IssueHeader;
                exit(true);
              end;
            end;
        end;
        //+
    end;

    procedure CreateTaskLine(No : Code[20]) : Boolean;
    var
        FirstActive : Boolean;
    begin
        //Exsys-Wichit 030915
        CLEAR(LineNo);
        IssueLine.RESET;
        IssueLine.SETRANGE("Issue No.",No);
        if IssueLine.FINDLAST then begin
          LineNo := IssueLine."Line No.";
        end;
        CLEAR(FirstActive);
        TaskDetail.RESET;
        TaskDetail.SETRANGE("Required Sign-off",false);
        if TaskDetail.FINDSET then begin
          repeat
            LineNo += 10000;
            IssueLine.RESET;
            IssueLine.INIT;
            if FirstActive = false then
              IssueLine.Active := true;
            IssueLine."Issue No." := No;
            IssueLine."Line No." := LineNo;
            IssueLine.VALIDATE("Task No.",TaskDetail."No.");
            IssueLine.VALIDATE("Task Description",TaskDetail.Description);
            IssueLine.INSERT;
            FirstActive := true;
          until TaskDetail.NEXT=0;
        end;
        //+
    end;

    local procedure ChkMARemaining();
    begin
        //Exsys-Wichit 070915
        MaintAgreement.RESET;
        MaintAgreement.GET("MA No.");
        MaintAgreement.CALCFIELDS("Usage Day");
        if "MA Usage Day" > (MaintAgreement."MA Day" - MaintAgreement."Usage Day") then
          ERROR('MA No.%1 Remaining %2 Day',"MA No.",(MaintAgreement."MA Day" - MaintAgreement."Usage Day"));
        //+
    end;

    local procedure TestNoSeries() : Boolean;
    begin
        //Exsys-Golf
        MgtSetup.GET;
        if "Document Homeroom" then
          MgtSetup.TESTFIELD("Homeroom Nos.")
        else
          MgtSetup.TESTFIELD("Issue Document Nos.");
        //*
    end;

    local procedure GetNoSeriesCode() : Code[10];
    begin
        //Exsys-Golf
        MgtSetup.GET;
        if "Document Homeroom" then
          exit(MgtSetup."Homeroom Nos.")
        else
          exit(MgtSetup."Issue Document Nos.");
        //*
    end;

    local procedure InitInsert();
    begin
        if "No." = '' then begin
          TestNoSeries;
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",WORKDATE,"No.","No. Series");
        end;
    end;
}


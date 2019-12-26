table 60004 "Issue Line"
{
    // version Exsys-Issue v1.0

    LookupPageID = "Issue Line List";

    fields
    {
        field(1;"Issue No.";Code[20])
        {
            NotBlank = true;
            TableRelation = "Issue Header"."No.";
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Task No.";Code[20])
        {
            TableRelation = Task."No.";

            trigger OnValidate();
            begin
                //Exsys-Wichit 030915
                TaskDetail.RESET;
                if TaskDetail.GET("Task No.") then begin
                  "Task Description" := TaskDetail.Description;
                  /*
                  IF TaskDetail."Required Sign-off" THEN
                    "Required Sign-off" := TRUE;
                  IF TaskDetail.Onsite THEN BEGIN
                    Onsite := TRUE;
                    Active := TRUE;
                    "Assigned by User" := USERID;
                  END;
                  */
                
                end;
                //+

            end;
        }
        field(4;"Task Description";Text[50])
        {
            FieldClass = Normal;
        }
        field(5;"Assigned to User";Text[50])
        {
            TableRelation = "User Setup";

            trigger OnValidate();
            begin
                //Exsys-Wichit 070915
                UserSetup.RESET;
                if UserSetup.GET("Assigned to User") then begin
                  Department := UserSetup.Department;
                end else begin
                  Department := '';
                end;
                //+
            end;
        }
        field(6;"Plan Start Date";DateTime)
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 030915
                //"Plan Finished Date" := "Plan Start Date";  //comment by Exsys-CS 20151014
                //+

                //added by Exsys-Cs 20151014+
                if DT2TIME( "Plan Start Date")=000000T then   begin
                  "Plan Start Date":=  CREATEDATETIME(DT2DATE( "Plan Start Date"),090000T)   ;
                  "Plan Finished Date":= CREATEDATETIME(DT2DATE("Plan Start Date"),180000T);
                end;
                //added by Exsys-Cs 20151014-
            end;
        }
        field(7;"Plan Finished Date";DateTime)
        {

            trigger OnValidate();
            begin
                //added by Exsys-Cs 20151014+
                if DT2TIME( "Plan Finished Date")=000000T then
                  "Plan Finished Date":=  CREATEDATETIME(DT2DATE("Plan Finished Date"),180000T)   ;
            end;
        }
        field(8;"Actual Start Date";DateTime)
        {
        }
        field(9;"Actual Finished Date";DateTime)
        {
        }
        field(10;Active;Boolean)
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 030915
                if xRec.Active then
                  ERROR('');

                if not CONFIRM('Do you want confirm to active task ?',false) then
                  ERROR(''); //Exsys-Golf 090915

                "Assigned by User" := USERID;

                //Exsys-Wichit 030915
                IssueLine.RESET;
                IssueLine.SETRANGE("Issue No.","Issue No.");
                IssueLine.SETFILTER("Line No.",'<>%1',"Line No.");
                if IssueLine.FINDSET then begin
                  repeat
                    if IssueLine.Onsite = false then begin
                      IssueLine.Active := false;
                      IssueLine.MODIFY;
                    end;
                  until IssueLine.NEXT=0;
                end;
                //+


                //Exsys-Golf 080915
                if Active then
                  SendEmail;
                //*
            end;
        }
        field(11;"Assigned by User";Text[50])
        {
            Editable = false;
        }
        field(12;"Issue Description";Text[200])
        {
            CalcFormula = Lookup("Issue Header".Description WHERE ("No."=FIELD("Issue No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Required Sign-off";Boolean)
        {
        }
        field(14;Onsite;Boolean)
        {
            Description = 'Exsys-Wichit';
        }
        field(15;"Commit Date";Date)
        {
            Description = 'Exsys-Wichit';
        }
        field(16;"Delivery Date";Date)
        {
            Description = 'Exsys-Wichit';
        }
        field(17;Department;Code[20])
        {
            Description = 'Exsys-Wichit';
            TableRelation = Department."No.";
        }
        field(18;closed;Boolean)
        {
        }
        field(19;"Project No.";Code[20])
        {
            CalcFormula = Lookup("Issue Header"."Project No." WHERE ("No."=FIELD("Issue No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20;Leave;Boolean)
        {
            CalcFormula = Lookup("Issue Header".Leave WHERE ("No."=FIELD("Issue No.")));
            Description = 'Exsys-CS';
            FieldClass = FlowField;
        }
        field(21;Holiday;Boolean)
        {
            Description = 'Exsys-Golf';
            Editable = false;
            FieldClass = Normal;
        }
        field(22;Status;Option)
        {
            CalcFormula = Lookup("Issue Header".Status WHERE ("No."=FIELD("Issue No.")));
            Description = 'Exsys-CS';
            FieldClass = FlowField;
            OptionCaption = 'Open,Release,Cancel';
            OptionMembers = Open,Release,Cancel;
        }
        field(23;"Document Date";Date)
        {
            Description = 'Exsys-Golf';
        }
        field(24;Remark;Text[250])
        {
            Caption = 'Remark/Risk Point/Suggestion';
        }
        field(50000;"Select Project No.";Code[20])
        {
            Caption = 'Project No.';
            Description = 'Exsys-Golf -> Document Homeroom';
            TableRelation = Project;
        }
        field(50001;Description;Text[250])
        {
            Description = 'Exsys-Golf -> Document Homeroom';
        }
        field(50002;"Document Homeroom";Boolean)
        {
            Description = 'Exsys-Golf -> Document Homeroom';
        }
        field(50003;"Create By";Code[80])
        {
            Description = 'Exsys-Golf -> Document Homeroom';
        }
    }

    keys
    {
        key(Key1;"Issue No.","Line No.")
        {
        }
        key(Key2;"Assigned to User","Plan Start Date","Plan Finished Date")
        {
        }
        key(Key3;"Assigned by User","Plan Start Date","Plan Finished Date")
        {
        }
        key(Key4;"Assigned by User","Task No.","Plan Start Date","Plan Finished Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        IssueHeader.GET("Issue No.");
        Holiday := IssueHeader.Holiday;
        if IssueHeader."Document Homeroom" then
        begin
          "Document Date" := IssueHeader."Document Date";
          "Document Homeroom" := IssueHeader."Document Homeroom";
          "Create By" := IssueHeader."Created By";
        end;
    end;

    var
        TaskDes : Text[50];
        TaskDetail : Record Task;
        UserSetup : Record "User Setup";
        IssueLine : Record "Issue Line";
        IssueHeader : Record "Issue Header";

    local procedure SendEmail();
    begin
        //Exsys-Golf
        /*
        IssueNotification.GET;
        IF NOT IssueNotification."Send E-Mail" THEN
          EXIT;
        
        CLEAR(ApprvMgt);
        ApprvMgt.SendIssueMail(Rec);
        */
        //*

    end;
}


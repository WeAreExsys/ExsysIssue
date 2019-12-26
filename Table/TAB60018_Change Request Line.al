table 60018 "Change Request Line"
{
    // version Exsys-Issue v1.0

    LookupPageID = "Issue Line List";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            NotBlank = true;
            TableRelation = "Change Request Header"."No.";
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Task No.";Code[20])
        {
            TableRelation = Task."No.";
        }
        field(4;"Task Description";Text[250])
        {
        }
        field(5;"Assigned to User";Text[50])
        {
            TableRelation = "User Setup";
        }
        field(6;"Plan Start Date";DateTime)
        {
        }
        field(7;"Plan Finished Date";DateTime)
        {
        }
        field(8;"Actual Start Date";DateTime)
        {
        }
        field(9;"Actual Finished Date";DateTime)
        {
        }
        field(10;Active;Boolean)
        {
        }
        field(11;"Assigned by User";Text[50])
        {
            Editable = false;
        }
        field(12;"Issue Description";Text[200])
        {
            CalcFormula = Lookup("Issue Header".Description WHERE ("No."=FIELD("Document No.")));
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
            CalcFormula = Lookup("Change Request Header".Closed WHERE ("No."=FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(19;"Project No.";Code[20])
        {
            CalcFormula = Lookup("Change Request Header"."Project No." WHERE ("No."=FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20;Leave;Boolean)
        {
            CalcFormula = Lookup("Change Request Header".Leave WHERE ("No."=FIELD("Document No.")));
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
            CalcFormula = Lookup("Change Request Header".Status WHERE ("No."=FIELD("Document No.")));
            Description = 'Exsys-CS';
            FieldClass = FlowField;
            OptionCaption = 'Open,Release,Cancel';
            OptionMembers = Open,Release,Cancel;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
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
        */
        //*

    end;
}


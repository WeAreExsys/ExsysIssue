table 60099 "Exsys-Issue Cue"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;"Issues List";Integer)
        {
            CalcFormula = Count("Issue Header" WHERE (Status=FILTER(Open|Release),
                                                      Leave=CONST(false),
                                                      Holiday=CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3;"Issue-To Do";Integer)
        {
            CalcFormula = Count("Issue Header" WHERE (Status=FILTER(Release),
                                                      Closed=FILTER(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;"MA List";Integer)
        {
            CalcFormula = Count("Maintenance Agreement");
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Expense Doc.";Integer)
        {
            CalcFormula = Count("Expense Header");
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Project;Integer)
        {
            CalcFormula = Count(Project);
            Description = 'Exsys-Golf';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"Project-Active";Integer)
        {
            CalcFormula = Count(Project WHERE (Status=CONST(Active)));
            Description = 'Exsys-Golf';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Project-Closed";Integer)
        {
            CalcFormula = Count(Project WHERE (Status=CONST(Closed)));
            Description = 'Exsys-Golf';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100;"Issue by User";Integer)
        {
            CalcFormula = Count("Issue Line" WHERE ("Assigned to User"=FIELD(UserFilter),
                                                    Active=FILTER(true),
                                                    closed=FILTER(false)));
            Description = 'Exsys-CS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90000;"Task Setup";Integer)
        {
            CalcFormula = Count(Task);
            Editable = false;
            FieldClass = FlowField;
        }
        field(90001;"Project Setup";Integer)
        {
            CalcFormula = Count(Project);
            Editable = false;
            FieldClass = FlowField;
        }
        field(90002;"Expense Code Setup";Integer)
        {
            CalcFormula = Count("Expense Code");
            Editable = false;
            FieldClass = FlowField;
        }
        field(90003;"Project Management Setup";Integer)
        {
            CalcFormula = Count("Project Management Setup");
            Editable = false;
            FieldClass = FlowField;
        }
        field(90004;"Company Infomation";Integer)
        {
            CalcFormula = Count("Company Information");
            Editable = false;
            FieldClass = FlowField;
        }
        field(90005;"No. Series";Integer)
        {
            CalcFormula = Count("No. Series");
            Editable = false;
            FieldClass = FlowField;
        }
        field(90007;"Release Expense Document";Integer)
        {
            CalcFormula = Count("Expense Header" WHERE (Status=CONST(Release)));
            Description = 'Exsys-Wichit';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90009;IssueByUser;Integer)
        {
        }
        field(90010;UserFilter;Text[30])
        {
            FieldClass = FlowFilter;
        }
        field(90011;"Issue-Close";Integer)
        {
            CalcFormula = Count("Issue Header" WHERE (Closed=CONST(true)));
            Description = 'Exsys-CS';
            FieldClass = FlowField;
        }
        field(90012;"Your Task";Integer)
        {
            CalcFormula = Count("Issue Line" WHERE ("Document Homeroom"=CONST(true),
                                                    closed=CONST(false),
                                                    "Assigned to User"=FIELD(UserFilter)));
            Description = 'Exsys-Golf';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90013;"Change Request Document";Integer)
        {
            CalcFormula = Count("Change Request Header");
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    procedure CalcListByUser() Calc : Integer;
    begin
        //SETRANGE(UserFilter,USERID());
        SETFILTER(UserFilter,USERID);
        CALCFIELDS( "Issue by User");
        Calc :=    "Issue by User";
    end;
}


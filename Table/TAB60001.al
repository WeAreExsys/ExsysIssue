table 60001 Project
{
    // version Exsys-Issue v1.0

    DrillDownPageID = "Project List";

    fields
    {
        field(1;"No.";Code[10])
        {
            NotBlank = true;
        }
        field(2;Name;Text[50])
        {
        }
        field(3;"Registered Date";Date)
        {
        }
        field(4;Status;Option)
        {
            OptionCaption = 'Open,Active,Closed';
            OptionMembers = Open,Active,Closed;
        }
        field(5;"MA Day";Decimal)
        {
            CalcFormula = Sum("Maintenance Agreement"."MA Day" WHERE ("Project No."=FIELD("No."),
                                                                      Status=CONST(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"MA Usage Day";Decimal)
        {
            CalcFormula = Sum("Maintenance Agreement"."Usage Day" WHERE ("Project No."=FIELD("No."),
                                                                         Status=CONST(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"MA Remaining";Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //Exsys-keng050915
        PP.RESET;
        PP.SETRANGE("Project No.","No.");
        if PP.FINDSET then
           PP.DELETEALL;
        //+
    end;

    trigger OnInsert();
    begin
        //Exsys-keng050915
        PP.RESET;
        PP."Project No." := "No.";
        PP."No." := '01';
        PP.INSERT;
        PP.Description := 'Phase 1';
        PP.MODIFY;
        //+
    end;

    var
        PP : Record "Project Phase";
}


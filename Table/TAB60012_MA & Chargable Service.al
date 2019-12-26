table 60012 "MA & Chargable Service"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Issue No.";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;Type;Option)
        {
            OptionCaption = '" ,MA,Chargable Service"';
            OptionMembers = " ",MA,"Chargable Service";
        }
        field(4;"No.";Code[30])
        {
            TableRelation = IF (Type=CONST(MA)) "Maintenance Agreement"."No." WHERE ("Project No."=FIELD("Project No."));

            trigger OnValidate();
            begin
                MESSAGE('%1',"Issue No.");
            end;
        }
        field(5;Description;Text[100])
        {
        }
        field(6;"Project No.";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Issue No.","Project No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}


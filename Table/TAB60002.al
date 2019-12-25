table 60002 "Project Phase"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Project No.";Code[20])
        {
            TableRelation = Project."No.";
        }
        field(2;"No.";Code[20])
        {
            NotBlank = true;
        }
        field(3;Description;Text[50])
        {
        }
        field(4;"Starting Date";Date)
        {
        }
        field(5;"Ending Date";Date)
        {
        }
        field(6;Status;Option)
        {
            OptionMembers = Open,Implement,Closed;
        }
    }

    keys
    {
        key(Key1;"Project No.","No.")
        {
        }
    }

    fieldgroups
    {
    }
}


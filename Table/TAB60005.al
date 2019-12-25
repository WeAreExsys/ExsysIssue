table 60005 Task
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"No.";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Required Sign-off";Boolean)
        {
        }
        field(4;"Chargable Service";Boolean)
        {
        }
        field(5;Maintenance;Boolean)
        {
        }
        field(6;Onsite;Boolean)
        {
        }
        field(7;Other;Boolean)
        {
        }
        field(8;Implement;Boolean)
        {
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
}


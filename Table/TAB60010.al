table 60010 "Project Location"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Project No.";Code[10])
        {
        }
        field(2;"Code";Code[10])
        {
        }
        field(3;Description;Text[100])
        {
        }
        field(4;"Transportation Rate";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Project No.","Code")
        {
        }
    }

    fieldgroups
    {
    }
}


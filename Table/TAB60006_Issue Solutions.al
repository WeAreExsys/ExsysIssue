table 60006 "Issue Solutions"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Issue No.";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = false;
        }
        field(3;Description;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Issue No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}


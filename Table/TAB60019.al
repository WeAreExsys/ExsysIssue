table 60019 "Change Request Solutions"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Document No.";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = false;
        }
        field(3;Description;Text[250])
        {
        }
        field(4;"Not Show";Boolean)
        {
            Description = 'Exsys-Golf';
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}


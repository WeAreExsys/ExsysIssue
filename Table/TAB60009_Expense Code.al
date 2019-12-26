table 60009 "Expense Code"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Transportation Rate";Boolean)
        {
        }
        field(4;"Unit Price";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }
}


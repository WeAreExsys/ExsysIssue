table 60024 "Localize Topic Line"
{
    // version Exsys Localize License Object


    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Object Type";Option)
        {
            OptionCaption = ',Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query';
            OptionMembers = ,"Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query";
            TableRelation = Object.Type;
        }
        field(3;"Object No.";Integer)
        {
        }
        field(4;"Object Name";Text[200])
        {
        }
    }

    keys
    {
        key(Key1;"No.","Object Type","Object No.")
        {
        }
    }

    fieldgroups
    {
    }
}


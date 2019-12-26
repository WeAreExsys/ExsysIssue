table 60025 "Localize Package Line"
{
    // version Exsys Localize License Object


    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Topic No."; Code[20])
        {
            TableRelation = "Localize Topic"."No.";
        }
        field(3; "Topic Name"; Text[200])
        {
        }
        field(4; "Object Type"; Option)
        {
            OptionCaption = ',Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query';
            OptionMembers = ,"Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query";
        }
        field(5; "From ID"; Integer)
        {
        }
        field(6; "To ID"; Integer)
        {
        }
        field(7; "Line No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
        }
        key(Key2; "Object Type")
        {
        }
        key(key3; "No.", "Topic No.")
        {

        }
    }

    fieldgroups
    {
    }
}


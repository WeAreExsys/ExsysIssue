table 60026 "Object On Localize"
{
    ExternalSchema = 'dbo';
    TableType = ExternalSQL;

    fields
    {
        field(1;Type;Option)
        {
            OptionCaption = ',Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query';
            OptionMembers = ,"Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query";
        }
        field(3;ID;Integer)
        {
        }
        field(4;Name;Text[250])
        {
        }
        field(5;Modified;Boolean)
        {
        }
        field(6;Compiled;Boolean)
        {
        }
        field(10;Date;Date)
        {
        }
        field(11;Time;Time)
        {
        }
        field(12;"Version List";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;Type,ID)
        {
        }
    }

    fieldgroups
    {
    }
}


table 60011 "Project Management Setup"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Primary Key";Code[10])
        {
        }
        field(2;"Issue Document Nos.";Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(3;"MA Nos.";Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(4;"Change Request Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(5;"Expense Document Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(6;"Localize Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(7;"Fix bug Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(8;"Homeroom Nos.";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(9;"Localize Package Nos.";Code[20])
        {
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}


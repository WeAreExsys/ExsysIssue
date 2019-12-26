table 60027 "License Package"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
        }
        field(2;"Project No.";Code[20])
        {
        }
        field(3;"Package No.";Code[20])
        {
            TableRelation = "Localize Package"."No.";

            trigger OnValidate();
            begin
                //Exsys-May 03/01/18
                CLEAR(LocalizePackage);
                if LocalizePackage.GET("Package No.") then;

                if Rec."Package No." <> '' then
                  Rec."Package Name" := LocalizePackage.Description
                else if Rec."Package No." ='' then
                  Rec."Package Name" := '';
                //---
            end;
        }
        field(4;"Package Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Project No.","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        LocalizePackage : Record "Localize Package";
}


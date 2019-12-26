table 60021 "Technical Log Line"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Localize,Fix Bug';
            OptionMembers = Localize,"Fix Bug";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Line No."; Integer)
        {
        }
        field(7; "Object Type"; Option)
        {
            InitValue = "Report";
            OptionCaption = ',Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query';
            OptionMembers = ,"Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query";

            trigger OnValidate();
            begin
                //Exsys-Wichit 030217
                if "Object Type" <> xRec."Object Type" then begin
                    //"Object ID" := 0;


                end;
                //+
            end;
        }
        field(8; "Object ID"; Integer)
        {
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = FIELD("Object Type"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup();
            var
                NewObjectID: Integer;
            begin
                if LookupObjectID(NewObjectID) then
                    VALIDATE("Object ID", NewObjectID);
            end;

            trigger OnValidate();
            var
                "Object": Record Object;
            begin
                //Exsys-GOlf
                if "Object ID" <> 0 then begin
                    if Object.GET("Object Type", '', "Object ID") then
                        "Object Caption" := Object.Name;
                end;
                //*
            end;
        }
        field(9; "Object Caption"; Text[250])
        {
            FieldClass = Normal;
        }
        field(10; Description; Text[50])
        {
        }
        field(11; Responsible; Code[50])
        {
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnLookup();
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.LookupUserID(Responsible); //Exsys-Golf : Fixed BC doesn't have this function
            end;

            trigger OnValidate();
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.ValidateUserID(Responsible);  //Exsys-Golf : Fixed BC doesn't have this function
            end;
        }
        field(12; "Fixed On Localized Exsys"; Boolean)
        {
        }
        field(13; Remark; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        UserMgt: Codeunit "User Management";
        "Object": Record "Object";

    procedure LookupObjectID(var NewObjectID: Integer): Boolean;
    var
        AllObjWithCaption: Record AllObjWithCaption;
        Objects: Page Objects;
    begin
        if AllObjWithCaption.GET("Object Type", "Object ID") then;
        AllObjWithCaption.FILTERGROUP(2);
        AllObjWithCaption.SETRANGE("Object Type", "Object Type");
        AllObjWithCaption.FILTERGROUP(0);
        Objects.SETRECORD(AllObjWithCaption);
        Objects.SETTABLEVIEW(AllObjWithCaption);
        Objects.LOOKUPMODE := true;
        if Objects.RUNMODAL = ACTION::LookupOK then begin
            Objects.GETRECORD(AllObjWithCaption);
            NewObjectID := AllObjWithCaption."Object ID";
            exit(true);
        end;
        exit(false);
    end;
}


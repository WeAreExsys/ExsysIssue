table 60020 "Technical Log Header"
{
    DrillDownPageID = "Technical Log List";
    LookupPageID = "Technical Log List";

    fields
    {
        field(1;"Document Type";Option)
        {
            OptionCaption = 'Localize,Fix Bug';
            OptionMembers = Localize,"Fix Bug";
        }
        field(2;"No.";Code[20])
        {
        }
        field(3;"Document Date";Date)
        {
        }
        field(4;Description;Text[50])
        {
        }
        field(5;"Created By User ID";Code[50])
        {
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnLookup();
            var
                UserMgt : Codeunit "User Management";
            begin
            end;

            trigger OnValidate();
            var
                UserMgt : Codeunit "User Management";
            begin
            end;
        }
        field(6;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        THA='ชุดหมายเลข';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(7;"Localize Topic";Code[20])
        {
            TableRelation = "Localize Topic";
        }
    }

    keys
    {
        key(Key1;"Document Type","No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        //Exsys-Wichit 030217
        if "No." = '' then
          InitInsert;

        "Document Date" := WORKDATE;
        "Created By User ID" := USERID;
        //+
    end;

    var
        MgtSetup : Record "Project Management Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Text051 : TextConst ENU='%1 already exists.',THA='การขาย %1 %2 มีอยู่แล้ว';

    procedure AssistEdit(OldTechLogHdr : Record "Technical Log Header") : Boolean;
    var
        TechLogHdr2 : Record "Technical Log Header";
    begin
        //Exsys-Wichit 030217
        with OldTechLogHdr do begin
          COPY(Rec);
          TestNoSeries;
          if NoSeriesMgt.SelectSeries(GetNoSeriesCode,OldTechLogHdr."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            if TechLogHdr2.GET("Document Type","No.") then
              ERROR(Text051,"No.");
            Rec := OldTechLogHdr;
            exit(true);
          end;
        end;
        //+
    end;

    local procedure TestNoSeries() : Boolean;
    begin
        //Exsys-Wichit 030217
        MgtSetup.GET;
        if "Document Type" = "Document Type"::"Fix Bug" then
          MgtSetup.TESTFIELD("Fix bug Nos.")
        else
          MgtSetup.TESTFIELD("Localize Nos.");
        //+
    end;

    local procedure GetNoSeriesCode() : Code[10];
    begin
        //Exsys-Wichit 030217
        MgtSetup.GET;
        if "Document Type" = "Document Type"::"Fix Bug" then
          exit(MgtSetup."Fix bug Nos.")
        else
          exit(MgtSetup."Localize Nos.");
        //+
    end;

    local procedure InitInsert();
    begin
        if "No." = '' then begin
          TestNoSeries;
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",WORKDATE,"No.","No. Series");
        end;
    end;
}


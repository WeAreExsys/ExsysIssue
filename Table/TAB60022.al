table 60022 "Localize Package"
{
    // version Exsys Localize License Object

    DrillDownPageID = "Localize Package List";
    LookupPageID = "Localize Package List";

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 160615
                if "No." <> xRec."No." then begin
                  MgtSetup.GET;
                  NoSeriesMgt.TestManual(MgtSetup."Localize Package Nos.");
                  "No. Series" := '';
                end;
                //+
            end;
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Create By User";Code[20])
        {
            TableRelation = User."User Name";
        }
        field(4;"Create Date";Date)
        {
        }
        field(5;"No. Series";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        //Exsys-Golf
        if "No." = '' then begin
          TestNoSeries;
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",WORKDATE,"No.","No. Series");
        end;
        //*


        //Exsys-May 04/01/18
        "Create By User" := USERID;
        "Create Date" := WORKDATE;
        //---
    end;

    var
        LocalizePackage : Record "Localize Package";
        MgtSetup : Record "Project Management Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Text051 : TextConst ENU='%1 already exists.',THA='การขาย %1 %2 มีอยู่แล้ว';

    local procedure TestNoSeries() : Boolean;
    begin
        //Exsys-Golf
        MgtSetup.GET;
        MgtSetup.TESTFIELD("Localize Package Nos.");

        //*
    end;

    local procedure GetNoSeriesCode() : Code[10];
    begin
        //Exsys-Golf
        MgtSetup.GET;
        exit(MgtSetup."Localize Package Nos.");
        //*
    end;

    procedure AssistEdit(OldLocalizePackage : Record "Localize Package") : Boolean;
    var
        LocalizePack2 : Record "Localize Package";
    begin
        //Exsys-Wichit 160615
        with LocalizePackage do begin
          COPY(Rec);
          MgtSetup.GET;
          MgtSetup.TESTFIELD("Localize Package Nos.");
          if NoSeriesMgt.SelectSeries(MgtSetup."Localize Package Nos.",OldLocalizePackage."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            if LocalizePack2.GET("No.") then
              ERROR(Text051,"No.");
            Rec := LocalizePackage;
            exit(true);
          end;
        end;
        //+
    end;
}


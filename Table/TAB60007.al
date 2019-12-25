table 60007 "Expense Header"
{
    // version Exsys-Issue v1.0

    DrillDownPageID = "Expense Document";
    LookupPageID = "Expense Document";

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 160615
                if "No." <> xRec."No." then begin
                  MgtSetup.GET;
                  NoSeriesMgt.TestManual(MgtSetup."Expense Document Nos.");
                  "No. Series" := '';
                end;
                //+
            end;
        }
        field(2;"Requested by";Code[50])
        {
            TableRelation = User."User Name";
        }
        field(3;"Document Date";Date)
        {
        }
        field(4;Status;Option)
        {
            OptionCaption = 'Open,Release,Printed';
            OptionMembers = Open,Release,Printed;
        }
        field(5;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        THA='ชุดหมายเลข';
            Description = 'Exsys-Wichit';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6;Paid;Boolean)
        {
        }
        field(50000;"Total Amount";Decimal)
        {
            CalcFormula = Sum("Expense Line".Amount WHERE ("Document No."=FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
        key(Key2;"Document Date")
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

        //Exsys-Wichit 070915
        "Requested by" := USERID;
        //+
    end;

    var
        ExpHeader : Record "Expense Header";
        MgtSetup : Record "Project Management Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Text051 : TextConst ENU='%1 already exists.',THA='การขาย %1 %2 มีอยู่แล้ว';

    local procedure TestNoSeries() : Boolean;
    begin
        //Exsys-Golf
        MgtSetup.GET;
        MgtSetup.TESTFIELD("Expense Document Nos.");

        //*
    end;

    local procedure GetNoSeriesCode() : Code[10];
    begin
        //Exsys-Golf
        MgtSetup.GET;
        exit(MgtSetup."Expense Document Nos.");
        //*
    end;

    procedure AssistEdit(OldExpHeader : Record "Expense Header") : Boolean;
    var
        ExpHeader2 : Record "Expense Header";
    begin
        //Exsys-Wichit 160615
        with ExpHeader do begin
          COPY(Rec);
          MgtSetup.GET;
          MgtSetup.TESTFIELD("Expense Document Nos.");
          if NoSeriesMgt.SelectSeries(MgtSetup."Expense Document Nos.",OldExpHeader."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            if ExpHeader2.GET("No.") then
              ERROR(Text051,"No.");
            Rec := ExpHeader;
            exit(true);
          end;
        end;
        //+
    end;
}


table 60000 "Maintenance Agreement"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"No.";Code[20])
        {
            NotBlank = false;

            trigger OnValidate();
            begin
                //Exsys-Wichit 160615
                if "No." <> xRec."No." then begin
                  MgtSetup.GET;
                  NoSeriesMgt.TestManual(MgtSetup."MA Nos.");
                  "No. Series" := '';
                end;
                //+
            end;
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Project No.";Code[10])
        {
            TableRelation = Project."No.";
        }
        field(4;Note;Text[200])
        {
        }
        field(5;Status;Option)
        {
            OptionCaption = 'Open,On Implement,On Discuss,Active,Closed';
            OptionMembers = Open,"On Implement","On Discuss",Active,Closed;
        }
        field(6;"Starting Date";Date)
        {
        }
        field(7;"Ending Date";Date)
        {

            trigger OnValidate();
            begin
                //Exsys-Golf
                if ("Ending Date" <> 0D) and ("Ending Date" <> xRec."Ending Date") then
                    "Ending Date (MA)" := CALCDATE('3M',"Ending Date")
                else if "Ending Date" = 0D then
                  "Ending Date (MA)" := 0D;
                //*
            end;
        }
        field(8;"MA Day";Decimal)
        {
        }
        field(9;"Usage Day";Decimal)
        {
            CalcFormula = Sum("Issue Header"."MA Usage Day" WHERE ("MA No."=FIELD("No."),
                                                                   Status=CONST(Release)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        THA='ชุดหมายเลข';
            Description = 'Exsys-Wichit';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11;"Closed Date";DateTime)
        {
        }
        field(12;"MA Remaining";Decimal)
        {
            Description = 'Exsys-Wichit';
            Editable = false;
        }
        field(13;"Ending Date (MA)";Date)
        {
            Editable = false;
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
        fieldgroup(DropDown;"No.",Description,Status,"Starting Date","Ending Date","MA Day","Usage Day")
        {
        }
    }

    trigger OnInsert();
    begin

        //Exsys-Wichit 030915
        if "No." = '' then
          InitInsert;
    end;

    var
        MgtAgrement : Record "Maintenance Agreement";
        MgtSetup : Record "Project Management Setup";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        Text051 : TextConst ENU='The Delivery Ticket %1 already exists.',THA='การขาย %1 %2 มีอยู่แล้ว';

    procedure AssistEdit(OldMgtAgrement : Record "Maintenance Agreement") : Boolean;
    var
        MgtAgrement2 : Record "Maintenance Agreement";
    begin
        //Exsys-Wichit 160615
        with MgtAgrement do begin
          COPY(Rec);
          MgtSetup.GET;
          MgtSetup.TESTFIELD("MA Nos.");
          if NoSeriesMgt.SelectSeries(MgtSetup."MA Nos.",OldMgtAgrement."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            if MgtAgrement2.GET("No.") then
              ERROR(Text051,"No.");
            Rec := MgtAgrement;
            exit(true);
          end;
        end;
        //+
    end;

    local procedure TestNoSeries() : Boolean;
    begin
        //Exsys-Golf
        MgtSetup.GET;
        MgtSetup.TESTFIELD("MA Nos.");
        //*
    end;

    local procedure GetNoSeriesCode() : Code[10];
    begin
        //Exsys-Golf
        MgtSetup.GET;
        exit(MgtSetup."MA Nos.");
        //*
    end;

    local procedure InitInsert();
    begin
        if "No." = '' then begin
          TestNoSeries;
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",WORKDATE,"No.","No. Series");
        end;
    end;
}


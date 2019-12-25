table 60008 "Expense Line"
{
    // version Exsys-Issue v1.0


    fields
    {
        field(1;"Document No.";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
        }
        field(3;"Expense Code";Code[20])
        {
            TableRelation = "Expense Code".Code;

            trigger OnValidate();
            begin
                //Exsys-Wichit 070915
                ExpCode.RESET;
                if ExpCode.GET("Expense Code") then begin
                  Description := ExpCode.Description;
                  if ExpCode."Unit Price" <> 0 then begin
                    VALIDATE("Unit Amount",ExpCode."Unit Price");
                    VALIDATE(Quantity,1);
                  end else begin
                    VALIDATE("Unit Amount",0);
                    VALIDATE(Quantity,0);
                  end;
                end;
                //+
            end;
        }
        field(4;"Project No.";Code[20])
        {
            TableRelation = Project."No.";
        }
        field(5;"Issue No.";Code[20])
        {
            TableRelation = "Issue Header"."No." WHERE ("Project No."=FIELD("Project No."),
                                                        Onsite=CONST(true));
        }
        field(6;Description;Text[100])
        {
        }
        field(7;Amount;Decimal)
        {
        }
        field(8;"External Document No.";Code[100])
        {
        }
        field(9;Quantity;Decimal)
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 070915
                Amount := "Unit Amount" * Quantity;
                //+
            end;
        }
        field(10;"Unit Amount";Decimal)
        {

            trigger OnValidate();
            begin
                //Exsys-Wichit 070915
                Amount := "Unit Amount" * Quantity;
                //+
            end;
        }
        field(11;"To Date";Date)
        {
        }
        field(12;"Location Code";Code[10])
        {
            TableRelation = "Project Location".Code WHERE ("Project No."=FIELD("Project No."));

            trigger OnValidate();
            begin
                //Exsys-Wichit 070915
                if ("Project No." <>'') and ("Location Code" <> '') then begin
                  ProjectLocation.RESET;
                  if ProjectLocation.GET("Project No.","Location Code") then begin
                    ExpCode.RESET;
                    if ExpCode.GET("Expense Code") then begin
                      if ExpCode."Transportation Rate" then begin
                        VALIDATE("Unit Amount",ProjectLocation."Transportation Rate");
                        VALIDATE(Quantity,1);
                      end;
                    end;
                  end else begin
                    VALIDATE("Unit Amount",0);
                    VALIDATE(Quantity,0);
                  end;
                end;
                //+
            end;
        }
        field(13;"From Date";Date)
        {
            Description = 'Exsys-Wichit';

            trigger OnValidate();
            begin
                //Exsys-Wichit 220915
                if "To Date" = 0D then
                  "To Date" := "From Date";
                //+
            end;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        ExpCode : Record "Expense Code";
        ProjectLocation : Record "Project Location";
}


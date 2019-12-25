page 60065 "Object for Localize"
{
    // version Package License Localization

    Editable = false;
    PageType = List;
    SourceTable = "Object On Localize";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                }
                field(ID;ID)
                {
                }
                field(Name;Name)
                {
                }
                field(Modified;Modified)
                {
                }
                field(Compiled;Compiled)
                {
                }
                field(Date;Date)
                {
                }
                field(Time;Time)
                {
                }
                field("Version List";"Version List")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit();
    begin
        CODEUNIT.RUN(CODEUNIT::"SQL Connection");
    end;
}


page 60058 "Req. Page for Import Homeroom"
{
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            group(Control2)
            {
                field(ReponseCode;ReponseCode)
                {
                    Caption = 'Reponsibility';
                    TableRelation = "User Setup";
                }
            }
        }
    }

    actions
    {
    }

    var
        ReponseCode : Code[80];

    procedure ReturnValue(var Param : Code[80]);
    begin
        //Exsys-Golf
        Param := ReponseCode;
        //*
    end;
}


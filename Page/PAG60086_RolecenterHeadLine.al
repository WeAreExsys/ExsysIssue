page 60086 "Role Center HeadLine"
{
    PageType = HeadLinePart;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(Group1)
            {
                field(HeadLine1; StrSubstNo(text001, Compinfo.Name))
                {


                }
                /*field(HL2; Compinfo.Picture)
                {

                }*/
            }
        }

    }

    trigger OnOpenPage()
    begin
        Compinfo.get;
        Compinfo.CalcFields(Picture);
    end;

    var
        HeadLine1: TextConst ENU = 'Exsys Co., Ltd.';
        Compinfo: Record "Company Information";
        text001: TextConst ENU = '<qualifier>%1</qualifier><payload>This is the <emphasize>%1</emphasize>.</payload>';
}
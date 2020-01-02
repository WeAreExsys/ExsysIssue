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

                /*field(HeadLine1; StrSubstNo('%1 %2', 'Welcome', Compinfo.Name))
                {

                }*/

                field(headline1; headlineMgt.GetUserGreetingText())
                {

                }

                field(HeadLine2; StrSubstNo(text002, 'Files Shared Drive'))
                {
                    trigger OnDrillDown()
                    begin
                        Hyperlink('ftp://ftp.exsys.co.th');
                    end;
                }
            }
        }

    }

    trigger OnOpenPage()
    begin
        Compinfo.get;
        Compinfo.CalcFields(Picture);
    end;

    var
        Compinfo: Record "Company Information";
        text001: TextConst ENU = '<qualifier>%1</qualifier>';
        text002: TextConst ENU = '<payload><emphasize>%1</emphasize></payload>';

        headlineMgt: Codeunit "Headlines";

}
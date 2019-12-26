page 60085 "Project Activity"
{
    PageType = CardPart;
    SourceTable = "Exsys-Issue Cue";

    layout
    {
        area(content)
        {
            cuegroup(Control3)
            {
                ShowCaption = false;
                field(Project; Project)
                {

                }
                field("Project-Active"; "Project-Active")
                {
                }
                field("Project-Closed"; "Project-Closed")
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
        CompInfo.GET;
        CompInfo.CALCFIELDS(Picture);
    end;

    var
        CompInfo: Record "Company Information";
}


page 60035 "Exsys Fix bug Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Technical Log Line";

    layout
    {
        area(content)
        {
            repeater(Control11)
            {
                field("Line No.";"Line No.")
                {
                }
                field("Object Type";"Object Type")
                {
                }
                field("Object ID";"Object ID")
                {

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE(true);
                    end;
                }
                field("Object Caption";"Object Caption")
                {
                }
                field(Description;Description)
                {
                }
                field(Responsible;Responsible)
                {
                }
                field("Fixed On Localized Exsys";"Fixed On Localized Exsys")
                {
                }
            }
        }
    }

    actions
    {
    }
}


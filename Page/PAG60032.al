page 60032 "Exsys Localize Subform"
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
                    BlankNumbers = BlankZero;

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
                field(Remark;Remark)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Object Type" := xRec."Object Type";
    end;
}


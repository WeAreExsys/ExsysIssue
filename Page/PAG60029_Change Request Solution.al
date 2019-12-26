page 60029 "Change Request Solution"
{
    AutoSplitKey = true;
    Caption = 'Proposed Solution by Exsys';
    PageType = ListPart;
    SourceTable = "Change Request Solutions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; "Line No.")
                {
                }
                field(Description; Description)
                {

                }
                field("Not Show"; "Not Show")
                {
                }
            }
        }
    }

    actions
    {
    }
}


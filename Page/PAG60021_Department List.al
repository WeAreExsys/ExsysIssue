page 60021 "Department List"
{
    PageType = List;
    SourceTable = Department;
    SourceTableView = SORTING("No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Issue by Department")
            {
                Image = Departments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    //Exsys-Wichit 070915
                    IssueLine.RESET;
                    IssueLine.SETRANGE(Active,true);
                    IssueLine.SETRANGE(Department,"No.");

                    PageIssueLine.SETTABLEVIEW(IssueLine);
                    PageIssueLine.RUN;
                    //+
                end;
            }
        }
    }

    var
        IssueLine : Record "Issue Line";
        PageIssueLine : Page "Issue Line List";
}


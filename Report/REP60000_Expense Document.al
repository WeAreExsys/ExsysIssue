report 60000 "Expense Document"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Expense Document.rdlc';

    dataset
    {
        dataitem("Expense Header";"Expense Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(Company_Name;CompanyInfo.Name)
            {
            }
            column(Company_Adr;CompanyInfo.Address)
            {
            }
            column(Company_Adr2;CompanyInfo."Address 2")
            {
            }
            column(Company_City;CompanyInfo.City)
            {
            }
            column(Company_PostCode;CompanyInfo."Post Code")
            {
            }
            column(Company_PhoneNo;CompanyInfo."Phone No.")
            {
            }
            column(Company_Picture;CompanyInfo.Picture)
            {
            }
            column(Company_FaxNo;CompanyInfo."Fax No.")
            {
            }
            column(Company_HomePage;CompanyInfo."Home Page")
            {
            }
            column(No_ExpenseHeader;"Expense Header"."No.")
            {
            }
            column(DocumentDate_ExpenseHeader;"Expense Header"."Document Date")
            {
            }
            column(UserSetup_FullName;UserSetup."Full Name")
            {
            }
            column(UserSetup_DepartMent;UserSetup.Department)
            {
            }
            column(UserSetup_Position;UserSetup.Position)
            {
            }
            column(Position_Name;Position.Name)
            {
            }
            column(DepartMent_Name;DepartMent.Name)
            {
            }
            dataitem("Expense Line";"Expense Line")
            {
                DataItemLink = "Document No."=FIELD("No.");
                DataItemTableView = SORTING("Document No.","Line No.");
                column(Description_ExpenseLine;"Expense Line".Description)
                {
                }
                column(FromDate_ExpenseLine;"Expense Line"."From Date")
                {
                }
                column(ToDate_ExpenseLine;"Expense Line"."To Date")
                {
                }
                column(Quantity_ExpenseLine;"Expense Line".Quantity)
                {
                }
                column(UnitAmount_ExpenseLine;"Expense Line"."Unit Amount")
                {
                }
                column(Amount_ExpenseLine;"Expense Line".Amount)
                {
                }
                column(ProjectNo_ExpenseLine;"Expense Line"."Project No.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    //Exsys-Wichit 220915
                    LineCount += 1;
                    //+
                end;
            }
            dataitem("Integer";"Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Number_Integer;Integer.Number)
                {
                }

                trigger OnPreDataItem();
                begin
                    //Exsys-Wichit 220915
                    SETRANGE(Number,1,MaxLine - LineCount);
                    //+
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Exsys-Wichit 220915
                MaxLine := 10;
                CLEAR(LineCount);

                UserSetup.RESET;
                if UserSetup.GET("Requested by") then begin
                  Position.RESET;
                  if Position.GET(UserSetup.Position) then;
                  DepartMent.RESET;
                  if DepartMent.GET(UserSetup.Department) then;
                end;
                //+
            end;

            trigger OnPreDataItem();
            begin
                //Exsys-Wichit 220915
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                //+
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        CompanyInfo : Record "Company Information";
        MaxLine : Integer;
        LineCount : Integer;
        UserSetup : Record "User Setup";
        Position : Record Position;
        DepartMent : Record Department;
}


page 60080 "Exsys Issue Role Center"
{
    // version Issue - Role Center

    PageType = RoleCenter;
    PromotedActionCategories = 'Setup';

    layout
    {
        area(rolecenter)
        {

            part(PageHeadLine; "Role Center HeadLine")
            {

            }

            group(Control25)
            {
                group(Project)
                {
                    Caption = 'Project';
                    part(Control23; "Project Activity")
                    {
                        Caption = 'Project';
                    }
                }
                group(Setup)
                {
                    Caption = 'Setup';
                    part(Expense; "Exsys-Issue Expense")
                    {
                        Caption = 'Expense';
                    }
                }
                group(Control2)
                {

                    part("Issue & MA Plan"; "Exsys-Issue Activities")
                    {
                        Caption = 'Issue & MA Plan';
                    }
                }
            }
            part(Control7; "My Project")
            {
                ApplicationArea = All;
            }

        }
    }
    actions
    {
        area(sections)
        {

            group(MenuBtn)
            {
                Caption = 'Menu';
                Image = CashFlow;

                action(ProjectAll)
                {
                    Caption = 'Project';
                    RunObject = Page "Project List";
                }
                action(ProjectActive)
                {
                    Caption = 'Active';
                    RunObject = Page "Project List";
                    RunPageView = SORTING("No.") WHERE(Status = CONST(Active));
                }
                action(ProjectClosed)
                {
                    Caption = 'Closed';
                    RunObject = Page "Project List";
                    RunPageView = SORTING("No.") WHERE(Status = CONST(Closed));
                }
                group(ExpDoc)
                {
                    Caption = 'Expense';

                    action("Expense Document")
                    {
                        Caption = 'Expense Document';
                        Image = ProjectExpense;
                        RunObject = Page "Expense Document List";
                    }
                    action(Action32)
                    {
                        Caption = 'Release Expense Document';
                        Image = ReleaseDoc;
                        RunObject = Page "Release Expense Document";
                    }
                }


                action("Change Request")
                {
                    Caption = 'Change Request';
                    RunObject = Page "Change Request List";
                }

                action(MAPlan)
                {
                    Caption = 'Maintenance Plan';
                    RunObject = Page "MA List";
                }

            }
        }
        area(processing)
        {
            /*
            group(SystemSetup)
            {
                Caption = 'System Setup'; */
            action("Issue Notification")
            {
                Caption = 'Issue Notification';
                Image = Alerts;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Issue Notification";
            }
            action("Task Setup")
            {
                Caption = 'Task Setup';
                Image = TaskList;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page "Task List";
            }
            action("Project Setup")
            {
                Caption = 'Project Setup';
                Image = ProjectToolsProjectMaintenance;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Project List";
            }
            action("Expense Setup")
            {
                Caption = 'Expense Setup';
                Image = ContractPayment;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Expense Code";
            }
            action("Project Management Setup")
            {
                Caption = 'Project Management Setup';
                Image = Setup;
                RunObject = Page "Project Management Setup";
            }
            action("Company Infomation")
            {
                Caption = 'Company Infomation';
                Image = CompanyInformation;
                RunObject = Page "Company Information";
            }
            action("No. Series")
            {
                Caption = 'No. Series';
                Image = NumberSetup;
                RunObject = Page "No. Series";
            }
            action("Resource Usage")
            {
                Caption = 'Resource Usage';
                Image = Planning;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page "Resource Usage";
            }
            action(DocumentHomeRoom)
            {
                Caption = 'Document HomeRoom';
                Image = Document;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Document Homeroom List";
                RunPageOnRec = true;
            }
            action("Tracking Your Team")
            {
                Image = Track;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Tracking Working on Your Team";
            }

            action("FTP Share")
            {
                Image = Document;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = codeunit "FTP URL";
            }

            //}
        }
    }
}


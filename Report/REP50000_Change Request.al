report 50000 "Change Request"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Report/Change Request.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Change Request Header"; "Change Request Header")
        {
            column(Pic_CompanyInfo; CompanyInfo.Picture)
            {
            }
            column(Signature_CompanyInfo; CompanyInfo."Approved by Signature")
            {
            }
            column(ProjectName_Project; Project.Name)
            {
            }
            column(No_ChangeRequestHeader; "Change Request Header"."No.")
            {
            }
            column(ProjectNo_ChangeRequestHeader; "Change Request Header"."Project No.")
            {
            }
            column(ReceivedDate_ChangeRequestHeader; "Change Request Header"."Received Date")
            {
            }
            column(CreatedBy_ChangeRequestHeader; "Change Request Header"."Created By")
            {
            }
            column(Status_ChangeRequestHeader; "Change Request Header".Status)
            {
            }
            column(ReceivedFromCustomerName_ChangeRequestHeader; "Change Request Header"."Received From Customer Name")
            {
            }
            column(DocumentDate_ChangeRequestHeader; "Change Request Header"."Document Date")
            {
            }
            column(Priority_ChangeRequestHeader; "Change Request Header".Priority)
            {
            }
            column(AreasAffected_ChangeRequestHeader; "Change Request Header"."Areas Affected")
            {
            }
            column(ChargableUsageDay_ChangeRequestHeader; "Change Request Header"."Chargable Usage Day")
            {
            }
            column(BillingRequired_ChangeRequestHeader; "Change Request Header"."Billing Required")
            {
            }
            column(BillingReq; BillingReq)
            {
            }
            column(BillineComment_ChangeRequestHeader; "Change Request Header"."Billine Comment")
            {
            }
            dataitem("Change Request Line"; "Change Request Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(LineNo_ChangeRequestLine; "Change Request Line"."Line No.")
                {
                }
                column(TaskDescription_ChangeRequestLine; "Change Request Line"."Task Description")
                {
                }
                column(LineCount21; LineCount2)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    if "Change Request Line"."Task Description" <> '' then
                        LineCount1 += 1;
                end;
            }
            dataitem(Int1; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Int1; Int1.Number)
                {
                }

                trigger OnPreDataItem();
                begin
                    SETRANGE(Number, 1, MaxLine1 - LineCount1);
                end;
            }
            dataitem("Change Request Solutions"; "Change Request Solutions")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") WHERE("Not Show" = CONST(false));
                column(LineNo_ChangeRequestSolutions; "Change Request Solutions"."Line No.")
                {
                }
                column(Description_ChangeRequestSolution; "Change Request Solutions".Description)
                {
                }
                column(LineCount22; LineCount2)
                {
                }
                column(LineNo; LieNo)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    if LineCount2 = MaxLine2 then begin
                        MaxLine2 := 22;
                        LineCount2 := 0;
                    end;

                    LineCount2 += 1;

                    if "Change Request Solutions".Description <> '' then
                        LieNo += 1;
                end;
            }
            dataitem(Int2; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Int2; Int2.Number)
                {
                }

                trigger OnPreDataItem();
                begin
                    SETRANGE(Number, 1, MaxLine2 - LineCount2);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(CompanyInfo);
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                CompanyInfo.CALCFIELDS(CompanyInfo."Approved by Signature");

                CLEAR(Project);
                Project.SETCURRENTKEY(Project."No.");
                Project.SETRANGE(Project."No.", "Change Request Header"."Project No.");
                if Project.FIND('-') then;

                MaxLine1 := 8;
                MaxLine2 := 11;

                if "Change Request Header"."Billing Required" = true then
                    BillingReq := 'YES'
                else
                    BillingReq := 'No';
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
        CompanyInfo: Record "Company Information";
        Project: Record Project;
        MaxLine1: Integer;
        LineCount1: Integer;
        MaxLine2: Integer;
        LineCount2: Integer;
        BillingReq: Text;
        LieNo: Integer;
}


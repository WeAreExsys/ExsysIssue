page 60006 "Issue Document"
{
    // version Issue

    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Issue Header";
    SourceTableView = SORTING("No.");

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ShowMandatory = true;

                    trigger OnAssistEdit();
                    begin
                        ///Exsys-Wichit 160615
                        if AssistEdit(xRec) then
                            CurrPage.UPDATE;
                        //+
                    end;

                    trigger OnValidate();
                    begin
                        //Exsys-Golf Comment 170915
                        //CreateTaskLine("No.");
                        //*
                    end;
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Name of Consultant"; "Name of Consultant")
                {
                }
                field("Received From Customer Name"; "Received From Customer Name")
                {
                    Caption = 'Contact Person';
                    ShowMandatory = true;
                }
                field(Type; Type)
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Project No."; "Project No.")
                {
                    ShowMandatory = true;
                }
                field("Phase No."; "Phase No.")
                {
                    ShowMandatory = Type = type::Implement;
                }
                field("MA No."; "MA No.")
                {
                    ShowMandatory = Type = type::Maintenance;
                }
                field("Ref. Issue (Type MA Ref. Only)"; "Ref. Issue No.")
                {
                    ShowMandatory = Type = Type::"MA Ref.";
                    Visible = false;
                }
                field(Onsite; Onsite)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        //Exsys-Wichit 090915
                        //Exsys-Golf Comment
                        /*
                        IF Onsite THEN BEGIN
                          OnsiteChk := TRUE;
                        END ELSE BEGIN
                          "No. Person Onsite" := 0;
                          OnsiteChk := FALSE;
                        END;*/
                        //+

                    end;
                }
                field("No. Person Onsite"; "No. Person Onsite")
                {
                    Editable = false;
                    Visible = false;

                    trigger OnValidate();
                    begin
                        //
                    end;
                }
                field("Change Request No."; "Change Request No.")
                {
                }
                field("Service Log Sheet No."; "Service Log Sheet No.")
                {
                    ShowMandatory = Onsite = TRUE;
                }
                field("Required Sign-off"; "Required Sign-off")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        //Exsys-Wichit 030915
                        CurrPage.UPDATE(true);
                        //+
                    end;
                }
                field(Closed; Closed)
                {
                    Visible = false;
                }
                field("MA Usage Day"; "MA Usage Day")
                {
                    ShowMandatory = Type = type::Maintenance;
                }
                field("Chargable Usage Day"; "Chargable Usage Day")
                {
                    ShowMandatory = Type = Type::"Chargable Service";
                }
                field("Received Date"; "Received Date")
                {
                    ShowMandatory = true;
                    Visible = false;
                }
                field("PO Number"; "PO Number")
                {
                    Visible = false;
                }
                field("Expected Starting Date"; "Expected Starting Date")
                {
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Expected Finished Date"; "Expected Finished Date")
                {
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Created By"; "Created By")
                {
                }
                field(Status; Status)
                {
                    ShowMandatory = true;

                    trigger OnValidate();
                    begin
                        //Exsys-Wichit 070915
                        CurrPage.UPDATE(true);
                        //+
                    end;
                }
                field(Leave; Leave)
                {
                    Editable = false;
                    Visible = false;
                }
            }
            group(Description)
            {
                Caption = 'Description';
                field(Control41; Description)
                {
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
            part(Control31; "Issue Document Subform")
            {
                SubPageLink = "Issue No." = FIELD("No.");
                Visible = false;
            }
            part(Control18; "Issue Solution")
            {
                SubPageLink = "Issue No." = FIELD("No.");
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup40)
            {
                action("Create Task")
                {
                    Image = ExplodeBOM;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-Wichit 070915
                        //TESTFIELD(Status,Status::Release);

                        //IF Onsite THEN
                        //  TESTFIELD("No. Person Onsite");

                        if Onsite then begin
                            // CreateLine("No.",'Onsite',FALSE,FALSE);
                            MESSAGE('Please add onsite person by click Add Onsite Person button.');
                        end else begin
                            case Type of
                                Type::Implement:
                                    begin
                                        CreateLine("No.", 'Implement', false, false);
                                    end;
                                Type::Maintenance:
                                    begin
                                        CreateLine("No.", 'Maintenance', false, false);
                                    end;
                                Type::"Chargable Service":
                                    begin
                                        CreateLine("No.", 'Chargable Service', false, false);
                                    end;
                                Type::Other:
                                    begin
                                        CreateLine("No.", 'Other', false, false);
                                    end;
                                Type::"MA Ref.":
                                    begin
                                        CreateLine("No.", 'MA Ref.', false, false);
                                    end;
                            end;
                        end;

                        if "Required Sign-off" then begin
                            CreateLine("No.", 'Required Sign-off', true, false);
                        end;
                        //+
                    end;
                }
                action("Generate Change Request No.")
                {
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-keng050915
                        TESTFIELD("Change Request No.", '');
                        //TESTFIELD(Type,Type::"Chargable Service");

                        if (Type <> Type::"Chargable Service") and (Type <> Type::Maintenance) then  //modified by cs 20151027
                            ERROR('Type must be chargable service or Maintenance.');
                        //+
                        //Exsys-Wichit 030915
                        if not CONFIRM('Do you want to generate change request no.?', false) then
                            exit;

                        MgtSetup.GET;
                        MgtSetup.TESTFIELD("Change Request Nos.");
                        "Change Request No." := NoSeriesMgt.GetNextNo(MgtSetup."Change Request Nos.", WORKDATE, true);
                        //+
                    end;
                }
                action("Attach File")
                {
                    Caption = 'Attach File';
                    Image = MailAttachment;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Issue Attach File";
                    RunPageLink = "Issue No." = FIELD("No.");
                    RunPageMode = View;
                    RunPageView = SORTING("Issue No.");
                }
                action(Close)
                {
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-Wichit 030915
                        //Exsys-keng 050915
                        if Type = Type::"MA Ref." then
                            ERROR('You cannot close MA Ref issue, you must go to main issue for closing');
                        //+
                        TESTFIELD(Status, IssueHeader.Status::Release); //exsys-cs 20150922
                        if not CONFIRM('Do you want to Close Issue Document No.%1', false, "No.") then
                            exit;
                        //Exsys-keng 050915
                        if Type = Type::Maintenance then begin
                            IssueHeader.RESET;
                            IssueHeader.SETRANGE("Ref. Issue No.", "No.");
                            if IssueHeader.FINDSET then
                                repeat
                                    MESSAGE('System will also close issue no. %1 because it is MA Ref that related to this document.', IssueHeader."No.");
                                    IssueHeader.Closed := true;
                                    IssueHeader.MODIFY;
                                until IssueHeader.NEXT = 0;
                        end;
                        //+
                        Closed := true;
                        //+
                    end;
                }
                action("Undo Close")
                {
                    Image = Undo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-Wichit 030915
                        if not CONFIRM('Do you want to Undo Issue Document No.%1', false, "No.") then
                            exit;
                        //Exsys-keng 050915
                        if Type = Type::Maintenance then begin
                            IssueHeader.RESET;
                            IssueHeader.SETRANGE("Ref. Issue No.", "No.");
                            if IssueHeader.FINDSET then
                                repeat
                                    MESSAGE('System will also undo issue no. %1 because it is MA Ref that related to this document.', IssueHeader."No.");
                                    IssueHeader.Closed := false;
                                    IssueHeader.MODIFY;
                                until IssueHeader.NEXT = 0;
                        end;
                        //+

                        Closed := false;
                        //+
                    end;
                }
                action("Change Request")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-keng
                        TESTFIELD("Change Request No.");
                    end;
                }
                action("Sign-off Document (Job)")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action("BA Sign-off")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action("Prototype Sign-off")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action("Development Sign-off")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action("Migration Sign-off")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action("Training Sign-off")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action("Go Live Sign-off")
                {
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        //Exsys-keng
                    end;
                }
                action(OnsiteBtn)
                {
                    Caption = 'Add Onsite Person';
                    Image = CustomerGroup;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //Exsys-Wichit 070915
                        TESTFIELD(Onsite);
                        CreateLine("No.", 'Onsite', false, true);
                        //+
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        //Exsys-Wichit 090915
        if Onsite then begin
            OnsiteChk := true;
        end else begin
            "No. Person Onsite" := 0;
            OnsiteChk := false;
        end;

        if Status = Status::Release then begin
            ChkRelease := true;
        end else begin
            ChkRelease := false;
        end;
        //+
    end;

    var
        IssueHeader: Record "Issue Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MgtSetup: Record "Project Management Setup";
        LineNo: Integer;
        IssueLine: Record "Issue Line";
        TaskDetail: Record Task;
        [InDataSet]
        OnsiteChk: Boolean;
        i: Integer;
        xLoop: Integer;
        [InDataSet]
        ChkRelease: Boolean;
        IssueNot: Record "Issue Notification";

    local procedure CreateLine(DocNo: Code[20]; OptionType: Text[50]; CreateOneLine: Boolean; AddPerson: Boolean);
    var
        FirstActive: Boolean;
    begin
        //Exsys-Wichit 070915
        CLEAR(LineNo);
        CLEAR(FirstActive);
        IssueLine.RESET;
        IssueLine.SETRANGE("Issue No.", "No.");
        if IssueLine.FINDLAST then
            LineNo := IssueLine."Line No.";

        TaskDetail.RESET;
        if 'Implement' = OptionType then
            TaskDetail.SETRANGE(Implement, true);
        if 'Maintenance' = OptionType then
            TaskDetail.SETRANGE(Maintenance, true);
        if 'Chargable Service' = OptionType then
            TaskDetail.SETRANGE("Chargable Service", true);
        if 'Other' = OptionType then
            TaskDetail.SETRANGE(Other, true);
        if 'Required Sign-off' = OptionType then
            TaskDetail.SETRANGE("Required Sign-off", true);
        if 'Onsite' = OptionType then
            TaskDetail.SETRANGE(Onsite, true);

        if CreateOneLine then begin
            xLoop := 1;
        end else
            if AddPerson then begin
                xLoop := 1;
                "No. Person Onsite" += 1;
            end else begin
                if Onsite then begin
                    xLoop := "No. Person Onsite";
                end else begin
                    xLoop := 1;
                end;
            end;

        for i := 1 to xLoop do begin
            if TaskDetail.FINDSET then begin
                repeat
                    IssueLine.RESET;
                    IssueLine.INIT;
                    LineNo += 10000;
                    IssueLine."Issue No." := DocNo;
                    IssueLine."Line No." := LineNo;
                    IssueLine.VALIDATE("Task No.", TaskDetail."No.");
                    IssueLine.VALIDATE("Task Description", TaskDetail.Description);
                    IssueLine."Plan Start Date" := "Expected Starting Date";
                    IssueLine."Plan Finished Date" := "Expected Finished Date";


                    if 'Onsite' = OptionType then begin
                        IssueLine.Onsite := true;
                        IssueLine.Active := true;
                        //Onsite := TRUE;
                    end;

                    if FirstActive = false then begin
                        IssueLine.Active := true;
                        IssueLine."Assigned by User" := USERID;
                        FirstActive := true;
                    end;

                    IssueLine.INSERT;
                until TaskDetail.NEXT = 0;
            end;
        end;
        //+
    end;
}


report 60001 "Update Status MA"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Maintenance Agreement";"Maintenance Agreement")
        {
            DataItemTableView = SORTING("No.") WHERE(Status=CONST(Active));

            trigger OnAfterGetRecord();
            begin
                //Exsys-Golf
                if "Ending Date (MA)" < TODAY then
                  begin
                    Status := "Maintenance Agreement".Status::Closed;
                    MODIFY;
                  end;
                //*
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
}


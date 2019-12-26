tableextension 61000 UserSetup_Extend extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(60000; Department; Code[20])
        {

        }

        field(60001; Position; COde[20])
        {

        }
        Field(60002; Usage; Integer)
        {

        }
        field(60003; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(60004; "Active Filter"; Boolean)
        {
            FieldClass = FlowFilter;
        }
        field(60005; "Closed Filter"; Boolean)
        {
            FieldClass = FlowFilter;
        }
        field(60006; "Project Team"; Boolean)
        {

        }
        field(60007; "Old UserName"; Code[50])
        {

        }
        field(60008; "Full Name"; Text[200])
        {

        }

    }

    var

}
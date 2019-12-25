page 60064 "Localize Topic subform"
{
    // version Package License Localization

    PageType = ListPart;
    SourceTable = "Localize Topic Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type";"Object Type")
                {
                }
                field("Object No.";"Object No.")
                {
                }
                field("Object Name";"Object Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}


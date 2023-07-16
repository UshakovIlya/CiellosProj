pageextension 50103 "Customer List" extends "Customer List"
{

    actions
    {
        addfirst(Functions)
        {
            action(DelRec)
            {
                Caption = 'Delete Customer';
                ToolTip = 'Executes the Delete Customer action.';

                ApplicationArea = all;
                Image = Delete;

                trigger OnAction()
                begin
                    if Confirm(CustDeleteLbl, true, Rec."No.") then
                        Rec.Delete(true);
                end;
            }
        }

        addfirst(Promoted)
        {
            actionref(DelRecRef; DelRec) { }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Error('Please, try another action');
    end;

    var
        CustDeleteLbl: LAbel 'Do you really want to delete the %1 customer?';
}

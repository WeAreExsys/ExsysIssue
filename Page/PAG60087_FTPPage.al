page 60087 "FTP Page"
{
    Caption = 'FTP';


    layout
    {
        area(Content)
        {
            usercontrol(FTPViewer; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
            {
                trigger ControlAddInReady(callbackUrl: Text)
                begin
                    CurrPage.FTPViewer.Navigate(FTP_URL);
                end;

                trigger DocumentReady()
                begin
                end;

                trigger Callback(data: Text)
                begin
                end;

                trigger Refresh(callbackUrl: Text)
                begin
                    CurrPage.FTPViewer.Navigate(FTP_URL);
                end;
            }
        }
    }

    actions
    {

    }

    var
        FTP_URL: TextConst ENU = 'www.google.com';
}
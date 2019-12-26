codeunit 60002 "XML Get Webservice"
{

    trigger OnRun();
    begin

        //ObjectNav := ObjectNav.NAV(Uri.Uri(URLTxt2));
        //ObjectNav.Credentials := NetworkCredential.NetworkCredential('Administrator', 'P@ssw0rd', 'Exsys');

        //ObjectNav.ObjectPort

        //First Step
        /*
        xml := xml.XmlDocument();
        XmlResolver := XmlResolver.XmlUrlResolver;
        XmlResolver.Credentials(NetworkCredential.NetworkCredential('Administrator','P@ssw0rd','Exsys'));
        xml.XmlResolver(XmlResolver);
        xml.Load(URLTxt);
        //Second step
        xmlnodelist := xml.SelectNodes('//*');
        MESSAGE('%1',xmlnodelist.ToString);*/
        /*
        IF( xmlnodelist.ToString()&lt;&gt;'') THEN
        BEGIN
          j:=xmlnodelist.Count;
        
          FOR i := 0 TO xmlnodelist.Count - 1 DO
          BEGIN
            xmlnode := xmlnodelist.Item(i);
            CASE xmlnode.Name OF
              'Value': [Field or variable to store value]:= xmlnode.FirstChild.InnerText;
            // add more cases
            End
        End
        */
        /*
        navBinding := navBinding.BasicHttpBinding;
        // Set security mode to BasicHttpSecurityMode.TransportCredentialOnly
        navBinding.Security.Mode := 4;
        //address :=
            //'http://localhost:7047/DynamicsNAV70/WS/CRONUS%20International%20Ltd./Page/SalesOrder';
        // Set client credential type to HttpClientCredentialType.Windows
        navBinding.Security.Transport.ClientCredentialType := 4;
        
        ObjectNav := ObjectNav.ObjectPort(navBinding,
            endpointAddress.EndpointAddress(URLTxt));
        // Set impersonation level to System.Security.Principal.TokenImpersonationLevel.Delegation
        salesOrderService.ClientCredentials.Windows.AllowedImpersonationLevel := 4;
        // Include the sales order ID to be read.
        salesOrder := salesOrderService.Read('10000');
        */

    end;

    var
    /*
    xml : DotNet "'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlDocument";
    xmlnodelist : DotNet "'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeList";
    i : Integer;
    xmlNode : DotNet "'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNode";
    URLTxt : Label 'http://nav2017.exsys.co.th:8203/Exsys_Localize/OData/ObjectPort';
    j : Integer;


    XmlResolver : DotNet "'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlUrlResolver";
    NetworkCredential : DotNet "'System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Net.NetworkCredential";
    ObjectNav : DotNet "'ObjectPortable_Localize, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'.ObjectPortable_Localize.NAVODATA.NAV";
    endpointAddress : DotNet "'System.ServiceModel, Version=3.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.EndpointAddress";
    Uri : DotNet "'System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Uri";
    navBinding : DotNet "'System.ServiceModel, Version=3.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.BasicHttpBinding";
    URLTxt2 : Label 'http://nav2017.exsys.co.th:8203/Exsys_Localize/OData/Company(''Exsys Co., Ltd.'')';
    */

    //event xml(sender : Variant;e : DotNet "'System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeChangedEventArgs");
    //begin
    /*
    */
    //end;

    //event xml(sender : Variant;e : DotNet "'System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeChangedEventArgs");
    //begin
    /*
    */
    //end;

    //event xml(sender : Variant;e : DotNet "'System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeChangedEventArgs");
    //begin
    /*
    */
    //end;

    //event xml(sender : Variant;e : DotNet "'System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeChangedEventArgs");
    //begin
    /*
    */
    //end;

    //event xml(sender : Variant;e : DotNet "'System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeChangedEventArgs");
    //begin
    /*
    */
    //end;

    //event xml(sender : Variant;e : DotNet "'System.Xml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeChangedEventArgs");
    //begin
    /*
    */
    //end;

    //event ObjectNav(sender : Variant;e : DotNet "'Microsoft.Data.Services.Client, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.System.Data.Services.Client.SendingRequestEventArgs");
    //begin
    /*
    */
    //end;

    //event ObjectNav(sender : Variant;e : DotNet "'Microsoft.Data.Services.Client, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.System.Data.Services.Client.SendingRequest2EventArgs");
    //begin
    /*
    */
    //end;

    //event ObjectNav(sender : Variant;e : DotNet "'Microsoft.Data.Services.Client, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.System.Data.Services.Client.ReadingWritingEntityEventArgs");
    //begin
    /*
    */
    //end;

    //event ObjectNav(sender : Variant;e : DotNet "'Microsoft.Data.Services.Client, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.System.Data.Services.Client.ReadingWritingEntityEventArgs");
    //begin
    /*
    */
    //end;
}


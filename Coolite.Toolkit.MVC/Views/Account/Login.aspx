﻿<%@ Page Language="C#" %>

<%@ Register assembly="Coolite.Ext.Web" namespace="Coolite.Ext.Web" tagprefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Northwind Traders - Sample web application using the Coolite Toolkit, ExtJS and ASP.NET MVC</title>    
    <style type="text/css">
        h1 {
            font: normal 60px tahoma, arial, verdana;
            color: #E1E1E1;
        }
        
        h2 {
            font: normal 20px tahoma, arial, verdana;
            color: #E1E1E1;
        }
        
        h2 a {
            text-decoration: none;
            color: #E1E1E1;
        }
    </style>
    <script type="text/javascript">
        if (window.top.frames.length !=0 ) {
            window.top.location = self.document.location;
        }
    </script>
</head>
<body>
    <ext:ScriptManager runat="server" />
    
    <h1>Northwind Traders</h1>
    <h2>Powered by the <a href="http://www.coolite.com/">Coolite Toolkit</a>, <a href="http://www.extjs.com/">ExtJS</a> and <a href="http://www.asp.net/mvc/">ASP.NET MVC</a></h2>
    <ext:Window 
        runat="server" 
        Closable="false"
        Resizable="false"
        Height="130" 
        Icon="Lock" 
        Title="Login"
        Draggable="true"
        Width="300"
        Modal="true"
        BodyBorder="false"
        BodyStyle="padding:5px;">
        <Body>
            <ext:FitLayout runat="server">
                <ext:FormPanel 
                    runat="server" 
                    FormID="form1"
                    Border="false"
                    BodyBorder="false" 
                    BodyStyle="background:transparent;" 
                    Url='<%# Html.AttributeEncode(Url.Action("Login")) %>'>
                    <Body>
                        <ext:FormLayout ID="layLogin" runat="server">
                            <ext:Anchor Horizontal="100%">
                                <ext:TextField 
                                    ID="txtUsername" 
                                    runat="server" 
                                    FieldLabel="Username" 
                                    AllowBlank="false"
                                    BlankText="Username is required."
                                    Text="demo"
                                    />
                            </ext:Anchor>
                            <ext:Anchor Horizontal="100%">
                                <ext:TextField 
                                    ID="txtPassword" 
                                    runat="server" 
                                    InputType="Password" 
                                    FieldLabel="Password" 
                                    AllowBlank="false" 
                                    BlankText="Password is required."
                                    Text="demo"
                                    />
                            </ext:Anchor>    
                        </ext:FormLayout>
                    </Body>
                </ext:FormPanel>
            </ext:FitLayout>
        </Body>
        <Buttons>
            <ext:Button runat="server" Text="Login" Icon="Accept">
                <AjaxEvents>
                    <Click 
                        Url="/Account/Login/" 
                        FormID="form1"
                        CleanRequest="true" 
                        Method="POST"
                        Before="Ext.Msg.wait('Verifying...', 'Login');"
                        Failure="Ext.Msg.show({
                           title:   'Login Error',
                           msg:     result.errorMessage,
                           buttons: Ext.Msg.OK,
                           icon:    Ext.MessageBox.ERROR
                        });">
                        <EventMask MinDelay="500" />
                        <ExtraParams>
                            <ext:Parameter Name="ReturnUrl" Value="Ext.urlDecode(String(document.location).split('?')[1]).r || '/'" Mode="Raw" />
                        </ExtraParams>
                    </Click>
                </AjaxEvents>
            </ext:Button>
        </Buttons>
    </ext:Window>
</body>
</html>

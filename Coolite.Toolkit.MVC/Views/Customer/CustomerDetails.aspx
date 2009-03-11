<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Register Assembly="Coolite.Ext.Web" Namespace="Coolite.Ext.Web" TagPrefix="ext" %>
<%@ Register src="CustomerDetailsGeneral.ascx" tagname="CustomerDetailsGeneral" tagprefix="uc1" %>
<%@ Register src="CustomerDetailsOrders.ascx" tagname="CustomerDetailsOrders" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <ext:ScriptManager ID="ScriptManager1" runat="server" />
    
    
    
    <ext:ViewPort ID="ViewPort1" runat="server">
        <Body>
            <ext:FitLayout ID="FitLayout1" runat="server">
                <ext:Panel ID="ToolbarsPanel" runat="server" Border="false">
                     <TopBar>
                        <ext:Toolbar ID="TopBar" runat="server">
                            <Items>
                                <ext:ToolbarTextItem runat="server" Text="TopBar"></ext:ToolbarTextItem>
                            </Items>
                        </ext:Toolbar>
                     </TopBar>
                     
                     <Body>
                         <ext:FitLayout ID="FitLayout2" runat="server">
                                <ext:TabPanel ID="TabPanel1" runat="server">
                                    <Tabs>
                                        <ext:Tab ID="tabGeneralDetails" runat="server" Title="General" BodyStyle="padding:6px;">
                                            <Body>
                                                <uc1:CustomerDetailsGeneral runat="server" />
                                            </Body>
                                        </ext:Tab>
                                        
                                        <ext:Tab ID="tabOrders" runat="server" Title="Orders">
                                            <Body>
                                                <uc1:CustomerDetailsOrders runat="server" />
                                            </Body>
                                        </ext:Tab>
                                    </Tabs>
                                </ext:TabPanel>
                         </ext:FitLayout>
                     </Body> 
                     
                     <BottomBar>
                         <ext:PagingToolbar ID="CustomerPager" runat="server" PageSize="1" StoreID="CustomerStore">
                            <Items>
                                <ext:ToolbarSeparator />
                                <ext:Label runat="server" Icon="Magnifier"></ext:Label>
                                <ext:ToolbarSpacer />
                                <ext:TextField ID="SearchPattern" runat="server" EmptyText="[Search]" EnableKeyEvents="true">
                                    <Listeners>
                                        <KeyDown Buffer="1000" Handler="#{CustomerStore}.reload();#{ClearSearch}.setDisabled(Ext.isEmpty(this.getValue(), false));" />
                                    </Listeners>
                                </ext:TextField>
                                <ext:ToolbarButton ID="ClearSearch" runat="server" Icon="Cross" Disabled="true">
                                    <ToolTips>
                                        <ext:ToolTip runat="server" Html="Clear search field"></ext:ToolTip>
                                    </ToolTips>
                                    <Listeners>
                                        <Click Handler="#{SearchPattern}.reset();#{CustomerStore}.reload();" />
                                    </Listeners>
                                </ext:ToolbarButton>
                            </Items>
                         </ext:PagingToolbar>
                     </BottomBar>
                </ext:Panel>
                
            </ext:FitLayout>
        </Body>
    </ext:ViewPort>
</body>
</html>

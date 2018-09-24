<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FOSAFundsTransfer.aspx.cs" Inherits="SACCOPortal.TransferFunds" MasterPageFile="~/Site.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="col-md-9">
            <div id="lblFOSAfundsTransfer" class="alert alert-info fade in">
    
                <asp:Label ID="Label1" runat="server" Text="FOSA to BOSA or FOSA to BOSA funds Transfer"></asp:Label>
    
            </div>
           
            <asp:DropDownList ID="DropDownListSourceAccFOSATransfer" runat="server" CssClass="form-control">
                <asp:ListItem>Select account</asp:ListItem>
                <asp:ListItem>Savings Account</asp:ListItem>
                <asp:ListItem>Holiday Account</asp:ListItem>
                <asp:ListItem>Juniour account</asp:ListItem>
            </asp:DropDownList>
            <p>
                <asp:TextBox ID="TextBoxFOSAAccTransfer" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem>Select Account</asp:ListItem>
                    <asp:ListItem>Junior Account</asp:ListItem>
                    <asp:ListItem>Savings Account</asp:ListItem>
                    <asp:ListItem>Holiday Account</asp:ListItem>
                </asp:DropDownList>
            </p>
            <asp:Button  ID ="ButtonFOSAFundsTransfer" CssClass="btn btn-primary" runat="server" OnClick="ButtonFOSAFundsTransfer_Click" Text="Send" />
        </div>
        <div class="col-md-3">
            <!-- List starts -->
				<ul class="today-datas">
                <!-- List #1 -->
				<li>
                  <!-- Graph -->
                  <div><span id="todayspark1" class="spark"></span></div>
                  <!-- Text -->
                  <div class="datas-text">11,500 visitors/day</div>
                </li>
                <li>
                  <div><span id="todayspark2" class="spark"></span></div>
                  <div class="datas-text">15,000 Pageviews</div>
                </li>
                <li>
                  <div><span id="todayspark3" class="spark"></span></div>
                  <div class="datas-text">30.55% Bounce Rate</div>
                </li>
                <li>
                  <div><span id="todayspark4" class="spark"></span></div>
                  <div class="datas-text">$16,00 Revenue/Day</div>
                </li> 
                <li>
                  <div><span id="todayspark5" class="spark"></span></div>
                  <div class="datas-text">12,000000 visitors every Month</div>
                </li>                                                                                                              
              </ul>
        </div>
            
</asp:Content>

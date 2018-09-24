<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deposits.aspx.cs" Inherits="SACCOPortal.Deposits" MasterPageFile="~/Site.Master" %>

<asp:Content ID="depositsContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="lblFOSAfundsTransfer" class="alert tab-bg-info fade in">
        <h3  style="font-weight:bold; color:#fff; text-align:center;">Adjust Deposit Contributions</h3>
    </div>
     <!--tab nav start-->
    <section class="panel">
        <header class="panel-heading tab-bg-info">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a data-toggle="tab" href="#Application">Application</a>
                </li>
                <%--<li class="">
                    <a data-toggle="tab" href="#about">New Standing Order</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#profile">Profile</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#contact">Contact</a>
                </li>--%>
            </ul>
        </header>
        <div class="panel-body">
            <div class="tab-content">
                <div id="home" class="tab-pane ">
                   
                </div>
                <div id="Application" class="tab-pane active">
                    <h3>Adjust Monthly Contributions</h3>
                    
                        <div class="form-group">
                            <label class="control-label label">Associated Account</label>                           
                            <asp:DropDownList ID="ddlDespositsAcc" runat="server" AppendDataBoundItems="true" CssClass="form-control">
                                <asp:ListItem Text="--selec account--"></asp:ListItem>
                            </asp:DropDownList>  
                        </div>
                        <div class="form-group">
                        <label class="control-label label" for="tags">Amount</label>
                            <asp:TextBox ID="txtBoxDpstAmnt" runat="server" CssClass="form-control"></asp:TextBox>
                        
                        </div>
                        <div class="form-group">
                            <label class="control-label label" for="tags">New Amount</label>
                       
                                <asp:TextBox ID="txBxNewDpstAmnt" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RqdV" runat="server" ControlToValidate="txBxNewDpstAmnt"
                        CssClass="text-danger" ErrorMessage="Lastname field is required!"></asp:RequiredFieldValidator>     

                            <asp:Button ID="stadingOrderbtn" runat="server" Text="Adjust Monthly Contributions" CssClass="btn btn-primary" OnClick="stadingOrderbtn_Click" />
                        </div>
                <%--<div id="profile" class="tab-pane">Profile</div>
                <div id="contact" class="tab-pane">Contact</div>--%>
            </div>
        </div>
    </section>
    <!--tab nav start-->
</asp:Content>

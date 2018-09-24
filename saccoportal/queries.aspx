<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="queries.aspx.cs" MasterPageFile="Site.Master" Inherits="SACCOPortal.queries" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div id="lblFOSAfundsTransfer" class="alert alert-info fade in">
            <h4  style="font-weight:bold; color:darkgreen;font-family:Tahoma; text-align:center;">We are pleased to receive your suggestions and questions.</h4>
        </div>
   
        <div class="form-group hidden">
            <div class="col-md-2">
                <asp:Label ID="lblemailTo" runat="server" Text="Send email To: "></asp:Label>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="emailTo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
         <br />
        <div class="form-group hidden">
            <div class="col-md-2">
                <asp:Label ID="lblmailFrom" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="cold-md-10">
                <asp:TextBox ID="emailFrom" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="form-group">
            <div class="col-md-12">
                <textarea id="message" class="form-control" cols="20" name="txtAreaMessage" placeholder="Message here..." rows="2"></textarea><br />
            </div>
        </div>
        <asp:Button ID="Querybtn" CssClass="btn btn-primary" runat="server" Text="Send"  OnClick="Querybtn_Click"/>
    
    </div> 
</asp:content>


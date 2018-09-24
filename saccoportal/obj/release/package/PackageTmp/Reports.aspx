<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" MasterPagefile="Site.Master" Inherits="SACCOPortal.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <br/>
    <% 
     if (Request.QueryString["r"] == "ls")
            {
            %>
  <div class="panel panel-default">
    <div class="panel-heading">My Loans Statement</div>
    <div class="panel-body">
        <p>Select Loan Number <asp:DropDownList ID="ddlLoanStatement" runat="server" CssClass="form-control"></asp:DropDownList></p>
        <asp:Button ID="btnView" runat="server" Text="View Repayment" CssClass="btn btn-primary btn-lg" OnClick="btnView_Click" />
    </div>    
   </div>
    <%
    }
    %>
   <iframe runat="server" id="pdfReport" width="100%" height="500" src=""></iframe>
 </asp:Content>

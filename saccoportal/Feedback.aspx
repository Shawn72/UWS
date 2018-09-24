<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="Feedback.aspx.cs" Inherits="SACCOPortal.Feedback" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="panel-body">
      <div class="form-horizontal">
        <h4>Enter your Feedback</h4>
        <hr />
      <div class="form-group">
          <asp:TextBox ID="txtfeedback" runat="server" placeholder="Enter your Feedback" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> 
      </div>
      <div class="form-group">
          <asp:Button ID="btnsendback" runat="server" Text="Send FeedBack" CssClass="btn btn-warning btn-sm" OnClick="btnsendback_Click" />  
      </div>
      </div>
    </div>
</asp:Content>



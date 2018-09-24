﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loans_Microfinace.aspx.cs" MasterPagefile="Site.Master" Inherits="SACCOPortal.Loans_Microfinace" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p> 
  <div class="panel panel-default">
                <div class="panel-heading">Microfinance Loan Repayment Schedule</div>
                <div class="panel-body">

                    <p>Select FOSA Loan Number: <asp:DropDownList ID="ddRepaidMicrofinance" runat="server" CssClass="form-control"></asp:DropDownList></p>
                    <asp:Button ID="btnView" runat="server" Text="View Repayment" CssClass="btn btn-primary btn-lg" OnClick="btnView_Click" />
                </div>    
            </div>
  
   <iframe runat="server" id="pdfReport" width="100%" height="500" src=""></iframe>
 </asp:Content>

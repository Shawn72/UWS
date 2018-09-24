<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyLoansList.aspx.cs" Inherits="SACCOPortal.MyLoansList"  MasterPageFile="~/Site.Master" %>

<asp:Content ID="loansList" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:GridView ID="GridViewmyLoansList" runat="server"  CssClass="table table-striped table-advance table-hover" GridLines="None" EmptyDataText="No Loans Found!">
            <Columns>
                <asp:BoundField dataField="Loan_No" HeaderText="Loan Number" />
                <asp:BoundField DataField="Loan_Product_Type" HeaderText="Loan Type" />
                <asp:BoundField DataField="Requested_Amount" HeaderText="Requested Amount" />
                <asp:BoundField DataField="Approved_Amount" HeaderText="Approved Amount" />
                <asp:BoundField DataField="Loan_Status" HeaderText="Loan Status" />
                <asp:BoundField DataField="Outstanding_Balance" HeaderText="Outstanding Balance" />
                <asp:BoundField DataField="Repayment_Method" HeaderText="Repayment Method" />
                <%--<asp:BoundField DataField="Action" HeaderText="Action" />--%>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

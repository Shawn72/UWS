<%@ Page Title="Dashboard" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="SACCOPortal.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="height: 20px">&nbsp;</div>
    <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="info-box green-bg">
                   <%-- <i class="fa fa-suitcase"></i>--%>
                     <div class="title">My Permanent Share Capital</div>
                    <div class="count" id="totaldeposits" runat="server"></div>
                    <%--<div class="count">Ksh. <%=Member.totaldeposits17 %></div>--%>
                </div>
                </div>	

				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				    <div class="info-box blue-bg">
				        <%--<i class="fa fa-bank"></i>--%>
                         <div class="title">My Share Deposits</div>
                        <div class="count" id="currentsaving" runat="server"></div>	
				       <%-- <div class="count">Ksh. <%=Member.currentsavings %></div>--%>
				    </div>		
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box red-bg">
						<%--<i class="fa fa-warning"></i>--%>
                        <div class="title">My Outstanding Loans Balance</div>
                        <div class="count" id="toutstandingloans" runat="server"></div>
						<%--<div class="count">Ksh. <%= Member.totalloansoutstanding %></div>--%>
					</div>		
				</div>
				
			</div><!--/.row-->
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <%--<div class="panel-heading text-danger"><i class="fa fa-user"></i><strong style="font-family:Tahoma">Welcome, <%=Member.Name %></strong></div>--%>
                <div class="panel-body">
                    <div  class="alert alert-info fade in">
                        <h3 style="font-weight:bold; color:#ec008d; text-align:center;"><i class="glyphicon glyphicon-user"></i> &nbsp Member Information</h3>
                    </div>
                    <table class="table table-responsive table-striped table-advance table-hover">
                        
                        <tr>
                            <td>Member Number:</td>
                            <td id="memberNo" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Name: </td>
                            <td id="memberName" runat="server"></td>
                        </tr>
                      
                        <tr>
                            <td>Account Category: </td>
                            <td id="accountCategory" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Email Address: </td>
                            <td id="emailAddress" runat="server"></td>
                        </tr>                       
                     
                    </table>
        
                    
                </div>
            </div>
        </div>
         <div class="col-md-6">

            <div class="panel panel-default">
            
                <div class="panel-body">
                    <div id="Div2" class="alert alert-info fade in">
                    <h3 style="font-weight:bold; color:#ec008d; text-align:center;"> <i class="fa fa-list"></i>&nbsp Loans</h3>
                </div>
                    <asp:GridView ID="ViewmyLoansList" runat="server"  CssClass="table table-striped table-advance table-hover" GridLines="None" EmptyDataText="No Loans Found!">
                        <Columns>
                            <asp:BoundField dataField="Loan_No" HeaderText="Loan Number" />
                            <asp:BoundField DataField="Loan_Product_Type" HeaderText="Loan Type" />
                            <asp:BoundField DataField="Requested_Amount" HeaderText="Requested Amount" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Approved_Amount" HeaderText="Approved Amount"  DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Loan_Status" HeaderText="Loan Status" />
                            <asp:BoundField DataField="Outstanding_Balance" HeaderText="Outstanding Balance"  DataFormatString="{0:N2}" />
                            <%--<asp:BoundField DataField="Repayment_Method" HeaderText="Repayment Method" />--%>
                            <%--<asp:BoundField DataField="Action" HeaderText="Action" />--%>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        
   
    </div>
    <div class="row">                       
    </div>

</asp:Content>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SACCOPortal.profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
        <!-- Tabs -->
        <div class="row tabs">
            <div class="col-sm-3">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="#profile_data" data-toggle="tab">
                            <i class="fa fa-home"></i>My profile</a>
                    </li>
                   <%-- <li>
                        <a href="#my_accounts" data-toggle="tab">
                            <i class="fa fa-file-text"></i>My Accounts</a>
                    </li>--%>
                    <li>
                        <a href="#kins_data" data-toggle="tab">
                            <i class="fa fa-group"></i>Next of Kin</a>
                    </li>
                   <%-- <li>
                        <a href="#sample-3d" data-toggle="tab">
                            <i class="fa fa-gear"></i>Edit Profile</a>
                    </li>--%>
                </ul>
            </div>
            <div class="col-sm-9">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="profile_data">
                        <div  class="alert alert-info fade in">
                            <h4  style="font-weight:bold; color:#ec008d; text-align:center;">My profile</h4>
                        </div>
                        <div class="row">

                            <div class="col-md-3">
                                <img src="image/<%=Session["username"].ToString()%>.jpg" class="img img-responsive img-circle profile_pic" alt="Member image" />                                
                            </div>
                            <div class="col-md-9">
                               <table class="table table-striped table-advance table-hover">                                    
                                    <tr>
                                        <th colspan="2" style="font-size: large" ><i class="fa fa-user"></i> Member Information</th>
                                    </tr>

                                    <tr>
                                        <td>Member Number:</td>
                                        <td><%=Session["username"].ToString() %></td>
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
                                <table class="table table-striped table-advance table-hover">
                                    <tr>                            
                                        <th colspan="2" style="font-size: large"><i class="fa fa-user"></i> Member Statistics</th>
                                    </tr>
                                    <tr>
                                        <td>Share Capital:</td>
                                        <td id="totaldeposits" runat="server"></td>
                                    </tr>
                                   <tr>
                                        <td>Normal Shares:</td>
                                        <td id="currentsaving" runat="server"></td>
                                    </tr>                         
                                
                                    <tr>
                                        <td>Loans Outstanding Interest: </td>
                                        <td id="toutstandinginterest" runat="server"></td>
                                    </tr>
                                   
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade in" id="my_accounts">
                        <asp:GridView ID="GridSavingsAccounts" runat="server" CssClass="table table-responsive table-striped table-advance table-hover" GridLines="None" >
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name"/>
                                <asp:BoundField DataField="No" HeaderText="No" />
                                <asp:BoundField DataField="Account_Type" HeaderText="Account Type"/>
                                <asp:BoundField DataField="Balance" HeaderText="Balance"/>
                                <asp:BoundField DataField="Status" HeaderText="Status"/>
                
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="tab-pane fade in" id="kins_data">
                        <div  class="alert alert-info fade in">
                            <h4  style="font-weight:bold; color:darkgreen; text-align:center;">Kins Information</h4>
                        </div>
                        <div class="row">
                            <div id="Div1" class="panel-body" runat="server" >
                                <div id="Div2"  runat="server"> <i class="fa fa-group"> <strong style="font-size:large;font-family:Tahoma"> Beneficiaries </strong></i></div>
                                     <asp:GridView ID="gvKins" runat="server" CssClass="table table-striped table-advance table-hover"  EmptyDataText="No beneficiaries found!"  Caption="Beneficiaries" Width="100%" GridLines="None" >
                                         <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" />
                                            <asp:BoundField DataField="Telephone" HeaderText="Telephone	" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                            <asp:BoundField DataField="Relationship" HeaderText="Relationship" />
                                        </Columns>
                                      </asp:GridView>
                            </div>

        
                             <div id="Div3" class="panel-body" runat="server" >
                             <div id="Div4"  runat="server"> <i class="fa fa-group" ><strong style="font-size:large;font-family:Tahoma"> Next of Kin</strong> </i></div>
                             <asp:GridView ID="GvBeneficiary" runat="server" CssClass="table table-striped table-advance table-hover" EmptyDataText="No kin's info found!" Caption="My Next of Kin" GridLines="None" border-bottom ="1px">
                                <Columns>
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" />
                                    <asp:BoundField DataField="Telephone" HeaderText="Telephone	" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="Allocation" HeaderText="Allocation" />
                                </Columns>
                            </asp:GridView>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <!-- Tab -->
    </asp:Content>

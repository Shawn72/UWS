<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtmApp.aspx.cs" Inherits="SACCOPortal.AtmApp"  MasterPageFile="~/Site.Master"%>
<asp:Content ID="AtmContent" ContentPlaceHolderID="MainContent" runat="server">
<div  class="alert alert-info fade in">
                <h4  style="font-weight:bold; color:darkgreen; text-align:center;">Apply ATM / Block ATM</h4>
            </div>
        <!-- Tabs -->
        <div class="row tabs">
            <div class="col-sm-3">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="#profile_data" data-toggle="tab">
                            <i class="fa fa-home"></i>New Application</a>
                    </li>
                    <li>
                        <a href="#my_accounts" data-toggle="tab">
                            <i class="fa fa-file-text"></i>Block ATM</a>
                    </li>
                    <li>
                        <a href="#kins_data" data-toggle="tab">
                            <i class="fa fa-group"></i>Card Renewal</a>
                    </li>
                    <%--<li>
                        <a href="#sample-3d" data-toggle="tab">
                            <i class="fa fa-gear"></i>Edit Profile</a>
                    </li>--%>
                </ul>
            </div>
            <div class="col-sm-9">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="profile_data">
                        <div class="row">
                            <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac adipiscing nunc.
                            Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, consectetur id.</p>
                            <ul>
                                <li>Donec eget orci metus</li>
                                <li>Ante ac interdum ullamcorper</li>
                                <li>Vivamus imperdiet condimentum</li>
                                <li>Pellentesque fermentum</li>
                            </ul>                            
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
                        <div class="row">
                            <div id="Div1" class="panel-body" runat="server" >
                                <div id="Div2"  runat="server"> <i class="glyphicon glyphicon-signal"> <strong style="font-size:large;font-family:Tahoma">Kins </strong></i></div>
                                     <asp:GridView ID="gvKins" runat="server" CssClass="table table-striped table-advance table-hover"  EmptyDataText="No kin's info found!"  Caption="Next of Kins" Width="100%" GridLines="None" >
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
                             <div id="Div4"  runat="server"> <i class="glyphicon glyphicon-signal" ><strong style="font-size:large;font-family:Tahoma"> Nominees</strong> </i></div>
                             <asp:GridView ID="GvBeneficiary" runat="server" CssClass="table table-striped table-advance table-hover" EmptyDataText="No Nominee's info found!" Caption="My Nominees" GridLines="None" border-bottom ="1px">
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
                    <div class="tab-pane fade in" id="sample-3d">
                        <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac adipiscing nunc.
                            Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, consectetur id.</p>
                        <ul>
                            <li>Donec eget orci metus</li>
                            <li>Ante ac interdum ullamcorper</li>
                            <li>Vivamus imperdiet condimentum</li>
                            <li>Pellentesque fermentum</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tab -->
    </asp:Content>
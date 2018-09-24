<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandingOrders.aspx.cs" Inherits="SACCOPortal.StandingOrders" MasterPageFile="~/Site.Master" %>

<asp:Content ID="StandingOrdersContent" ContentPlaceHolderID="MainContent" runat="server">
     <div id="lblFOSAfundsTransfer" class="alert tab-bg-info fade in">
        <h3  style="font-weight:bold; color:#fff; text-align:center;">View and Update Standing Orders</h3>
    </div>
     <!--tab nav start-->
    <section class="panel">
        <header class="panel-heading tab-bg-info">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a data-toggle="tab" href="#newStos">New Standing Order</a>
                </li>
                <li >
                    <a data-toggle="tab" href="#currentStos">Current Standing Orders</a>
                </li>
                
                <%--<li class="">
                    <a data-toggle="tab" href="#profile">Profile</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#contact">Contact</a>
                </li>--%>
            </ul>
        </header>
        <div class="panel-body">
            <div class="tab-content">
                <div id="currentStos" class="tab-pane">
                  <%-- <table class="table table-striped table-advance table-hover">
                        <tbody>
                            <tr>
                                <th><i class="icon_profile"></i> Application Date</th>
                                <th><i class="icon_calendar"></i> Type</th>
                                <th><i class="icon_mail_alt"></i> Effective Date</th>
                                <th><i class="icon_pin_alt"></i> Next Run Date</th>
                                <th><i class="icon_mobile"></i> Frequecy</th>
                                <th><i class="icon_mobile"></i> Amount</th>
                                <th><i class="icon_mobile"></i> Status</th>
                                <th><i class="icon_cogs"></i> Action</th>
                            </tr>
                            <tr>
                                <td>2017-07-06</td>
                                <td>some data here</td>
                                <td>2017-09-10</td>
                                <td>2017-12-13</td>
                                <td>2</td>
                                <td>3000</td>
                                <td>Active</td>
                                <td>
                                <div class="btn-group">
                                    <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                    <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                    <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>2017-09-06</td>
                                <td>some data here</td>
                                <td>2017-09-10</td>
                                <td>2017-12-13</td>
                                <td>2</td>
                                <td>3000</td>
                                <td>Active</td>
                                <td>
                                <div class="btn-group">
                                    <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                    <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                    <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                </div>
                                </td>
                            </tr>
                                                          
                        </tbody>
                    </table>--%>
                   
                            <asp:GridView ID="grdViewStandingOrders" runat="server" CssClass="table table-striped table-advance table-hover" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="No" HeaderText="STO No." />
                                    <%--<asp:BoundField DataField="Source_Account_No" HeaderText="Source Account No." />--%>
                                    <asp:BoundField DataField="Account_Name" HeaderText="Source Account Name" />
                                    <%--<asp:BoundField DataField="Destination_Account_Type" HeaderText="Destination Acc. Type" />
                                    <asp:BoundField DataField="Destination_Account_No" HeaderText="Destination Acc No." /> --%>
                                    <asp:BoundField DataField="Destination_Account_Name" HeaderText="Destination Acc Name." />
                                    <asp:BoundField DataField="Effective_Start_Date" HeaderText="Effective Start Date" />
                                    <asp:BoundField DataField="End_Date" HeaderText="End Date" />
                                    <%--<asp:BoundField DataField="Duration" HeaderText="Duration" />--%>
                                    <asp:BoundField DataField="Frequency" HeaderText="Frequecy" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                    <%--<asp:TemplateField HeaderText="Modify">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="STOChange" OnClick="STOChange_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField Text="Modify" CommandName="Select" ControlStyle-CssClass="btn  btn-info" />--%>
                                </Columns>
                            </asp:GridView> 
                </div>
                <div id="newStos" class="tab-pane active">
                    <h3>Apply for an STO</h3>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label label">Account No.</label>                           
                                <asp:DropDownList ID="drplstSrcAccNo" runat="server" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="true"
                                    OnSelectedIndexChanged="drplstSrcAccNo_SelectedIndexChanged">
                                    <asp:ListItem>--Select source account--</asp:ListItem>
                                </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="drplstSrcAccNo" ErrorMessage="Source Account must be selected"></asp:RequiredFieldValidator>
                        </div>
                    
                    <div class="form-group">
                        <label class="control-label label">Frequency.</label>
                            <asp:DropDownList ID="ddlFrequency" runat="server" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">--Select Frequency--</asp:ListItem>
                                <asp:ListItem Value="1D">Daily</asp:ListItem>
                                <asp:ListItem Value="1W">Weekly</asp:ListItem>
                                <asp:ListItem Value="1M">Monthly</asp:ListItem>
                                   
                            </asp:DropDownList> 
                        
                    </div>
                    <div class="form-group">
                    <label class="control-label label" for="tags">Duration</label>
                         <asp:DropDownList ID="ddlDuration" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlDuration_SelectedIndexChanged">
                            <asp:ListItem Value="">--Select Duration--</asp:ListItem>
                            <asp:ListItem Value="30D">1 Month</asp:ListItem>
                            <asp:ListItem Value="3M">3 Months</asp:ListItem>
                            <asp:ListItem Value="6M">6 Months</asp:ListItem>
                            <asp:ListItem Value="1Y">1 Year</asp:ListItem> 
                        </asp:DropDownList> 
                    
                    </div>
                    
                    <div class="form-group" id="ddlDestAcc">
                        <label class="control-label label">Destination Acc Type</label>
                                                       
                             <asp:DropDownList ID="ddlDestAccType" runat="server" AutoPostBack="true" CssClass="form-control" 
                                 OnSelectedIndexChanged="ddlDestAccType_SelectedIndexChanged">
                                    <asp:ListItem >--Select Acc Type--</asp:ListItem>
                                    <asp:ListItem Text="Internal" Value="Internal" ></asp:ListItem>
                                    <asp:ListItem Text="External" Value="External" ></asp:ListItem>
                                    <asp:ListItem Text="BOSA" Value="BOSA" ></asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    
                        
                    <div class="form-group">
                        <label class="control-label label">Destination Account Name.</label>
                                                   
                            <asp:DropDownList ID="ddlDestAccName" runat="server" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem >-Select Acc Name-</asp:ListItem>
                            </asp:DropDownList>  
                            <asp:TextBox ID="txtBxDestAcc" runat="server" CssClass="form-control" placeholder="Enter the account number" Visible="false"></asp:TextBox> 
                       
                    </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                        <label class="control-label label" for="tags">Amount</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter Amount" ></asp:TextBox>
                        </div>
                        <br>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label" for="tags">Start Date</label>
                                </div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtSotStartDate" runat="server" CssClass="form-control" placeholder="MM-DD-YYYY"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnCalendar" runat="server" Text="Select Date" OnClick="btnCalendar_Click"/>
                                    <asp:Calendar ID="cal1" runat="server" CssClass="form-control" Visible="false" OnSelectionChanged="cal1_SelectionChanged" OnDayRender="cal1_DayRender"></asp:Calendar>
                                </div>
                            </div>
                            
  
                        </div>
                      
                        <%--<div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label" for="tags">End Date</label>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="TxtEndDate" runat="server" CssClass="form-control" placeholder="MM-DD-YYYY"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="EndDateBtn" runat="server" Text="Set Date" OnClick="EndDateBtn_Click"/>
                                <asp:Calendar ID="CalEndDate" runat="server" CssClass="form-control" visible="false" OnSelectionChanged="CalEndDate_SelectionChanged"></asp:Calendar>
                            </div>
  
                        </div>--%>

                    </div>
                    <asp:Button ID="stadingOrderbtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="stadingOrderbtn_Click" />
                </div>
                <%--<div id="profile" class="tab-pane">Profile</div>
                <div id="contact" class="tab-pane">Contact</div>--%>
            </div>
        </div>
    </section>
    <!--tab nav start-->
    <!-- ......Standing orders edit modal.....................-->
    <%--<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Inter FOSA account funds transfer</h4>
                        </div>
                        <div class="modal-body">

                        <!-- Account from -->
                        <div class="form-group">
                        <label class="control-label col-lg-2">From:</label>
                        <div class="col-lg-10">                               
                            <asp:DropDownList ID="FOSAAccFrm" runat="server" Cssclass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Value="" Text="...select source account...."></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>
                         <p>&nbsp</p>   
                                <!-- Accont to -->
                        <div class="form-group">
                        <label class="control-label col-lg-2">To: </label>
                        <div class="col-lg-10">                               
                            <asp:DropDownList ID="DropDownListFOSAAccTo" runat="server" AppendDataBoundItems="true" Cssclass="form-control">
                                <asp:ListItem Value="" Text="...select destination account...."></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </div>  
                            <p>&nbsp</p>          
                        <!-- Amount -->
                        <div class="form-group">
                        <label class="control-label col-lg-2" for="tags">Amount</label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="TextBoxFosaAmnt" CssClass="form-control" runat="server" ></asp:TextBox>
                        </div>
                        </div>                  
                               <asp:Button ID="BtnFOSA1Transfer" runat="server" CssClass="btn btn-primary" OnClick="BtnFOSATransfer_Click" Text="Transfer" />             
                        </div>
                    </div>
                </div>
            </div>--%>
    </asp:Content>

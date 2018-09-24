<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dividends.aspx.cs" Inherits="SACCOPortal.Dividends" MasterPageFile="~/Site.Master" %>

<asp:Content ID="dividendsContent" ContentPlaceHolderID="MainContent" runat="server">    
        <div id="lblFOSAfundsTransfer" class="alert tab-bg-info fade in">
        <h3  style="font-weight:bold; color:#fff; text-align:center;">Dividends Allocation</h3>
    </div>
     <!--tab nav start-->
    <section class="panel">
        <header class="panel-heading tab-bg-info">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a data-toggle="tab" href="#home">Application</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#about">Summary</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#profile">Progression</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#contact">Requests History</a>
                </li>
            </ul>
        </header>
        <div class="panel-body">
            <div class="tab-content">
                <div id="home" class="tab-pane active">
                   <table class="table table-striped table-advance table-hover">
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
                    </table>
                </div>
                <div id="about" class="tab-pane">
                    <h3>Apply for an STO</h3>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label label">Account No.</label>                           
                                <select class="form-control">
                                    <option value="">- Select Account -</option>
                                    <option value="1">General</option>
                                    <option value="2">News</option>
                                    <option value="3">Media</option>
                                    <option value="4">Funny</option>
                                </select>  
                        </div>
                    
                    <div class="form-group">
                        <label class="control-label label">Frequency.</label>
                                                       
                            <select class="form-control">
                                <option value="">- Select Account -</option>
                                <option value="1">Weekly</option>
                                <option value="2">Monthly</option>
                                <option value="3">Yearly</option>
                            </select>  
                        
                    </div>
                    <div class="form-group">
                    <label class="control-label label" for="tags">Duration</label>
                    
                        <input type="text" class="form-control" id="Text1">
                    
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label label">Type</label>
                                                       
                            <select class="form-control">
                                <option value="">- Select Account -</option>
                                <option value="1">Savings</option>
                                <option value="2">Credit</option>
                                
                            </select>  
               
                    </div>
                    <div class="form-group">
                        <label class="control-label label">Account.</label>
                                                   
                            <select class="form-control">
                                <option value="">- Select Account -</option>
                                <option value="1">General</option>
                                <option value="2">News</option>
                                <option value="3">Media</option>
                                <option value="4">Funny</option>
                            </select>  
                       
                    </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                        <label class="control-label label" for="tags">Amount</label>
                       
                            <input type="text" class="form-control" id="tags">
                        
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="control-label label">Income Type.</label>
                                                           
                                <select class="form-control">
                                    <option value="">- Select Type-</option>
                                    <option value="1">Periodic</option>
                                    <option value="2">Salary</option>
                                    <option value="3">Milk</option>
                                    <option value="4">Coffee</option>
                                </select>  
                            
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="tags">Start Date</label>
                          
                                <input type="text" class="form-control" id="Text2">
                           
                        </div>

                    </div>
                    <asp:Button ID="stadingOrderbtn" runat="server" Text="Submit" CssClass="btn btn-primary" />
                </div>
                <div id="profile" class="tab-pane">Progrssion here</div>
                <div id="contact" class="tab-pane">Requests History</div>
            </div>
        </div>
    </section>
    <!--tab nav start-->
</asp:Content>

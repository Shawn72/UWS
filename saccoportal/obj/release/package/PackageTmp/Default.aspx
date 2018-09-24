<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Defaults.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SACCOPortal._Default" %>
<%--<%@ Register Assembly="GoogleReCaptcha" Namespace="GoogleReCaptcha" TagPrefix="cc1" %>--%>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <div class="container-fluid">
 <div class="row row-eq-height">					                    
            
<div class="col-md-4">
                            						
    <div class="block block-banner">
        <div class="banner-slider-container cycle-slideshow" data-cycle-slides="> .banner-slide">

            <!-- empty element for slider pager links -->
            <div class="cycle-pager"></div>
                <div class="banner-slide">
                    <img src="HomepageImages/slide1.jpg">
                    <div class="block-overlay">
                        <div class="block-overlay-container">
                            <div class="block-overlay-content">
                                <br /><br />
                                <p><span class="em">CloudPESA Online Banking</span></p>
                                <p>You can now apply loans and withdraw cash from our new Online Banking</p>   
                                <a href="http://www.cloudpesaea.com/" class="btn link-btn blue">Learn More...</a>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="banner-slide">
                    <img src="HomepageImages/slide3.jpg">
                    <div class="block-overlay">
                        <div class="block-overlay-container">
                            <div class="block-overlay-content">
                            <br /><br />
                            <p><span class="em">Access your SACCO Account by dialing *850# today</span></p>
                            <p>Joing us by registering for mobile. Visit your Sacco today!!!</p>                                    
                            <a href="http://www.cloudpesaea.com/" class="btn link-btn blue">Learn More...</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="banner-slide">
                    <img src="HomepageImages/slide2.jpg">
                    <div class="block-overlay">
                        <div class="block-overlay-container">
                            <div class="block-overlay-content">
                                <br /><br />
                                <p><span class="em">Mobile Banking</span></p>
                                <p>Download sacco mobile banking application today from playstore and start enjoying our mobile banking services.</p>                                                                                   
                                <a href="http://www.cloudpesaea.com/" class="btn link-btn blue">Learn More...</a>
                            </div>
                        </div>
                    </div>
                </div>
             
            </div>
    </div>
	
                            
    <div class="section mobile-app-download text-center visible-xs visible-sm">
        <p class="title">Download the Surestep Sacco App now</p>
        <p>For easy checking of ministatement, E-loan applications, inter account transfer and other functionalities</p>
        <a href="http://www.cloudpesaea.com/" target="_blank" rel="noopener"></a>
    </div>
</div>
<div class="col-md-3">
    <div class="home-form-container">

	<div class="section">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <img class="img img-rounded login-img" src="/siteimages/unitedwomenlogo.png" />  
            </div>
            <div class="col-md-3"></div>
        </div>
		<div class="mobile-form-toggle">
			<br>
    				<div class="field-error" id="Div1">
                        <div class="row">
                        <div class="col-md-12"> 
                                <asp:Label ID="lblError" runat="server" ForeColor="white" CssClass="text-left hidden"></asp:Label>  
                                <span class="text-center text-danger"><small><%=lblError.Text %></small></span>                                                        
                            <h2 class="text-center text-primary" style="font-weight:bold;">User Login </h2>                                
                        </div>
                                          
                    </div>
    				</div>

					</div>
                     
	    <asp:MultiView ID="MultiView1" runat="server">
	        <asp:View ID="View1" runat="server">
	            <div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-user"></i> Member  No:</span>
	                <asp:TextBox ID="txtStaffNo" runat="server" CssClass="form-control" placeholder="Enter Member Number"></asp:TextBox>
	            </div><br/>
	            <div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-key"></i> Password:</span>
	                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
	            </div>
                <br/>
	            <div class="input-group">
	                <label style="color: #f0f8ff"> First Login? Click the link below</label>
	            </div>
                <br/>
                <div class="input-group">
                     <span class="pull-left"><asp:LinkButton ID="lnkbtnForgot" runat="server" OnClick="btnPassword_Click" CausesValidation="False">Reset Password?</asp:LinkButton> </span>
                </div>
                <br/>
                 <div style="transform:scale(1.0); -webkit-transform:scale(1.0);transform-origin:0 0;-webkit-transform-origin:0 0;">
                    <cc1:CaptchaControl ID="cptCaptcha" runat="server" 
                        CaptchaBackgroundNoise="Low" CaptchaLength="5" 
                        CaptchaHeight="60" CaptchaWidth="250" 
                        CaptchaLineNoise="None" CaptchaMinTimeout="5" 
                        CaptchaMaxTimeout="240" FontColor = "#529E00" />
                    </div>
                    <br/>
                    <div class="input-group">
                         <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" style="transform:scale(1.0); -webkit-transform:scale(1.0);transform-origin:0 0;-webkit-transform-origin:0 0; width: 250px;" placeholder="Enter the above Text"></asp:TextBox>
                          <br/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required!" ControlToValidate = "txtCaptcha" ForeColor="yellow"></asp:RequiredFieldValidator>
                    </div>
	        </asp:View>
	        <asp:View ID="View2" runat="server">
	            <div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-user"></i> Member  No:</span>
	                <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control" placeholder="Enter Member Number"  ></asp:TextBox>
	            </div><br/>
	            <div class="input-group">
	                <span class="input-group-addon"><i class="fa fa-id-card"></i> National ID:</span>
	                <asp:TextBox ID="idNo" runat="server" CssClass="form-control" placeholder="Enter ID Number" ></asp:TextBox>
	            </div>
	        </asp:View>
	    </asp:MultiView>
           
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnLogin_Click"/>&nbsp;&nbsp;
                <asp:Button ID="btnSubmit" runat="server" Text="Send" CssClass="btn btn-success btn-lg btn-block" OnClick="btnSubmit_Click"/>&nbsp;
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
               <%-- <asp:Button ID="btnSignup" runat="server" Text="Signup" CssClass="btn btn-info btn-lg btn-block" />--%>
                <asp:Button ID="btnBack" runat="server" Text="&lt;&lt; Back" CssClass="btn btn-warning btn-lg btn-block" OnClick="btnBack_Click"/>
            </div>
        </div>

	</div>

</div>

</div>
<div class="col-md-5">
    <div class="row">
        <div class="row col-md-4 col-lg-4"> <div class=" panel panel-default">
        <div class="panel-heading"><strong style="color:#1679D3;">Our Loan Products</strong></div>
        <div class="panel-body">
        
            <label>Choose Loan </label>
        <asp:DropDownList runat="server" CssClass="form-control" ID="loanProduct" OnSelectedIndexChanged="loanProduct_SelectedIndexChanged" AutoPostBack="True"/>
            
        
                <label class="hidden">Installments</label>
        <asp:DropDownList runat="server" CssClass="form-control hidden" ID="installments" />
            
        
              <label class="hidden">  Loan Amount</label>
        <asp:TextBox runat="server" type="number" CssClass="form-control hidden"  ID ="loanAmount" value="10000"/>
        
            
            <div class="lead pull-right"><asp:Button ID="Button1" runat="server" CssClass="btn btn-primary pull-right hidden" href="#mymodal" Text="View Details" name="calculate" OnClick="Unnamed2_Click"/></div>
               </div>   
            </div></div>
      <div class="row col-md-8 col-lg-8 loan-details" style="margin-left:3%;">
          <div class="panel panel-default">
             
                     <div class="panel-heading"><strong style="color:#1679D3;">LOAN DETAILS</strong></div>
                 <div class="panel-body">
                     <table class='table table-responsive table-striped table-bordered table-condensed' style="font-family:Tahoma">
                     <div id="details" runat="server">  </div>
                         </table>
                 </div>
             
             </div>
      </div>
    </div>
       
    
</div>
                                                       
</div>

</div>
  
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="mymodal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Loan Payment Schedule</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div id="calculations" runat="server">
                     
                                </div>
                   
                            </div>
                                                  
                                <%--<asp:Button ID="btnBOSATransfer" CssClass="btn btn-primary" runat="server" Text="Transfer" OnClick="btnBOSATransfer_click" />--%>
                                             
                        </div>
                    </div>
                </div>
            </div>        
</asp:Content>

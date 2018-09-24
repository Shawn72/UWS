<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewLoanApplication.aspx.cs" Inherits="SACCOPortal.NewLoanApplication" MasterPageFile="~/Site.Master" %>
<asp:Content ID="newLoanApplocation" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
                    <div class="panel-heading"><h4 class="modal-title">New Loan Application</h4></div>
                    <div class="panel-content">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-horizontal">

                                    <!-- Select loan type -->
                                    <div class="form-group">
                                    <label class="control-label col-lg-2">Loan Type:</label>
                                    <div class="col-lg-10">                               
                                        <asp:DropDownList ID="ddlLoanType" runat="server" Cssclass="form-control" AppendDataBoundItems="true" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLoanType_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="...select loan type...."></asp:ListItem>
                                            <asp:ListItem Value="FOSA" Text="FOSA Loan"></asp:ListItem>
                                            <asp:ListItem Value="BOSA" Text="BOSA Loan"></asp:ListItem>
                                            <asp:ListItem Value="MICRO" Text="Microfinance Loan"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="control-label col-lg-2">Loan Product:</label>
                                    <div class="col-lg-10">                               
                                        <asp:DropDownList ID="ddlLoanProduct" runat="server" Cssclass="form-control" AppendDataBoundItems="true" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLoanProduct_SelectedIndexChanged" >
                                            <asp:ListItem Value="" Text="...select loan type...."></asp:ListItem>  
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <asp:Label ID="Label5" runat="server"  CssClass="col-md-3 control-label">Max Loan Amount:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="TxtBxMaxLoanAmnt" CssClass="form-control"  disabled="true"/>              
                                    </div> 
                                    </div> 
                                    <div class="form-group">
                                    <asp:Label ID="lblLoanAmnt" runat="server"  CssClass="col-md-3 control-label" onkeypress="return allowOnlyNumber(event);">Loan Amount:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="txtBxLnAmnt" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" required="true"/>
                                        <asp:RequiredFieldValidator ControlToValidate="txtBxLnAmnt" runat="server" ErrorMessage="Loan amount cant be left empty" CssClass="alert-danger" ></asp:RequiredFieldValidator>              
                                    </div> 
                                    </div> 
                                    <div class="form-group">
                                    <label class="control-label col-lg-2">Loan Purpose:</label>
                                    <div class="col-lg-10">                               
                                        <asp:DropDownList ID="ddlLoanPurpose" runat="server" Cssclass="form-control" AppendDataBoundItems="true" >
                                            <asp:ListItem Value="" Text="...select loan purpose...."></asp:ListItem> 
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="control-label col-lg-2">Mode of Disbursement:</label>
                                    <div class="col-lg-10">                               
                                        <asp:DropDownList ID="ddlModeOfDisbursement" runat="server" Cssclass="form-control" AppendDataBoundItems="true" >
                                            <asp:ListItem Value="" Text="...select mode...."></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Cheque"></asp:ListItem> 
                                            <asp:ListItem Value="2" Text="Bank transfer"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="EFT"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="RTGS"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Cheque NonMember"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Transfer to FOSA"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Share Boosting"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Partial"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="To Vendor"></asp:ListItem>  
                                        </asp:DropDownList>
                                    </div>
                                    </div>  
                                    <div class="form-group">
                                    <asp:Label ID="Label9" runat="server"  CssClass="col-md-3 control-label">Repayment Period:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="txtBxRepaymentPeriod" CssClass="form-control" required="True" disabled="true" />   
                                        <%--<asp:RequiredFieldValidator  runat="server" ControlToValidate="txtBxRepaymentPeriod"
                                            CssClass="text-danger" ErrorMessage="Repayment period field is required!"></asp:RequiredFieldValidator> --%>          
                                    </div> 
                                    </div>
                                    <div class="form-group">
                                    <label class="control-label col-lg-2">Repayment Frequency:</label>
                                    <div class="col-lg-10">                               
                                        <asp:DropDownList ID="ddlRepymntFreq" runat="server" Cssclass="form-control" AppendDataBoundItems="true" >
                                            <asp:ListItem Value="" Text="...select repayment frequency...."></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Daily"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Weekly"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Monthly"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Quaterly"></asp:ListItem> 
                                        </asp:DropDownList>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                    <asp:Label ID="Label10" runat="server"  CssClass="col-md-3 control-label">Repayment Method:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="TxtBxRepaymntMthd" CssClass="form-control" required="True" disabled="true" />   
                                        <%--<asp:RequiredFieldValidator  runat="server" ControlToValidate="txtBxRepaymentPeriod"
                                            CssClass="text-danger" ErrorMessage="Repayment period field is required!"></asp:RequiredFieldValidator> --%>          
                                    </div> 
                                    </div>
                                    
                                    

                                    </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server"  CssClass="col-md-3 control-label">Basic Salary:</asp:Label>
                                        <div class="col-md-6">
                                            <%--<asp:TextBox runat="server" ID="TxtBxBasicSalo" CssClass="form-control" AutoPostBack="true"
                                                OnTextChanged="TxtBxBasicSalo_TextChanged"  /> --%> 
                                            <asp:TextBox ID="TxtBxBasicSalo" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnTextChanged="TxtBxBasicSalo_TextChanged" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="VGrpSave"
                                             SetFocusOnError="false" Display="None" ErrorMessage="Only numeric values are allowed" ControlToValidate="TxtBxBasicSalo"
                                             ValidationExpression="\d*"></%--asp:RegularExpressionValidator> --%> 
                                            <asp:RequiredFieldValidator ControlToValidate="TxtBxBasicSalo" runat="server" ErrorMessage="Basic salary field required" CssClass="alert-danger"></asp:RequiredFieldValidator>          
                                        </div> 
                                        
                                    </div>
                                    
                                    <div class="form-group">
                                    <asp:Label ID="LblMonthlyRepayment" runat="server"  CssClass="col-md-3 control-label">Monthly Repayment:</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="TxtBoxMonthlyRepayment" CssClass="form-control" required="True" disabled="true"/>   
                                        <%--<asp:RequiredFieldValidator  runat="server" ControlToValidate="txtBxRepaymentPeriod"
                                            CssClass="text-danger" ErrorMessage="Repayment period field is required!"></asp:RequiredFieldValidator> --%>          
                                    </div> 
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server"  CssClass="col-md-3 control-label">House Allowance:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxHouseAllowance" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" />   
                                             <asp:RequiredFieldValidator  runat="server" ControlToValidate="TxtBxHouseAllowance"
                                            CssClass="text-danger" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>          
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="LblHouseAllowance" runat="server"  CssClass="col-md-3 control-label">Community/Bus Fare Allowances:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxBusFareAllowance" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" /> 
                                            <asp:RequiredFieldValidator  runat="server" ControlToValidate="TxtBxBusFareAllowance"
                                            CssClass="text-danger" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>             
                                        </div> 
                                    </div>
                                    <%--<div class="form-group">
                                        <asp:Label ID="Label6" runat="server"  CssClass="col-md-3 control-label">Responsibility Allowance:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxResponsibilityAllowances" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" />              
                                        </div> 
                                    </div>--%>
                                    <div class="form-group">
                                        <asp:Label ID="Label7" runat="server"  CssClass="col-md-3 control-label"> Other Allowances/Income:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxOtherAllowances" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" required="true" />              
                                             <asp:RequiredFieldValidator  runat="server" ControlToValidate="TxtBxOtherAllowances"
                                            CssClass="text-danger" ErrorMessage="Allowances field is required!"></asp:RequiredFieldValidator> 
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server"  CssClass="col-md-3 control-label">Gross Pay:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxGrossPay" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" required="true" />              
                                             <asp:RequiredFieldValidator  runat="server" ControlToValidate="TxtBxGrossPay"
                                            CssClass="text-danger" ErrorMessage="Gross pay field is required!"></asp:RequiredFieldValidator> 
                                             </div> 
                                    </div>
                                    
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server"  CssClass="col-md-3 control-label">Deductions +PAYE:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxDeductions" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" />              
                                         <asp:RequiredFieldValidator  runat="server" ControlToValidate="TxtBxDeductions"
                                            CssClass="text-danger" ErrorMessage="Deductions field is required!"></asp:RequiredFieldValidator> 
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server"  CssClass="col-md-3 control-label">Net Salary:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="txtBoxNetSalo" CssClass="form-control" onkeypress="return allowOnlyNumber(event);" required="true"/>              
                                            <asp:RequiredFieldValidator  runat="server" ControlToValidate="txtBoxNetSalo"
                                            CssClass="text-danger" ErrorMessage="Net salary field is required!"></asp:RequiredFieldValidator> 
                                             </div> 
                                    </div>
                                    <%--<div class="form-group">
                                        <asp:Label ID="Label5" runat="server"  CssClass="col-md-3 control-label">Available for repayment:</asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox runat="server" ID="TxtBxAvailableForRepaymnt" CssClass="form-control"  />              
                                        </div> 
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="SupportingDocument">File input</label>
                                        <input type="file" id="SupportingDocument">
                                        <p class="help-block">Upload supporting documents e.g payslip, business income statement </p>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        
                        
                                         
                               <asp:Button ID="BtnLoanApplication" runat="server" CssClass="btn btn-primary pull-right btn-lg"  Text="Apply"
                                   OnClick="BtnLoanApplication_Click" />             
                        </div>
                </div>
    <!-- Supporting documents upload-->
        <script>
            function allowOnlyNumber(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
        </script>
    
</asp:Content>


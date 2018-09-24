<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FosaStatement.aspx.cs" MasterPageFile="Site.Master" Inherits="SACCOPortal.FosaStatement" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">

        <div class="panel panel-default">
        <div class="panel-heading">Fosa Accounts:</div>
        <div class="panel-body">

                    <%--<p>Select Fosa Account <asp:DropDownList ID="ddFosaAccount" runat="server" CssClass="form-control"></asp:DropDownList></p>
                    <asp:Button ID="btnView" runat="server" Text="View Statement" CssClass="btn btn-warning" OnClick="btnView_Click" />--%>


         <asp:MultiView ID="FosaMultiview" runat="server">

         <asp:View ID="viewFosaStats" runat="server">
               <asp:GridView ID="tblFosaAccs" runat="server" CssClass="table table-condensed" Width="100%" AutoGenerateSelectButton="true" 
                 EmptyDataText="No Accounts Found!" OnSelectedIndexChanged="tblFosaAccs_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Fosa_acc_No" HeaderText="FOSA No:" />
                    <asp:BoundField DataField="Fosa_acc_name" HeaderText="Account Name:" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                           <asp:LinkButton runat="server" ID="lnkViewStats" OnClick="lnkViewStats_Click" >View
                           </asp:LinkButton>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#259EFF" BorderColor="#FF9966" /> 
                 </asp:GridView>
             </asp:View>

            <asp:View ID ="viewStatement" runat="server">
                <asp:Label ID="txtF" runat="server">Fosa Account:  </asp:Label><asp:Label ID="lblFosaAc" runat="server"></asp:Label>
                <table style="width:100%" class="table table-condensed table-bordered">
                <tr><td>Date From:
                        <asp:TextBox ID="txtSelStartDT" runat="server" placeholder="From which date?" CssClass="form-control" ReadOnly="true" required="True"></asp:TextBox>
                        <asp:Button ID="btnCal" runat="server" Text="Choose Start Date:" CssClass="btn btn-primary btn-sm" OnClick="btnCal_Click" />
                        <asp:Calendar ID="viewStartDate" runat="server"  Visible="false" OnDayRender="viewStartDate_DayRender" OnSelectionChanged="viewStartDate_SelectionChanged"></asp:Calendar>
                        </td>
                    <td>To:
                   
                        <asp:TextBox ID="txtSelEndDT" runat="server" placeholder="To which date?" CssClass="form-control" ReadOnly="true" required="True"></asp:TextBox>
                        <asp:Button ID="btnCal2" runat="server" Text="Choose End Date:" CssClass="btn btn-primary btn-sm" OnClick="btnCal2_Click"/>
                        <asp:Calendar ID="viewEndDate" runat="server"  Visible="false" OnDayRender="viewStartDate_DayRender" OnSelectionChanged="viewEndDate_SelectionChanged"></asp:Calendar>
                      </td>
                    <td><asp:Button ID="btnViewFState" runat="server" Text="View Statement" CssClass="btn btn-primary btn-sm" OnClick="btnViewFState_Click"/></td>
                </tr>

            </table>
                <div class="row">
                    <iframe runat="server" id="pdfReport" width="100%" height="500" ></iframe>
                </div>
        </asp:View>

             </asp:MultiView>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HolidaySavings.aspx.cs" MasterPageFile="Site.Master" Inherits="SACCOPortal.HolidaySavings" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p> 
  <div class="panel panel-default">
 <div class="panel-heading">Holiday Account Statements</div>
         <div class="panel-body"> <asp:MultiView ID="holdMultiview" runat="server">

         <asp:View ID="viewHoldStats" runat="server">
               <asp:GridView ID="tblFosaAccs" runat="server" CssClass="table table-condensed" Width="100%" AutoGenerateSelectButton="True" 
                 EmptyDataText="You do not have holiday savings!" OnSelectedIndexChanged="tblFosaAccs_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="AcNo" HeaderText="Account No:" />
                    <asp:BoundField DataField="AcName" HeaderText="Account Name:" />
                    <asp:BoundField DataField="AcHoliday_Savings" HeaderText="Account Balance:" DataFormatString="{0:N2}">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <SelectedRowStyle BackColor="#259EFF" BorderColor="#FF9966" /> 
                 </asp:GridView>
             </asp:View>

            <asp:View ID ="viewStatement" runat="server">
                <div class="row">
                    <iframe runat="server" id="pdfR" width="100%" height="500" ></iframe>
                </div>
           </asp:View>

             </asp:MultiView>
                </div>    
            </div>
 </asp:Content>
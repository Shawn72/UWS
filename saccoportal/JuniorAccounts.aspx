<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JuniorAccounts.aspx.cs" MasterPagefile="Site.Master" Inherits="SACCOPortal.Loans_FOSA" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p> 
  <div class="panel panel-default">
 <div class="panel-heading">Junior Accounts Lists</div>
         <div class="panel-body"> <asp:MultiView ID="FosaMultiview" runat="server">

         <asp:View ID="viewFosaStats" runat="server">
               <asp:GridView ID="tblFosaAccs" runat="server" CssClass="table table-condensed" Width="100%" AutoGenerateSelectButton="True" 
                 EmptyDataText="No Accounts Found!" OnSelectedIndexChanged="tblFosaAccs_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="junior_acc_No" HeaderText="Junior A/C No:" />
                    <asp:BoundField DataField="junior_acc_name" HeaderText="Junior Account Name:" />
                  <%--  <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                           <asp:LinkButton runat="server" ID="lnkViewStats" OnClick="lnkViewStats_Click" >View Statement
                           </asp:LinkButton>
                        </ItemTemplate>                        
                    </asp:TemplateField>--%>
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

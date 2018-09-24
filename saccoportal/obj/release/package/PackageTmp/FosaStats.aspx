<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FosaStats.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SACCOPortal.ListMyLoans" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%" class="table table-condensed table-bordered">
          <tr><td>Date From: </td>
                <td>
                    <asp:TextBox ID="txtSelStartDT" runat="server" placeholder="MM/DD/YYYY" CssClass="form-control" ReadOnly="true" required="True"></asp:TextBox>
                    <asp:Button ID="btnCal" runat="server" Text="Choose Start Date:" CssClass="btn btn-primary btn-sm" OnClick="btnCal_Click"/>
                    <asp:Calendar ID="viewStartDate" runat="server"  Visible="false" OnSelectionChanged="viewDate_SelectionChanged" OnDayRender="viewDate_DayRender"></asp:Calendar>
                </td>
                              
           </tr>

    </table>

    <asp:MultiView ID="FosaMultiview" runat="server">

         <asp:View ID="viewFosaStats" runat="server">
               <asp:GridView ID="tblFosaAccs" runat="server" CssClass="table table-condensed" Width="100%" AutoGenerateSelectButton="true" 
                 EmptyDataText="No Accounts Found!" OnSelectedIndexChanged="">
                <Columns>
                    <asp:BoundField DataField="Room_Code" HeaderText="Room No" />
                    <asp:BoundField DataField="Room_type" HeaderText="Type" />
                    <asp:BoundField DataField="DayBooked" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Day Booked" />
                    <asp:BoundField DataField="Days_booked" HeaderText="Days Booked" />
                    <asp:BoundField DataField="TimeIn" HeaderText="Time In" />
                    <asp:BoundField DataField="DayCleared" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Day to Clear" />
                    <asp:BoundField DataField="timeOut" HeaderText="Check out Time" />
                    <asp:BoundField DataField="Amount_paid" HeaderText="Paid" />
                    <asp:BoundField DataField="Room_Cost" DataFormatString="{0:F2}" HeaderText="Cost(KES)" />
                    <asp:BoundField DataField="Room_status" HeaderText="Satus" />
                    <asp:TemplateField HeaderText="Book">
                        <ItemTemplate>
                           <asp:LinkButton runat="server" ID="lnkViewLoan" OnClick="">View
                           </asp:LinkButton>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cancel">
                        <ItemTemplate>
                           <asp:LinkButton runat="server" ID="lnkBtnCancel" >Cancel
                           </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#259EFF" BorderColor="#FF9966" /> 
                 </asp:GridView>
              <%--   <asp:GridView ID="GridView1" runat="server" CssClass="table table-condensed" Width="100%" AutoGenerateSelectButton="true" 
                 EmptyDataText="No Rooms Found" >
                <Columns>
                    <asp:BoundField DataField="Room_Code" HeaderText="Room No.:" />
                    <asp:BoundField DataField="duration" HeaderText="time" />
                 </Columns>
                </asp:GridView>--%>
             </asp:View>
    </asp:MultiView>



</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassChange.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SACCOPortal.PassChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="panel-body" runat="server" >

  <h4>Please change your password here</h4>
   <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" CssClass="text-left hidden"></asp:Label>
       <span class="text-center text-danger"><small><%=lblError.Text %></small></span> 
   <table >
       <tr>
           <td>
           <asp:Label ID="oldpass" runat="server" Text="Enter current password:"></asp:Label>
           </td>
           <td>
           <asp:TextBox ID="txtolPass" runat="server"  CssClass="form-control" placeholder="Enter Old Password" TextMode="Password"></asp:TextBox>
           </td>
       </tr>
      <tr>
          <td>
           <asp:Label ID="neoOne" runat="server" Text="New password:"></asp:Label>
          </td>
          <td>
           <asp:TextBox ID="txtnewPass1" runat="server" CssClass="form-control" placeholder="Enter New Password" TextMode="Password"></asp:TextBox>
          </td>
      </tr> 
       <tr>
           <td>
        <asp:Label ID="neoTwo" runat="server" Text="Confirm password:" ></asp:Label>
           </td>
           <td>
        <asp:TextBox ID="txtnewPass2" runat="server" CssClass="form-control" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>
           </td>
       </tr>
        
        <tr>
            <td>

            </td>
            <td>
                <asp:Button ID="btnChange" runat="server" Text="Reset Password:" class="btn btn-warning btn-sm" OnClick="btnChange_Click"></asp:Button> 
                 <asp:Button ID="btnBack" runat="server" Text="Back" class="btn btn-primary" OnClick="btnBack_Click"></asp:Button>
            </td>
        </tr>            
     </table>     
       
       
       
   </div>
</asp:Content>

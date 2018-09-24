<%@ Page Language="C#" Title="kinsdata" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="kinsdata.aspx.cs" Inherits="SACCOPortal.kinsdata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel-body" runat="server" >
        <div  runat="server"> <i class="fa fa-group"> <strong style="font-size:large;font-family:Tahoma"> Nominees </strong></i></div>
             <asp:GridView ID="gvKins" runat="server" CssClass="table table-condensed table-responsive table-striped"  EmptyDataText="No kin's info found!" style="font-family:Tahoma;margin-top: 0px" Caption="Next of Kins" Width="100%" >
                 <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="Telephone" HeaderText="Telephone	" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Relationship" HeaderText="Relationship" />
                </Columns>
              </asp:GridView>
    </div>

        
     <div class="panel-body" runat="server" >
     <div  runat="server"> <i class="fa fa-group" ><strong style="font-size:large;font-family:Tahoma"> Kins</strong> </i></div>
     <asp:GridView ID="GvBeneficiary" runat="server" CssClass="table table-bordered table-condensed table-striped" style="font-family:Tahoma" EmptyDataText="No Nominee's info found!" Caption="My Nominees" Width="100%">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="Telephone" HeaderText="Telephone	" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Allocation" HeaderText="Allocation" />
        </Columns>
    </asp:GridView>
    </div> 
    </asp:Content>

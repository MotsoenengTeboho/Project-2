<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Image_album.Pages.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
    <link href="../Css/dashboard.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="divHead">
            &nbsp;<asp:Label ID="Label1" CssClass="lblHeader move" runat="server" Text="Image Album"></asp:Label>
        </div>
        <p>
            <asp:Label ID="lblWelcome" runat="server" Text="Label"></asp:Label>
        </p>
        
        <asp:GridView ID="GridView1" CssClass="gridStyle" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" BorderColor="#56A5EB" BorderStyle="Solid" BorderWidth="1px" BorderRadius="5px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <p>
            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn" />
            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn" OnClick="btnView_Click" />
         </p>

        <p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn" />
        </p>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>

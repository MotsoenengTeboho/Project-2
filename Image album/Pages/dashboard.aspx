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
            <asp:Label ID="Label1" CssClass="lblHeader" runat="server" Text="Image Album"></asp:Label>
        </div>
        <p>
            <asp:Label ID="lblWelcome" runat="server" Text="Label"></asp:Label>
        </p>
            
        
        <asp:Table ID="Table1" runat="server"  CellPadding="40" BorderStyle="Solid" BorderColor="#56a5eb">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Surname</asp:TableHeaderCell>
                <asp:TableHeaderCell>Description</asp:TableHeaderCell>
                <asp:TableHeaderCell>Image</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>Teboho</asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn" />
         </p>
    </form>
</body>
</html>

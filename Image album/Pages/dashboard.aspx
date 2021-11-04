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
        <p>
            <asp:Label ID="Label3" runat="server" Text="Delete with title: "></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        <p>
            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn" OnClick="btnInsert_Click" />
            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn" OnClick="btnView_Click" />
         </p>

        <p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn" />
            
        </p>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>

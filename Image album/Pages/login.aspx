<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Image_album.Pages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link href="../Css/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="">
            <asp:Label ID="Label1" runat="server" Text="Login" CssClass="label"></asp:Label>        
        </div>
        <div class="">
            <p>
                <asp:Label ID="Label2" runat="server" Text="Email:" CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="logEmailTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Password:" CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="logPasswordTxt" runat="server"></asp:TextBox>
            </p>
        </div>
        
        
        <p>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" />
        </p>
        <asp:Label ID="Label4" runat="server" Text="Don't have an account?"></asp:Label>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/registration.aspx">Register</asp:HyperLink>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Image_album.Pages.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>

    <link href="../Css/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" CssClass="label" runat="server" Text="Registration"></asp:Label>
        <asp:Label ID="Label2" CssClass="parameters" runat="server" Text="Name:"></asp:Label>
        <p>
            <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label3" runat="server" Text="Surname:" CssClass="parameters"></asp:Label>
        <asp:TextBox ID="surnameTxt" runat="server"></asp:TextBox>
        
        <asp:Label ID="Label4" runat="server" Text="Email:" CssClass="parameters"></asp:Label>
        <p>
            <asp:TextBox ID="emailTxt" runat="server"></asp:TextBox>
        </p>

        <asp:Label ID="Label5" runat="server" Text="Password" CssClass="parameters"></asp:Label>
        <asp:TextBox ID="passwordTxt" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Button" />
        </p>
        
        <asp:Label ID="Label6" runat="server" Text="Already have an account?"></asp:Label>
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/login.aspx">Login</asp:HyperLink>
        
    </form>
</body>
</html>

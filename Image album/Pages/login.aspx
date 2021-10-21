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
                <asp:Label ID="Label2" runat="server" Text="Email:  " CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="emailReqVal" runat="server" ErrorMessage="Email required." ControlToValidate="logEmailTxt"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="logEmailTxt" runat="server" TextMode="Email"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Password:  " CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password required." ControlToValidate="logPasswordTxt"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="logPasswordTxt" runat="server" TextMode="Password"></asp:TextBox>
            </p>
        </div>
        
        
        <p>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
        </p>
        <asp:Label ID="Label4" runat="server" Text="Don't have an account?"></asp:Label>

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/registration.aspx">Register</asp:HyperLink>

        <p>
            <asp:Label ID="logLabel" runat="server" Text="" CssClass="errorLabel"></asp:Label>
        </p>

    </form>
</body>
</html>

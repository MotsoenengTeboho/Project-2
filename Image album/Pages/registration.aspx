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
            <asp:Label ID="Label1" CssClass="label" runat="server" Text="Registration"></asp:Label>
        </div>
        
        <div>
            
            <p>
                <asp:Label ID="Label2" CssClass="parameters" runat="server" Text="Name:"></asp:Label>
                <asp:RequiredFieldValidator ID="nameReqVal" runat="server" ErrorMessage="Field required!" ControlToValidate="nameTxt" CssClass="errorLabel"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Surname:" CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="surnameReqVal" runat="server" ErrorMessage="Field Required!" ControlToValidate="surnameTxt"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="surnameTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" Text="Email:" CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="emailReqVal" runat="server" ErrorMessage="Field required!" ControlToValidate="emailTxt"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="emailTxt" runat="server" TextMode="Email"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label5" runat="server" Text="Password:" CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="passwordReqVal" runat="server" ErrorMessage="Field required!" ControlToValidate="passwordTxt"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password"></asp:TextBox>
            </p>
        </div>
        
        <p>
            <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </p>
        
        <asp:Label ID="Label6" runat="server" Text="Already have an account?"></asp:Label>
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/login.aspx" CssClass="hyper">Login</asp:HyperLink>
        
        <p>
            <asp:Label ID="conLabel" runat="server" Text=""></asp:Label>
        </p>
        
    </form>
    
</body>
</html>

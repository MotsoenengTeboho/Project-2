<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createAlbum.aspx.cs" Inherits="Image_album.Pages.createAlbum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Album</title>

    <link href="../Css/shareImage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Create Album" CssClass="label"></asp:Label>
        </div>
        <div>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Album name: " CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Album name required" CssClass="parameters" ControlToValidate="albumNameTxt"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="albumNameTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Select image: " CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </p>
        </div>

        <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="btn" OnClick="btnCreate_Click" />
       <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/shareImages.aspx" CssClass="parameters">Go Back</asp:HyperLink>
       </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="" CssClass="parameters"></asp:Label>
        </p>
    </form>
</body>
</html>

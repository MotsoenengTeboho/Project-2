<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertImage.aspx.cs" Inherits="Image_album.Pages.insertImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image album</title>

    <link href="../Css/insertImage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label5" runat="server" Text="Upload image" CssClass="label"></asp:Label>
        </div>
        <div>
            <p>
                <asp:Label ID="lblWelcome" runat="server" Text="" CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label6" CssClass="parameters" runat="server" Text="Title:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title of image is required." ControlToValidate="titleTxt" CssClass="parameters"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="titleTxt" runat="server"></asp:TextBox>
            </p>
             <p>
                <asp:Label ID="Label2" runat="server" Text="Description:" CssClass="parameters"></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description is required." ControlToValidate="descriptionTxt" CssClass="parameters"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="descriptionTxt" runat="server" ></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Upload Date:" CssClass="parameters"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date is required." ControlToValidate="uploadDateTxt" CssClass="parameters"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="uploadDateTxt" runat="server" TextMode="Date"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" Text="Image: " CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:FileUpload ID="FileUpload1" runat="server" accept="image/*" />
            </p>
        </div>
        
        <asp:Button ID="btnSubmit" runat="server" Text="Upload image" CssClass="btn" OnClick="btnSubmit_Click" />
        <p>
            <asp:Label ID="Label1" runat="server" Text="Done uploading photos? " CssClass="parameters"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/dashboard.aspx">Back to dashboard</asp:HyperLink>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="" CssClass="parameters"></asp:Label>
        </p>
        
    </form>
</body>
</html>

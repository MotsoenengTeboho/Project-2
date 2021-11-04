<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteImage.aspx.cs" Inherits="Image_album.Pages.deleteImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../Css/dashboard.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Delete Record" CssClass="lblHeader"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" >
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Upload_Date" HeaderText="Upload_Date" SortExpression="Upload_Date" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:imageAlbumDbConnectionString %>" SelectCommand="SELECT * FROM [Image]"></asp:SqlDataSource>
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" OnClick="btnDelete_Click" />
        <p>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>

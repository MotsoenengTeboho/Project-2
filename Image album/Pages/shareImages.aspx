<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shareImages.aspx.cs" Inherits="Image_album.Pages.shareImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Share images</title>

    <link href="../Css/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Download image" CssClass="label" ></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Select an image id to download: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Select id</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <br />
        </div>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("Photo") %>' Width="180px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:imageAlbumDbConnectionString %>" SelectCommand="SELECT * FROM [Image]"></asp:SqlDataSource>
        </p>
        <asp:Button ID="btnDownload" runat="server" Text="Download" CssClass="btn" OnClick="btnDownload_Click"  />
        <p>
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>

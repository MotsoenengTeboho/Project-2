<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shareImages.aspx.cs" Inherits="Image_album.Pages.shareImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Download</title>
    
    <link href="../Css/dashboard.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Download image" CssClass="lblHeader" ></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" CssClass="parameters" Text="Select an image id to download: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropDownStyle" DataTextField="Id" DataValueField="Id">
                <asp:ListItem>Select an image ID</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="btnFillID" runat="server" Text="Show image ID" CssClass="btn" OnClick="btnFillID_Click" />
        <asp:Button ID="btnViewImage" runat="server" Text="View Image" CssClass="btn" OnClick="btnViewImage_Click" />
        <div>
            <br />
        </div>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Photo") %>' Width="300px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:imageAlbumDbConnectionString %>" SelectCommand="SELECT * FROM [Image]"></asp:SqlDataSource>
        </p>
        <asp:Button ID="btnDownload" runat="server" Text="Download" CssClass="btn" OnClick="btnDownload_Click"  />
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/dashboard.aspx" CssClass="parameters">Go back</asp:HyperLink>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>

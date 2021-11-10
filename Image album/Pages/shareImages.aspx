<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shareImages.aspx.cs" Inherits="Image_album.Pages.shareImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Albums</title>
    
    <link href="../Css/dashboard.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Create Albums" CssClass="lblHeader" ></asp:Label>
        </div>
        <p>
            <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>
        </p>
        <div>
            <asp:Label ID="Label2" runat="server" CssClass="parameters" Text="Select album name to view: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropDownStyle" DataTextField="Album_Name" DataValueField="Album_Name">
                <asp:ListItem>Select album name</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnViewAlbum" runat="server" Text="View album" CssClass="btn" OnClick="btnViewAlbum_Click" />
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Select album name to delete "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropDownStyle" DataTextField="Album_Name" DataValueField="Album_Name">
                <asp:ListItem>Select album name</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Delete album" CssClass="btn" OnClick="Button1_Click" />
        </div>

        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                <asp:BoundField DataField="Album_Name" HeaderText="Album_Name" SortExpression="Album_Name" />
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="150px" />
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

        <asp:Button ID="btnViewAll" runat="server" Text="View all" CssClass="btn" OnClick="btnViewAll_Click" />
        <asp:Button ID="btnCreateAlbum" runat="server" Text="Create album" CssClass="btn" OnClick="btnCreateAlbum_Click" />

        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:imageAlbumDbConnectionString %>" SelectCommand="SELECT * FROM [Album]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/dashboard.aspx" CssClass="parameters">Go back</asp:HyperLink>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>

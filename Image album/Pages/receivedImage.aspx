<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receivedImage.aspx.cs" Inherits="Image_album.Pages.receivedImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View images shared</title>
    <link href="../Css/shareImage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Share images" CssClass="label"></asp:Label>
        </p>
        <div>
            <p>
                <asp:Label ID="welcomeLabel" runat="server" Text="" CssClass="parameters"></asp:Label>
            </p>

            <p>
                <asp:Label ID="Label2" runat="server" Text="Receiver's email: " CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="usersEmailTxt" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Image to share: " CssClass="parameters"></asp:Label>
            </p>
            <p>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </p>
        </div>
        <asp:Button ID="btnShareImages" runat="server" Text="Share image" CssClass="btn" OnClick="btnShareImages_Click" />
        <p>
            <asp:GridView ID="GridView1" CssClass="parameters" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" CellSpacing="4">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Sender_Email" HeaderText="Sender_Email" SortExpression="Sender_Email" />
                    <asp:BoundField DataField="Receiver_Email" HeaderText="Receiver_Email" SortExpression="Receiver_Email" />
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
        </p>
        <asp:Button ID="btnViewShared" runat="server" Text="View images" CssClass="btn" OnClick="btnViewShared_Click" />
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/dashboard.aspx">Go back</asp:HyperLink>
        </p>
        <p>
            <asp:Label ID="lblOutput" runat="server" Text="" CssClass="parameters"></asp:Label>
        </p>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:imageDbConnectionString %>" SelectCommand="SELECT * FROM [shareTbl]"></asp:SqlDataSource>
    </form>
</body>
</html>

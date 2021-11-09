<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Image_album.Pages.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
    <link href="../Css/dashboard.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="divHead">
            &nbsp;<asp:Label ID="Label1" CssClass="lblHeader move" runat="server" Text="Image Album"></asp:Label>
        </div>
        <p>
            <asp:Label ID="lblWelcome" runat="server" Text="Label"></asp:Label>
            
        </p>
        <div>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Delete using an image ID: "></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropDownStyle" DataTextField="Id" DataValueField="Id">
                    <asp:ListItem>Select an ID</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" OnClick="btnDelete_Click" />
                
            </p>
        </div>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Search image by using title"></asp:Label>
            <asp:TextBox ID="searchTxt" runat="server" CssClass="dropDownStyle"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
            
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="gridStyle" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="3px" CellPadding="4" CellSpacing="4">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Upload_Date" HeaderText="Upload_Date" SortExpression="Upload_Date" />
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Photo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("Photo") %>' Width="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="" OnClick="LinkButton1_Click1" Text="Download"></asp:LinkButton>
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
        <p>
            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="btn" OnClick="btnInsert_Click" />
            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn" OnClick="btnView_Click" />
         </p>

        <p>
            <asp:Button ID="btnDown" runat="server" Text="Download" CssClass="btn" OnClick="btnDown_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn" />
        </p>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>

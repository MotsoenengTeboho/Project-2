<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Image_album.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5></h5>
    <h1>About us</h1>
    <h5>We are a web based application that serves as an onlineplatform that allows users to store, view and share images.
        <br /> Users are able to create an account (by registering their account with us) and login using their account credentials.
        <br />Once logged in, as a user you should be able to view your own images and the ones shared to you.
    </h5>
    <h5> As a user you will also be able to create and manage the metadata recorded for each photo that the user has access 
        <br />to.You will also be able to download the images that you have access to.
    </h5>
    <h5></h5>
    <h4>Save & share your memories with us!</h4>
    
    <div>
        <div class="imgContainer column">
            <img class="images" src="../images/_121018455_gettyimages-577003673.jpg" />
            <div class="overlay">
                <div class="text">Friends</div>
            </div>
        </div>
        <div class="imgContainer column">
            <img class="images" src="../images/ballast-point-sunrise-stage-right.jpg" />
            <div class="overlay">
                <div class="text">Sunsets</div>
            </div>
        </div>
    </div>
    

</asp:Content>

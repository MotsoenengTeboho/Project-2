using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace Image_album.Pages
{
    public partial class insertImage : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection(@"workstation id=imageAlbumDb.mssql.somee.com;packet size=4096;user id=motsoenengT_SQLLogin_3;pwd=etx2iu8p79;data source=imageAlbumDb.mssql.somee.com;persist security info=False;initial catalog=imageAlbumDb");
        protected void Page_Load(object sender, EventArgs e)
        {

            lblWelcome.Text = "Logged in as: " + Session["email"];
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            HttpPostedFile file = FileUpload1.PostedFile;
            FileUpload1.SaveAs(Server.MapPath("~/images/") + Path.GetFileName(FileUpload1.FileName));
            String imageLink = "~/images/" + Path.GetFileName(FileUpload1.FileName);
            string extension = Path.GetExtension(file.FileName);

            if (extension.ToLower() == ".bmp" || extension.ToLower() == ".ico" || extension.ToLower() == ".png" ||
                extension.ToLower() == ".tiff" || extension.ToLower() == ".gif" || extension.ToLower() == ".jpg" ||
                extension.ToLower() == ".jpeg")
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("INSERT INTO [Image](User_Email, Title, Description, Upload_Date, Photo) VALUES ('" + Session["email"] + "', '" + titleTxt.Text + "', '" + descriptionTxt.Text + "', '" + uploadDateTxt.Text + "', '" + imageLink + "')", connection);
                    command.ExecuteNonQuery();

                    connection.Close();

                    Label7.Text = "Upload successful!";
                }
                catch (Exception error)
                {
                    Label7.Text = "Error: " + error.Message;
                }
            }
            else
            {
                Label7.Text = "Only files with (.png, .jpeg, .bmp, .ico, .jpg, .gif, .tiff) are allowed";
            }

            

            titleTxt.Text = "";
            descriptionTxt.Text = "";
            uploadDateTxt.Text = "";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Image_album.Pages
{
    public partial class createAlbum : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"workstation id=imageAlbumDb.mssql.somee.com;packet size=4096;user id=motsoenengT_SQLLogin_3;pwd=etx2iu8p79;data source=imageAlbumDb.mssql.somee.com;persist security info=False;initial catalog=imageAlbumDb");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = FileUpload1.PostedFile;
            FileUpload1.SaveAs(Server.MapPath("~/albumImages/") + Path.GetFileName(FileUpload1.FileName));
            String imageLink = "~/albumImages/" + Path.GetFileName(FileUpload1.FileName);
            string extension = Path.GetExtension(file.FileName);

            if (extension.ToLower() == ".bmp" || extension.ToLower() == ".ico" || extension.ToLower() == ".png" ||
                extension.ToLower() == ".tiff" || extension.ToLower() == ".gif" || extension.ToLower() == ".jpg" ||
                extension.ToLower() == ".jpeg")
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("INSERT INTO [Album](User_Email, Album_Name, Image) VALUES ('" + Session["email"] + "', '" + albumNameTxt.Text + "', '" + imageLink + "')", connection);
                    command.ExecuteNonQuery();

                    connection.Close();

                    Label4.Text = "Created album successful!";
                }
                catch (Exception error)
                {
                    Label4.Text = "Error: " + error.Message;
                }
            }
            else
            {
                Label4.Text = "Only files with (.png, .jpeg, .bmp, .ico, .jpg, .gif, .tiff) are allowed";
            }

            albumNameTxt.Text = "";
        }
    }
}
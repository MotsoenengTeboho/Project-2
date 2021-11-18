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

        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageDb.mdf;Integrated Security=True");
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
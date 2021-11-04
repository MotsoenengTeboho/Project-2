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
        
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageAlbumDb.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = "Logged in as: " + Session["email"];
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);

            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/images/" + FileUpload1.FileName.ToString());
            String path = Path.GetFullPath("images/" + FileUpload1.FileName.ToString());

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" 
                || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                

                //string config = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            }
            else
            {
                Label7.Text = "Only images (.jpg, .png, .gif, .bmp) can be uploaded";
                
            }
            try
            {
                connection.Open();
                
                SqlCommand command = new SqlCommand("INSERT INTO [Image](User_Email, Title, Description, Upload_Date, Photo) VALUES ('" + Session["email"] + "', '" + titleTxt.Text + "', '" + descriptionTxt.Text + "', '" + uploadDateTxt.Text + "', '"+ FileUpload1.PostedFile +"')", connection);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                byte[] bytes = (byte[])command.ExecuteScalar();
                connection.Close();

                Label7.Text = "Upload successful!";
            }
            catch (Exception error)
            {
                Label7.Text = "Error: " + error.Message;
            }

            titleTxt.Text = "";
            descriptionTxt.Text = "";
            uploadDateTxt.Text = "";
        }
    }
}
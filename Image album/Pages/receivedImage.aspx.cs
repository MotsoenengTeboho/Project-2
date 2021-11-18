using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Image_album.Pages
{
    public partial class receivedImage : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageDb.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            welcomeLabel.Text = "Logged in as: " + Session["email"];
        }

        protected void btnViewShared_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                String query = "SELECT * FROM [shareTbl] WHERE Receiver_Email = '" + Session["email"] + "'";
                SqlCommand command = new SqlCommand(query, connection);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataSet ds = new DataSet();
                adapter.Fill(ds, "User");

                GridView1.DataSource = ds;
                GridView1.DataBind();

                connection.Close();
            }
            catch (Exception error)
            {
                lblOutput.Text = "Error: " + error.Message;
            }
        }

        protected void btnShareImages_Click(object sender, EventArgs e)
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
                    SqlCommand com = new SqlCommand("INSERT INTO [shareTbl](Sender_Email, Receiver_Email, Image) VALUES ('"+ Session["email"] + "', '"+ usersEmailTxt.Text +"', '"+ imageLink +"')", connection);

                    com.ExecuteNonQuery();
                    connection.Close();

                    lblOutput.Text = "Image shared successfully.";
                }
                catch (Exception error)
                {
                    lblOutput.Text = "Error: " + error.Message;
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Image_album.Pages
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageAlbumDb.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();

                //String queryStr = @"SELECT COUNT(1) FROM [User] WHERE Email='" + logEmailTxt.Text + "' AND Password='" + logPasswordTxt.Text + "'";
                String query = "SELECT COUNT(1) FROM [User] WHERE Email=@email AND Password=@password";
                SqlCommand com = new SqlCommand(query, connection);

                com.Parameters.AddWithValue("@email", logEmailTxt.Text);
                com.Parameters.AddWithValue("password", logPasswordTxt.Text);
                int count = Convert.ToInt32(com.ExecuteScalar());

                
                if (count == 1)
                {
                    Session["email"] = logEmailTxt.Text.Trim();
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    logLabel.Text = "Incorrect log in credentials!";
                }

                connection.Close();
            }

            catch (Exception ex)
            {
                logLabel.Text = "Error: " + ex.Message;
            }
        }
    }
}
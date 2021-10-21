using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Image_album.Pages
{
    
    public partial class registration : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageAlbumDb.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();

                SqlCommand command = new SqlCommand("INSERT INTO [User](Name, Surname, Email, Password) VALUES ('" + nameTxt.Text + "', '" + surnameTxt.Text + "', '" + emailTxt.Text + "', '" + passwordTxt.Text + "')", connection);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                SqlDataReader readEmail = command.ExecuteReader();
                if (readEmail.HasRows)
                {
                    conLabel.Text = "Email already exists in the database! Please log in.";
                }
                else
                {
                    conLabel.Text = "Email does not exist in the database! Please create account.";
                }

                connection.Close();
            }
            catch (Exception error)
            {
                conLabel.Text = "Error: " + error.Message;
            }

            if(passwordTxt.MaxLength < 8)
            {
                passwordReqVal.ErrorMessage = "Password must be 8-10 characters long."; 
            }

            nameTxt.Text = "";
            surnameTxt.Text = "";
            emailTxt.Text = "";
            passwordTxt.Text = "";

            Response.Redirect("login.aspx");
        }
    }
}
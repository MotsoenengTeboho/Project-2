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
        SqlConnection connection = new SqlConnection(@"workstation id=imageAlbumDb.mssql.somee.com;packet size=4096;user id=motsoenengT_SQLLogin_2;pwd=sa1ba5cmjn;data source=imageAlbumDb.mssql.somee.com;persist security info=False;initial catalog=imageAlbumDb");
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

                SqlDataReader reader = command.ExecuteReader();
                if(reader.HasRows)
                {
                    conLabel.Text = "Sorry thee email already exists! Please Log in.";
                }
                else
                {
                    conLabel.Text = "Account registered successfully.";
                }

                connection.Close();
                
            }
            catch (Exception error)
            {
                conLabel.Text = "Error: " + error.Message;
            }

            nameTxt.Text = "";
            surnameTxt.Text = "";
            emailTxt.Text = "";
            passwordTxt.Text = "";

            Response.Redirect("login.aspx");
        }
    }
}
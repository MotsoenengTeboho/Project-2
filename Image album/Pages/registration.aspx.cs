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
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Asus Pc\Documents\imageDb.mdf;Integrated Security=True");
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
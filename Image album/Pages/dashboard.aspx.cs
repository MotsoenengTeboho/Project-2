using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Image_album.Pages
{
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageAlbumDb.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = "Welcome " + Session["email"];
        }

        
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
        
            Response.Redirect("WebForm1.aspx");
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                //SELECT * FROM [Image] WHERE Email = '" + Session["email"] + "'
                String query = "SELECT * FROM [User] WHERE Email = '" + Session["email"] + "'";
                SqlCommand command = new SqlCommand(query, con);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataSet ds = new DataSet();
                adapter.Fill(ds, "User");

                GridView1.DataSource = ds;
                GridView1.DataBind();

                con.Close();
            }
            catch (Exception ex)
            {
                Label2.Text = "Error: " + ex.Message;
            }
        }
    }
}
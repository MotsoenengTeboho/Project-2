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
    public partial class shareImages : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Project 2\Image album\imageAlbumDb.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                con.Open();

                String query = "SELECT Id FROM [Image] WHERE User_Email = '" + Session["email"] + "'";
                SqlCommand command = new SqlCommand(query, con);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataSet ds = new DataSet();
                adapter.Fill(ds, "User");

                DropDownList1.DataSource = ds;
                DropDownList1.DataBind();

                con.Close();
            }
            catch (Exception ex)
            {
                Label3.Text = "Error: " + ex.Message;
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                String query = "SELECT Photo FROM [Image] WHERE Id = '" + DropDownList1.SelectedValue + "' AND User_Email = '" + Session["email"] + "'";
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
                Label3.Text = "Error: " + ex.Message;
            }
        }
    }
}
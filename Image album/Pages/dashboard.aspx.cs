using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace Image_album.Pages
{
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Asus Pc\Documents\imageDb.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblWelcome.Text = "Logged in as: " + Session["email"];
        }

        
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("~/WebForm1.aspx");
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            refresh();
            refreshGrid();
            Label2.Visible = false;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("insertImage.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {}

        public void refreshGrid()
        {
            try
            {
                con.Open();
                String query = "SELECT * FROM [Image] WHERE User_Email = '" + Session["email"] + "'";
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
        public void refresh()
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
                Label2.Text = "Error: " + ex.Message;
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != null)
            {
                try
                {
                    con.Open();

                    String query = "DELETE FROM [Image] WHERE Id = '" + DropDownList1.SelectedValue + "'";
                    SqlCommand com = new SqlCommand(query, con);

                    com.ExecuteNonQuery();

                    con.Close();

                    Label2.Text = "Delete seccessful.";
                }

                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                Label3.Text = "Nothing to delete.";
            }

            refresh();
            refreshGrid();

            searchTxt.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("deleteImage.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                String query = "SELECT * FROM [Image] WHERE Title = '" + searchTxt.Text + "' AND User_Email = '" + Session["email"] + "'";
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

            refresh();
            searchTxt.Text = "";
            Label2.Visible = false;
        }

        protected void btnDown_Click(object sender, EventArgs e)
        {
            Response.Redirect("shareImages.aspx");
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {}
    }
}
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
        SqlConnection con = new SqlConnection(@"workstation id=imageAlbumDb.mssql.somee.com;packet size=4096;user id=motsoenengT_SQLLogin_2;pwd=sa1ba5cmjn;data source=imageAlbumDb.mssql.somee.com;persist security info=False;initial catalog=imageAlbumDb");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblWelcome.Text = "Logged in as: " + Session["email"];
        }

        public void refreshGrid()
        {
            try
            {
                con.Open();
                string query = "SELECT * FROM [Album] WHERE User_Email = '" + Session["email"] + "'";
                SqlCommand com = new SqlCommand(query, con);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = com;

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
        public void fillViewList()
        {
            try 
            {
                con.Open();
                string sql = "SELECT Distinct(Album_Name) FROM [Album] WHERE User_Email = '" + Session["email"] + "'";
                SqlCommand command = new SqlCommand(sql, con);

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

        public void fillDeleteList()
        {
            try
            {
                con.Open();
                string sql = "SELECT Distinct(Album_Name) FROM [Album] WHERE User_Email = '" + Session["email"] + "'";
                SqlCommand command = new SqlCommand(sql, con);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataSet ds = new DataSet();
                adapter.Fill(ds, "User");

                DropDownList2.DataSource = ds;
                DropDownList2.DataBind();

                con.Close();
            }
            catch (Exception ex)
            {
                Label3.Text = "Error: " + ex.Message;
            }
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string query = "SELECT * FROM [Album] WHERE User_Email = '" + Session["email"] + "'";
                SqlCommand com = new SqlCommand(query, con);

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = com;

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

            fillViewList();
            fillDeleteList();
        }

        protected void btnCreateAlbum_Click(object sender, EventArgs e)
        {
            Response.Redirect("createAlbum.aspx");
        }

        protected void btnViewAlbum_Click(object sender, EventArgs e)
        {
            try 
            {
                con.Open();
                string selectQuery = "SELECT * FROM [Album] WHERE Album_Name = '" + DropDownList1.SelectedItem + "'";
                SqlCommand command = new SqlCommand(selectQuery, con);

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            try 
            {
                con.Open();
                string deleteSql = "DELETE FROM [Album] WHERE Album_Name = '" + DropDownList2.SelectedItem + "'";
                SqlCommand comm = new SqlCommand(deleteSql, con);

                comm.ExecuteNonQuery();
                con.Close();

                Label3.Text = "Deleted album successfully.";
            }
            catch (Exception ex)
            {
                Label3.Text = "Error: " + ex.Message;
            }
            refreshGrid();
        }
    }
}
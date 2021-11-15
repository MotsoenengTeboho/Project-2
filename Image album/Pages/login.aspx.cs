﻿using System;
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
        SqlConnection connection = new SqlConnection(@"workstation id=imageAlbumDb.mssql.somee.com;packet size=4096;user id=motsoenengT_SQLLogin_2;pwd=sa1ba5cmjn;data source=imageAlbumDb.mssql.somee.com;persist security info=False;initial catalog=imageAlbumDb");
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try 
            {
                connection.Open();

                String query = "SELECT COUNT(1) FROM [User] WHERE Email=@email AND Password=@password";
                SqlCommand com = new SqlCommand(query, connection);

                com.Parameters.AddWithValue("@email", logEmailTxt.Text);
                com.Parameters.AddWithValue("@password", logPasswordTxt.Text);
                int count = Convert.ToInt32(com.ExecuteScalar());

                if (count == 1)
                {
                    Session["Email"] = logEmailTxt.Text.Trim();
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    Label5.Text = "Incorrect user credentials.";
                }

                connection.Close();
            }

            catch(Exception ex)
            {
                Label5.Text = "Error: " + ex.Message; ;
            }
        }
    }
}
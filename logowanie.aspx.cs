using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Projekt_SIwZP
{
    public partial class logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string login = TextBox1.Text;
            string password = TextBox2.Text;
           
            SqlCommand cmd = new SqlCommand("SELECT * FROM uzytkownicy WHERE Login='" + login + "' AND Password='" + password + "'", conn);

            if (login == "" || password == "")
            {
                Error1.Visible = true;
            }
            else
            {
                Error1.Visible = false;

                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if(count == 1)
                {
                    Session["username"] = login;
                    ktozalogowany.Text = (string)Session["username"];
                    //Response.Redirect("pozalogowaniu.aspx");
                }
                else
                {
                    Response.Redirect("logowanie.aspx");
                }

                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("pozalogowaniu.aspx");
        }
    }
}
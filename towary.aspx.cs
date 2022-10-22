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
    public partial class towary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelError.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Visible = false;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Dodawanie rekordu
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string Nazwa = TextBox1.Text;
            string Cena = TextBox2.Text;
            string Ilosc = TextBox3.Text;
            SqlCommand cmd = new SqlCommand(

            "Insert towary (Nazwa_towaru, Cena, Stan) Values ('"
            + Nazwa + "','" + Cena + "','" + Ilosc + "')", conn);

            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
            {
                LabelError.Visible = true;
                LabelError.Text = "Wszystkie pola muszą zostać wypełnione!";
            }
            else
            {
                Button1.Visible = true;
                Panel1.Visible = false;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("towary.aspx");
        }
    }
}
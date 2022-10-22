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
    public partial class potencjalni : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            string Miejscowosc = TextBox2.Text;
            string Kod_pocztowy = TextBox3.Text;
            string Telefon = TextBox4.Text;
            string Email = TextBox5.Text;
            string Informacje = TextBox6.Text;
            bool CzyKontakt = CheckBox1.Checked;
            bool CzyChetni = CheckBox2.Checked;
            SqlCommand cmd = new SqlCommand(

            "Insert potencjalni (Nazwa, Miejscowosc, Kod_pocztowy, Telefon, Email, Informacje, CzyKontakt, CzyChetni) Values ('"
            + Nazwa + "','" + Miejscowosc + "','" + Kod_pocztowy + "','" + Telefon + "','" + Email + "','" + Informacje + "','" + CzyKontakt + "','" + CzyChetni + "')", conn);

            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "")
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
            Response.Redirect("potencjalni.aspx");
        }
    }
}
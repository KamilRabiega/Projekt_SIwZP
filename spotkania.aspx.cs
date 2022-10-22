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
    public partial class spotkania : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelErrorDodawania.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Panel1.Visible == true)
            {
                Panel1.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Panel2.Visible == true)
            {
                Panel2.Visible = false;
            }
            else
            {
                Panel2.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Panel3.Visible == true)
            {
                Panel3.Visible = false;
            }
            else
            {
                Panel3.Visible = true;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            PanelNowe.Visible = true;
            Button4.Visible = false;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("spotkanie.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Dodawanie rekordu
            SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string Data = datepicker.Text;
            string Efekty = TextBox2.Text;
            bool Umowa = CheckBox1.Checked;
            int osoba_decyzyjna = DropDownList2.SelectedIndex+1;
            int przedstawiciel = DropDownList1.SelectedIndex+1;
            SqlCommand cmd = new SqlCommand(

            "Insert spotkania (Data_spotkania, Efekty_spotkania, Umowa, Id_pracownika, Id_decyzyjna) Values ('"
            + Data + "','" + Efekty + "','" + Umowa + "','" + osoba_decyzyjna + "', '" + przedstawiciel + "')", conn);

            if (datepicker.Text == "" || TextBox2.Text == "")
            {
                LabelErrorDodawania.Visible = true;
                LabelErrorDodawania.Text = "Wszystkie pola muszą zostać wypełnione!";
            }
            else
            {
                Button1.Visible = true;
                Panel1.Visible = false;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();
                Response.Redirect("spotkania.aspx");
            }
        }
    }
}
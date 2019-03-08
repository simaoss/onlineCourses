using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;

public partial class Prijava : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
    }
    protected void btnPrijava_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cm = new SqlCommand("Prijava", conn);

           
            cm.Parameters.AddWithValue("@KorisnickoIme", txtKorisnickoIme.Text.Trim());
            cm.Parameters.AddWithValue("@Lozinka", txtLozinka.Text.Trim());
            cm.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = null;

            try
            {
                conn.Open();

                dr = cm.ExecuteReader();

                if (dr != null)
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {

                            ListItem li = new ListItem();

                            li.Text = dr["ime"].ToString()+
                            " " + dr["prezime"].ToString();
                            li.Value = dr["idZaposlenik"].ToString();

                            lblIme.Text = li.Text;
                                Session["prijava"] = li;
                            
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("Greška kod dohvaćanja odabrane osobe! Opis: " + ex.Message);
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
                
                conn.Dispose();
                cm.Dispose();
                /*Response.Redirect("Predbiljezbe.aspx");*/
                Panel1.Visible = true;
                Panel2.Visible = false;
               
            }
        }
    }
    protected void lbSeminari_Click(object sender, EventArgs e)
    {
        Response.Redirect("Seminari.aspx");
    }
    protected void lbPredbiljezbe_Click(object sender, EventArgs e)
    {
        Response.Redirect("Predbiljezbe.aspx");
    }
}
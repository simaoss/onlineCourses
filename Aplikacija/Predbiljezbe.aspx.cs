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

public partial class Predbiljezbe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        ListItem li = new ListItem();
        if (Session["prijava"] != null)
        {            
            li= (ListItem)(Session["prijava"]);
            lblZaposlenik.Text = "Dobrodošli, " + li.Text;
            txtIme.Text = " ";
        }
        else
        {
            Response.Redirect("Prijava.aspx");
        }


        


    }
    protected void btnPrihvati_Click(object sender, EventArgs e)
    {
        

            int idSeminara = int.Parse(txtSeminar.Text);

            string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

            SqlConnection conn = new SqlConnection(connStr);
            SqlConnection conn1 = new SqlConnection(connStr);
            SqlCommand cm = new SqlCommand();
            SqlCommand cm1 = new SqlCommand();
            cm.Connection = conn;
            cm1.Connection = conn1;


                cm.CommandText = "INSERT INTO Prihvaceni (ime, prezime, adresa, idSeminara) VALUES (@ime, @prezime, @adresa, @idSeminara)";
                cm1.CommandText = "DELETE FROM Predbiljezba WHERE idPredbiljezba=@idpredbiljezba";
                cm.Parameters.AddWithValue("@datum", DateTime.Now.ToShortDateString());
                cm.Parameters.AddWithValue("@ime", txtIme.Text.Trim());
                cm.Parameters.AddWithValue("@prezime", txtPrezime.Text.Trim());
                cm.Parameters.AddWithValue("@adresa", txtAdresa.Text.Trim());
                cm.Parameters.AddWithValue("@idSeminara", int.Parse(txtSeminar.Text.Trim()));
                cm1.Parameters.AddWithValue("@idpredbiljezba",int.Parse(txtPredbiljezba.Text.Trim()));
                


                bool dodano = false;

                try
                {
                    conn.Open();
                    conn1.Open();
                    cm.ExecuteNonQuery();
                    cm1.ExecuteNonQuery();
                    dodano = true;

                }
                catch (Exception ex)
                {

                    Response.Write("Greška kod prihvačanja predbilježbe za seminar! Opis: " + ex.Message);
                }
                finally
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                    }
                    conn.Dispose();
                    cm.Dispose();
                    cm1.Dispose();
                }

                if (dodano)
                {
                    lblGreska.Text = "Uspješno ste upisali polaznika na seminar!";
                    lblGreska.Visible = true;
                    Response.Redirect("Predbiljezbe.aspx");
                }
            
           
        }
        


    
    protected void ddlSeminari_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblGreska.Visible = false;
        int odabir = ddlSeminari.SelectedIndex;

        /*string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cm = new SqlCommand();
        cm.Connection = conn;

        cm.Parameters.AddWithValue("@idSeminara", ddlSeminari.SelectedValue);
        cm.CommandText = "SELECT COUNT (*) as Popunjenost FROM Prihvaceni WHERE idSeminara=@idSeminara";
        cm.CommandType = CommandType.Text;

            conn.Open();
            int brojPrihvacenih = cm.ExecuteNonQuery();
            lblGreska.Text = "Broj polaznika seminara " + ddlSeminari.SelectedItem.Text + " jest: " + brojPrihvacenih.ToString();
            lblGreska.Visible = true;*/
            

                
    }
    protected void gvPredbiljezbe_SelectedIndexChanged(object sender, EventArgs e)
    {
         Panel1.Visible = true;
         txtIme.Text= gvPredbiljezbe.SelectedRow.Cells[1].Text;
         txtPrezime.Text = gvPredbiljezbe.SelectedRow.Cells[2].Text;
         txtAdresa.Text = gvPredbiljezbe.SelectedRow.Cells[3].Text;
         txtSeminar.Text = gvPredbiljezbe.SelectedRow.Cells[5].Text;
         txtPredbiljezba.Text=gvPredbiljezbe.SelectedRow.Cells[4].Text;
    }
    protected void btnOdbaci_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cm = new SqlCommand();
        cm.Connection = conn;

        cm.CommandText = "DELETE FROM Predbiljezba WHERE idPredbiljezba=@idpredbiljezba";
        cm.Parameters.AddWithValue("@idpredbiljezba", int.Parse(txtPredbiljezba.Text.Trim()));

        bool dodano = false;

        try
        {
            conn.Open();
            cm.ExecuteNonQuery();
            dodano = true;

        }
        catch (Exception ex)
        {

            Response.Write("Greška kod prihvačanja predbilježbe za seminar! Opis: " + ex.Message);
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Dispose();
            cm.Dispose();
        }

        if (dodano)
        {
            Response.Redirect("Predbiljezbe.aspx");
            lblGreska.Text = "Uspješno ste izbrisali predbilježbu!";
            lblGreska.Visible = true;
        }
    }
    protected void btnOdustani_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void tnPretraga_Click(object sender, EventArgs e)
    {
        panelSearch.Visible = true;
        ddlSeminari.Visible = false;
        gvPredbiljezbe.Visible = false;
        string conStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;
        /*string pretraga = txtPretraga.Text;*/

        /*string query = "SELECT Naziv, Opis, Zatvoren FROM Seminari WHERE Naziv LIKE '%@pretraga%' OR Opis LIKE '%@pretraga%'";*/

        SqlConnection con = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand("Predbiljezba_Search", con);
        cmd.Parameters.AddWithValue("@SearchTerm", txtPretraga.Text.Trim());
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        /*SqlCommand com = new SqlCommand(query,con);
        */
        try
        {
            con.Open();
            /*com.CommandType =CommandType.Text;
            com.CommandText =query ;
            com.ExecuteNonQuery();*/

            /*DataSet ds = new DataSet();
            da.Fill(ds);
            if (dt!= null)
            {*/
            gvPretraga.DataSource = dt;
            gvPretraga.DataBind();


            /*}
            else
            {
                lblG.Text = "Nema seminara s ključnom riječi "+txtPretraga.Text+" . Probajte s drugom ključnom riječi";
            */
        }
        catch (Exception ex)
        { Response.Write("Greška! Opis: " + ex.Message); }

        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Dispose();
            /*com.Dispose();*/
        }
    }

    protected void lbPovratak_Click(object sender, EventArgs e)
    {
        Response.Redirect("Predbiljezbe.aspx");
    }
    protected void gvPretraga_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        txtIme.Text = gvPretraga.SelectedRow.Cells[1].Text;
        txtPrezime.Text = gvPretraga.SelectedRow.Cells[2].Text;
        txtAdresa.Text = gvPretraga.SelectedRow.Cells[3].Text;
        txtSeminar.Text = gvPretraga.SelectedRow.Cells[5].Text;
        txtPredbiljezba.Text = gvPretraga.SelectedRow.Cells[4].Text;

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Predbiljezba.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Seminari.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["prijava"] = null;
        Response.Redirect("Predbiljezba.aspx");
    }
}
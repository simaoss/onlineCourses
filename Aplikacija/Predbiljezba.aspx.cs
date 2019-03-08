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


public partial class Predbiljezba : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel3.Visible = false;
        Panel1.Visible = false;
        lblText.Visible = false;
        gvSeminari.DataSource = DobaviSeminare();
        gvSeminari.DataBind();
    }

    private DataTable DobaviSeminare()
    {
        string connString =
           ConfigurationManager.ConnectionStrings["ConStrWin"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);

        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand
            = new SqlCommand("SELECT idSeminara, Naziv, Opis FROM Seminari WHERE Zatvoren=0", conn);

        DataTable dtSeminari = new DataTable();
        adapter.Fill(dtSeminari);

        return dtSeminari;

    }
    protected void gvSeminari_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtOdabir.Text = Convert.ToString(gvSeminari.SelectedRow.Cells[1].Text);
        lblSeminar.Text = Convert.ToString(gvSeminari.SelectedRow.Cells[2].Text);
        Panel1.Visible = true;
    }
    protected void lbPosalji_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cm = new SqlCommand();
        cm.Connection = conn;
        cm.CommandText = "INSERT INTO Predbiljezba (datum , ime, prezime, adresa, idSeminara) VALUES (@datum, @ime, @prezime, @adresa, @idSeminara)";
        cm.Parameters.AddWithValue("@datum", DateTime.Now.ToShortDateString()); 
        cm.Parameters.AddWithValue("@Ime", txtIme.Text.Trim());
        cm.Parameters.AddWithValue("@Prezime", txtPrezime.Text.Trim());
        cm.Parameters.AddWithValue("@Adresa", txtAdresa.Text.Trim());
        cm.Parameters.AddWithValue("@idSeminara", int.Parse(txtOdabir.Text.Trim()));


        bool dodano = false;

        try
        {
            conn.Open();
            cm.ExecuteNonQuery();
            dodano = true;

        }
        catch (Exception ex)
        {

            Response.Write("Greška kod predbilježbe za seminar! Opis: " + ex.Message);
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
            Panel1.Visible = false;
            lblText.Text = "Uspješno ste se prijavili na seminar: "+lblSeminar.Text;
            lblText.Visible = true;
            txtAdresa.Text = "";
            txtIme.Text = "";
            txtOdabir.Text = "";
            txtPrezime.Text = "";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Prijava.aspx");
    }

    private DataTable Pretraga()
    {
        string connString =
           ConfigurationManager.ConnectionStrings["ConStrWin"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);

        SqlCommand cmd = new SqlCommand("Predbiljezba_Pretraga", conn);
        cmd.Parameters.AddWithValue("@SearchTerm", txtPretrazi.Text.Trim());
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    
    protected void btnPretrazi_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel2.Visible = false;
        Panel1.Visible = false;
        gvPretraga.DataSource = Pretraga();
        gvPretraga.DataBind();
    }
    protected void gvPretraga_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtOdabir.Text = Convert.ToString(gvPretraga.SelectedRow.Cells[1].Text);
        lblSeminar.Text = Convert.ToString(gvPretraga.SelectedRow.Cells[2].Text);
        Panel1.Visible = true;
        Panel2.Visible = true;
    }
}
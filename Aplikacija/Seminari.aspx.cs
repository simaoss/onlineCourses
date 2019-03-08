using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;

public partial class Seminari : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ListItem li = new ListItem();
        if (Session["prijava"] != null)
        {
            li = (ListItem)(Session["prijava"]);
            lblKorisnik.Text = "Dobrodošli, " + li.Text;
          
        }
        else
        {
            Response.Redirect("Prijava.aspx");
        }
        if (!Page.IsPostBack)
        {
            btnPohrani.Visible = false;
            Panel1.Visible = false;
            Panel2.Visible = false;
            LoadData();
        }
    }

    private void LoadData()
    {
        Panel3.Visible = true;
        string conStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

        string query = "SELECT Seminari.Zatvoren, Seminari.idSeminara, Seminari.Naziv, Seminari.Opis, COUNT (Seminari.idSeminara) as Predbiljezeni from Seminari left join Prihvaceni as pr on Seminari.idSeminara=pr.idSeminara where Seminari.Zatvoren=0 group by Seminari.Zatvoren, Seminari.Naziv,Seminari.Opis, Seminari.idSeminara ";

        SqlDataAdapter da = new SqlDataAdapter(query, conStr);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables.Count > 0)
        {
            this.gvSeminari.DataSource = ds;
            this.gvSeminari.DataBind();

        }
        else
        {
            lblG.Text = "Nema seminara ni prijavljenih";
        }
    }


        private void LoadData2()
    {
        string conStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

        string query = "SELECT Seminari.Zatvoren, Seminari.idSeminara, Seminari.Naziv, Seminari.Opis, COUNT (Seminari.idSeminara) as Predbiljezeni from Seminari left join Prihvaceni as pr on Seminari.idSeminara=pr.idSeminara where Seminari.Zatvoren=1 group by Seminari.Zatvoren, Seminari.Naziv,Seminari.Opis, Seminari.idSeminara ";

        SqlDataAdapter da = new SqlDataAdapter(query, conStr);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables.Count > 0)
        {
            this.gvSeminari_Zatvoreni.DataSource = ds;
            this.gvSeminari_Zatvoreni.DataBind();

        }
        else
        {
            lblG.Text = "Nema seminara ni prijavljenih";
        }




    }

    public void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkStatus = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkStatus.NamingContainer;
        lblG.Text = "Seminar" + row.Cells[2].Text + " više nije aktivan. Ako ga želite vratiti kliknite na Dodaj novi seminar";


        string cid = row.Cells[1].Text;
        bool status = chkStatus.Checked;


        string conStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;
        string query = "UPDATE Seminari SET Zatvoren = @Zatvoren WHERE idSeminara = @idSeminara";

        SqlConnection con = new SqlConnection(conStr);
        SqlCommand com = new SqlCommand(query, con);


        com.Parameters.Add("@Zatvoren", SqlDbType.Bit).Value = status;
        com.Parameters.Add("@idSeminara", SqlDbType.Int).Value = cid;


        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        LoadData();


    }

    public void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkStatus = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkStatus.NamingContainer;
        lblG.Text = "Seminar "+row.Cells[2].Text+ "je sada aktivan i polaznici ga mogu upisivati!" ;


        string cid = row.Cells[1].Text;
        //bool status = chkStatus.Checked;


        string conStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;
        string query = "UPDATE Seminari SET Zatvoren = 0 WHERE idSeminara = @idSeminara";

        SqlConnection con = new SqlConnection(conStr);
        SqlCommand com = new SqlCommand(query, con);


        //com.Parameters.Add("@Zatvoren", SqlDbType.Bit).Value = status;
        com.Parameters.Add("@idSeminara", SqlDbType.Int).Value = cid;


        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        LoadData2();
        /*LoadData();*/


    }

    protected void gvPredbiljezbe_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        btnPohrani.Visible = true;
        txtIdSeminara.Text = gvSeminari.SelectedRow.Cells[1].Text;
        txtNaziv.Text = gvSeminari.SelectedRow.Cells[2].Text;
        txtOpis.Text = gvSeminari.SelectedRow.Cells[3].Text;
    }

    

    protected void btnPohrani_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cm = new SqlCommand();
        cm.Connection = conn;

        cm.CommandText = "UPDATE Seminari SET Naziv=@Naziv, Opis=@Opis WHERE idSeminara=@idSeminara";
        cm.Parameters.AddWithValue("@idSeminara", int.Parse(txtIdSeminara.Text.Trim()));
        cm.Parameters.AddWithValue("@Naziv", txtNaziv.Text);
        cm.Parameters.AddWithValue("@Opis", txtOpis.Text);

        try
        {
            conn.Open();
            cm.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

            Response.Write("Greška kod mijenjanja seminara! Opis: " + ex.Message);
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
        Panel1.Visible = false;
        LoadData();

    }


    protected void btnDodajNovi_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
        Panel4.Visible = false;
        LoadData2();
        lblG.Text = "";
        
    }

    protected void lbtn_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = true;
        LoadData();
    }
    protected void btnDodaj_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;

        SqlConnection conn = new SqlConnection(connStr);
        string zatvoren="1";

        SqlCommand cm = new SqlCommand();
        cm.Connection = conn;
        cm.CommandText = "INSERT INTO Seminari (naziv,opis, datum, zatvoren) VALUES (@naziv, @opis, @datum,@zatvoren)";
        cm.Parameters.AddWithValue("@datum", DateTime.Now.ToShortDateString());
        cm.Parameters.AddWithValue("@naziv", txtNaziv0.Text.Trim());
        cm.Parameters.AddWithValue("@opis", txtOpis0.Text.Trim());
        cm.Parameters.AddWithValue("@zatvoren", zatvoren);

        try
        {
            conn.Open();
            cm.ExecuteNonQuery();
        }

        catch (Exception ex)
        {

            Response.Write("Greška kod unosa seminara! Opis: " + ex.Message);
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Dispose();
            cm.Dispose();
            lblG.Text = "Uspješno ste dodali seminar: " + txtNaziv0.Text + " i on je sada aktivan";
        }
        Panel4.Visible = false;
        
        

        


    }
    protected void chbPanelDodaj_CheckedChanged(object sender, EventArgs e)
    {
        if (chbPanelDodaj.Checked==false)
        {
            Panel4.Visible = false;
        }
        else

        Panel4.Visible = true;
    }

    protected void tnPretraga_Click(object sender, EventArgs e)
    {

        Panel1.Visible = false;
        panelSearch.Visible = true;
        Panel3.Visible = false;
        Panel2.Visible = false;
        Panel4.Visible = false;
        string conStr = ConfigurationManager.ConnectionStrings["conStrWin"].ConnectionString;
        /*string pretraga = txtPretraga.Text;*/

        /*string query = "SELECT Naziv, Opis, Zatvoren FROM Seminari WHERE Naziv LIKE '%@pretraga%' OR Opis LIKE '%@pretraga%'";*/
                
        SqlConnection con = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand("Products_SearchProducts", con);
        cmd.Parameters.AddWithValue("@SearchTerm", txtPretraga.Text.Trim());
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt= new DataTable();
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
            catch(Exception ex)
        {Response.Write("Greška! Opis: " + ex.Message);}

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
        Response.Redirect("Seminari.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Predbiljezba.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Predbiljezbe.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Session["prijava"] = null;
        Response.Redirect("Predbiljezba.aspx");
    }
}

    

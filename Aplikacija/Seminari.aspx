<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Seminari.aspx.cs" Inherits="Seminari" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style7
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: xx-large;
        background-color: #FF6600;
            text-align: center;
        }
        .style9
        {
            font-size: x-large;
        }
        .style10
        {
            font-size: medium;
        }
        .style11
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
            background-color: #FFFFFF;
            text-align: center;
        }
        </style>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="margin-left: 560px">
        <span class="style11">&nbsp;&nbsp; </span>
        <span class="style7">Seminari</span></p>
    <p style="margin-left: 560px; text-align: left;">
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Početna</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Predbilježbe</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Odjava</asp:LinkButton>
    </p>
    <p>
        <asp:Label ID="lblG" runat="server" ForeColor="Red"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblKorisnik" 
            runat="server" Font-Size="Large" ForeColor="#3333FF"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p style="text-align: right; font-size: x-large">
        Pretraga&nbsp;
        <asp:TextBox ID="txtPretraga" runat="server"></asp:TextBox>
        <asp:Button ID="tnPretraga" runat="server" onclick="tnPretraga_Click" 
            Text="Pretraži" />
    </p>
    <asp:Panel ID="panelSearch" runat="server" Visible="False">
        <span class="style9">Rezultati pretrage:</span><br />
        <asp:GridView ID="gvPretraga" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" 
    GridLines="None">
            <AlternatingRowStyle BackColor="White" 
                    ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Naziv" HeaderText="Naziv" ReadOnly="True" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" ReadOnly="True" />
                <asp:BoundField DataField="Zatvoren" HeaderText="Zatvoren" ReadOnly="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" 
                    ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" 
                    ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" 
                    HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" 
                    ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <asp:LinkButton ID="lbPovratak" runat="server" onclick="lbPovratak_Click">Povratak na seminare</asp:LinkButton>
    </asp:Panel>
    <p>
    </p>
    <asp:Panel ID="Panel2" runat="server">
        <span class="style9">Dodavanje novog seminara<br /> </span>
        <span class="style10">Za aktiviranje postojećih seminara kliknite kvadratić. Ako 
        želite aktivirati novi seminar kliknite na kvadratić Dodaj novi seminar.<br />
        <br />
        <asp:LinkButton ID="lbtn" runat="server" onclick="lbtn_Click">Povratak na aktivne seminare</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="chbPanelDodaj" runat="server" AutoPostBack="True" 
            oncheckedchanged="chbPanelDodaj_CheckedChanged" />
        Dodaj novi seminar</span><br />&nbsp;<asp:GridView 
            ID="gvSeminari_Zatvoreni" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="idSeminara" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" 
                            onCheckedChanged="CheckBox2_CheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="idSeminara" HeaderText="idSeminara" ReadOnly="True" 
                    SortExpression="idSeminara" />
                <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <br />
        <asp:Panel ID="Panel4" runat="server">
            <asp:TextBox ID="txtIdSeminara1" runat="server" Visible="False"></asp:TextBox>
            <br />
            Naziv seminara:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtNaziv0" runat="server"></asp:TextBox>
            <br />
            Opis seminara:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtOpis0" runat="server" columns="30" rows="7" 
                TextMode="multiline" />
            <br />
            <asp:Button ID="btnDodaj" runat="server" onclick="btnDodaj_Click" 
                Text="Aktiviraj novi seminar" />
        </asp:Panel>
&nbsp; </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
        <p>
            <span class="style9"><strong>Aktivni 
        seminari</strong></span></p>
        <asp:GridView ID="gvSeminari" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None"
            onselectedindexchanged="gvPredbiljezbe_SelectedIndexChanged" 
            DataKeyNames="idSeminara" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                    onCheckedChanged="CheckBox1_CheckedChanged"  AutoPostBack="true" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="idSeminara" HeaderText="idSeminara" ReadOnly="True" 
                    SortExpression="idSeminara" />
                <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="Predbiljezeni" HeaderText="Broj predbilježenih" 
                    ReadOnly="True" SortExpression="Predbiljezeni" />
                <asp:CommandField SelectText="Odaberi" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conStrWin %>" SelectCommand="SELECT Seminari.Zatvoren, Seminari.idSeminara, Seminari.Naziv, Seminari.Opis, 
COUNT (Seminari.idSeminara) as Predbiljezeni from Seminari 
left join Prihvaceni as pr on Seminari.idSeminara=pr.idSeminara
where Seminari.Zatvoren=0 
group by Seminari.Zatvoren, Seminari.Naziv,Seminari.Opis, Seminari.idSeminara">
        </asp:SqlDataSource>
        <p>
            <asp:Button ID="btnDodajNovi" runat="server" Text="Dodaj novi seminar" 
            onclick="btnDodajNovi_Click" />
            <asp:Button ID="btnPohrani" runat="server" Text="Spremi promjene" 
            onclick="btnPohrani_Click" PostBackUrl="~/Seminari.aspx" />
        </p>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
        <p>
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtIdSeminara" runat="server" Visible="False"></asp:TextBox>
        </p>
        <p>
            Naziv seminara:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="txtNaziv" runat="server"></asp:TextBox>
        </p>
        <p>
            Opis seminara&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox id="txtOpis" TextMode="multiline" runat="server" rows="7" columns="30" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;</p>
    </asp:Panel>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Predbiljezbe.aspx.cs" Inherits="Predbiljezbe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: xx-large;
        background-color: #FF6600;
            text-align: left;
        }
        .style8
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style8">
        <span class="style7">Predbilježbe</span></p>
    <p class="style8">
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Početna</asp:LinkButton>
&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Seminari</asp:LinkButton>
&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Odjava</asp:LinkButton>
    </p>
    <p>
        <asp:Label ID="lblZaposlenik" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Pretraga&nbsp;
        <asp:TextBox ID="txtPretraga" runat="server"></asp:TextBox>
        <asp:Button ID="btnPretraga" runat="server" onclick="tnPretraga_Click" 
            Text="Pretraži" />
    </p>
    <asp:Panel ID="panelSearch" runat="server" Visible="False">
        <asp:GridView ID="gvPretraga" runat="server" 
            CellPadding="4" ForeColor="#333333" 
    GridLines="None" onselectedindexchanged="gvPretraga_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" 
                    ForeColor="#284775" />
            <Columns>
                <asp:ButtonField CommandName="Select" Text="Odaberi" />
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
        <asp:LinkButton ID="lbPovratak" runat="server" onclick="lbPovratak_Click">Povratak na predbilježbe</asp:LinkButton>
    </asp:Panel>
    <p>
        <asp:Label ID="lblGreska" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="ddlSeminari" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="Naziv" 
            DataValueField="idSeminara" 
            onselectedindexchanged="ddlSeminari_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="0">-------</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conStrWin %>" 
            
            SelectCommand="SELECT [Naziv], [idSeminara] FROM [Seminari]">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="gvPredbiljezbe" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
            GridLines="None" 
            onselectedindexchanged="gvPredbiljezbe_SelectedIndexChanged" 
            DataKeyNames="idPredbiljezba">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:ButtonField CommandName="Select" Text="Odaberi" />
                <asp:BoundField DataField="ime" HeaderText="Ime" SortExpression="ime" />
                <asp:BoundField DataField="Prezime" HeaderText="Prezime" 
                    SortExpression="Prezime" />
                <asp:BoundField DataField="Adresa" HeaderText="Adresa" 
                    SortExpression="Adresa" />
                <asp:BoundField DataField="idPredbiljezba" HeaderText="idPredbiljezba" 
                    SortExpression="idPredbiljezba" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="idSeminara" HeaderText="idSeminara" 
                    SortExpression="idSeminara" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conStrWin %>" 
            
            
            
            
            
            SelectCommand="SELECT [idPredbiljezba], [ime], [Prezime], [Adresa], [idSeminara] FROM [Predbiljezba] WHERE ([idSeminara] = @idSeminara)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSeminari" Name="idSeminara" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <asp:Panel ID="Panel1" runat="server">
        <p>
            <asp:Button ID="btnPrihvati" runat="server" onclick="btnPrihvati_Click" 
                Text="Prihvati" />
            &nbsp;&nbsp;
            <asp:Button ID="btnOdbaci" runat="server" Text="Izbriši predbilježbu" 
                onclick="btnOdbaci_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnOdustani" runat="server" Text="Odustani" 
                onclick="btnOdustani_Click" />
        </p>
        <p>
            Ime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtIme" runat="server"></asp:TextBox>
        </p>
        <p>
            Prezime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="txtPrezime" runat="server" ></asp:TextBox>
        </p>
        <p>
            Adresa:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="txtAdresa" runat="server"></asp:TextBox>
        </p>
        <p>
            IDSeminara:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSeminar" runat="server"></asp:TextBox>
        </p>
        <p>
            Broj predbilježbe:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPredbiljezba" runat="server"></asp:TextBox>
        </p>
    </asp:Panel>
</asp:Content>


<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Predbiljezba.aspx.cs" Inherits="Predbiljezba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: xx-large;
        background-color: #FF6600;
            text-align: center;
        }
        .style8
        {
            font-size: xx-large;
        }
        .style9
        {
            text-align: center;
        }
        .style10
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style9">
        <span class="style7">Predbilježite se</span></p>
<p style="margin-left: 40px">
    <span class="style8">Pretraga:</span>&nbsp;
    <asp:TextBox ID="txtPretrazi" runat="server" Width="168px" Height="28px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnPretrazi" runat="server" Text="Pretraži" Width="110px" 
        Height="31px" onclick="btnPretrazi_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
        style="font-size: x-large">Prijavi se</asp:LinkButton>
</p>
    <asp:Panel ID="Panel1" runat="server">
    <hr />
        Predbiljezba za seminar:
        <asp:Label ID="lblSeminar" runat="server" Font-Bold="True" ForeColor="#3366FF"></asp:Label>
        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtOdabir" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
        <br />
        Ime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtIme" runat="server"></asp:TextBox>
        <br />
        Prezime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPrezime" runat="server"></asp:TextBox>
        <br />
        Adresa:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtAdresa" runat="server"></asp:TextBox>
        <br />
        <asp:LinkButton ID="lbPosalji" runat="server" onclick="lbPosalji_Click">Pošalji predbilježbu</asp:LinkButton>
        <br />
        <hr />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <asp:Label ID="lblText" runat="server" ForeColor="Red" Text="Label"></asp:Label>
        <p>
            <asp:GridView ID="gvSeminari" runat="server"  
                Font-Size="10pt" Cellpadding="4"
            HeaderStyle-BackColor="#444444"
            HeaderStyle-ForeColor="White"
                AlternatingRowStyle-BackColor="#dddddd" Font-Names="Verdana" 
        onselectedindexchanged="gvSeminari_SelectedIndexChanged" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775">
                </AlternatingRowStyle>
                <Columns>
                    <asp:ButtonField CommandName="Select" Text="Odaberi" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True">
                </HeaderStyle>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </p>
    </asp:Panel>
    <p>
    </p>
    <asp:Panel ID="Panel3" runat="server">
        <span class="style10">Rezultati pretrage<br /> </span>
        <asp:GridView ID="gvPretraga" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="gvPretraga_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:ButtonField CommandName="Select" Text="Odaberi" />
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
    </asp:Panel>
    </asp:Content>



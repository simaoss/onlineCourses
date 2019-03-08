<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Prijava.aspx.cs" Inherits="Prijava" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style7
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: xx-large;
        background-color: #FFFFFF;
    }
        .style8
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
            background-color: #FF6600;
        }
        .style9
        {
            width: 152px;
        }
        .style10
        {
            text-align: center;
        }
        .style11
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style10">
        <span class="style7">
        </span><span class="style8">Prijava</span></p>
 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Panel ID="Panel1" runat="server">
        <span class="style11">Dobrodošli,</span>
        <asp:Label ID="lblIme" runat="server" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="Blue"></asp:Label>
        <br />
        <br />
        Stranice koje možete posjećivati:<br />
        <asp:LinkButton ID="lbSeminari" runat="server" Font-Size="Large" 
            onclick="lbSeminari_Click">Seminari</asp:LinkButton>
        <br />
        <asp:LinkButton ID="lbPredbiljezbe" runat="server" Font-Size="Large" 
            onclick="lbPredbiljezbe_Click">Predbiljezbe</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <table class="style1">
            <tr>
                <td class="style9">
                    Korisničko ime:</td>
                <td>
                    <asp:TextBox ID="txtKorisnickoIme" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtKorisnickoIme" 
                        ErrorMessage="Niste unijeli korisničko ime!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Lozinka</td>
                <td>
                    <asp:TextBox ID="txtLozinka" TextMode="password" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtLozinka" ErrorMessage="Niste unijeli lozinku!" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnPrijava" runat="server" onclick="btnPrijava_Click" 
        Text="Prijava" />
    </asp:Panel>
    
</asp:Content>


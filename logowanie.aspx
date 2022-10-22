<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logowanie.aspx.cs" Inherits="Projekt_SIwZP.logowanie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Formualrz logowania</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <div id="topbar">
                    <span id="powitanie">Witaj, na stronie firmowej EcoFood.</span>
                    <span id="zalogowano">Zalogowano jako ####.</span>
            </div>
            <div id="header">
                <p>Logo EcoFood</p>
            </div>
            <div id="menu">
                <a href="default.aspx">Strona główna</a>
                <a href="logowanie.aspx">Logowanie</a>
                <a href="kontakt.aspx">Kontakt</a>
                <a href="przedstawiciele.aspx">Nasi przedstawiciele</a>
                <a href="informacje.aspx">Informacje</a>
            </div>
            <div id="content">

                <asp:Label ID="Label3" runat="server" Text="Logowanie zrobione za pomocą sesji natomiast nie zostało dokończone. Aby przenieść się do strony pozalogowaniu.aspx button poniżej."></asp:Label><br />
                <asp:Button ID="Button2" runat="server" Text="Zaloguj (przeniesienie do strony po zalogowaniu)" Height="70px" OnClick="Button2_Click" Width="528px" />



                <asp:Panel ID="Panel1" runat="server">

                    <asp:Label ID="Label1" runat="server" Text="Login: "></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label2" runat="server" Text="Hasło: "></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" type="password"></asp:TextBox>
                    <br />

                    <asp:Button ID="Button1" runat="server" Text="Zaloguj" OnClick="Button1_Click" /><br />

                    <asp:Label ID="Error1" runat="server" Text="Podaj wszystkie dane aby się zalogować!" Visible="false"></asp:Label>

                </asp:Panel>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [uzytkownicy]"></asp:SqlDataSource>

            </div>
            
            <div id="footer">
                
                Stopka, stopka, stopka <asp:Label ID="ktozalogowany" runat="server" Text="Zalogowany"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

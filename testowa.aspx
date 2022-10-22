<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testowa.aspx.cs" Inherits="Projekt_SIwZP.testowa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Testowa</title>
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
                <a href="wspolprace.aspx">Nasze współprace</a>
            </div>
            <div id="content">
                



                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>






            </div>
            <div id="footer">
                Stopka, stopka, stopka
            </div>
        </div>
    </form>
</body>
</html>

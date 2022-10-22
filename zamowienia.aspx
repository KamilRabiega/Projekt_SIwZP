<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zamowienia.aspx.cs" Inherits="Projekt_SIwZP.zamowienia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Zamówienia</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:SqlDataSource ID="SqlZamowienia" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT firma.Nazwa AS [Nazwa firmy], towary.Nazwa_towaru AS [Nazwa towaru], zamowienia.Data_zamowienia AS [Data zamówienia], DATENAME(MONTH, zamowienia.Data_zamowienia) AS Miesiąc, zamowienia.Ilosc AS [Zamówiona ilość], SUM(towary.Cena * zamowienia.Ilosc) AS [Koszt całkowity], towary.Cena AS [Cena (szt.)] FROM zamowienia INNER JOIN towary ON zamowienia.Id_towaru = towary.Id_towaru INNER JOIN firma ON zamowienia.Id_firmy = firma.Id_firmy GROUP BY towary.Nazwa_towaru, zamowienia.Data_zamowienia, firma.Nazwa, zamowienia.Ilosc, towary.Cena ORDER BY zamowienia.Data_zamowienia"></asp:SqlDataSource>

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
                <a href="firmy.aspx">Współprace</a>
                <a href="spotkania.aspx">Spotkania</a>
                <a href="potencjalni.aspx">Potencjalni klienci</a>
                <a href="towary.aspx">Nasze towary</a>
                <a href="zamowienia.aspx">Zamówienia</a>
                <a href="obroty.aspx">Obroty</a>
                <a href="wyloguj.aspx">Wyloguj</a>
            </div>
            <div id="content">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlZamowienia" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Nazwa firmy" HeaderText="Nazwa firmy" SortExpression="Nazwa firmy" />
                        <asp:BoundField DataField="Nazwa towaru" HeaderText="Nazwa towaru" SortExpression="Nazwa towaru" />
                        <asp:BoundField DataField="Data zamówienia" HeaderText="Data zamówienia" SortExpression="Data zamówienia" />
                        <asp:BoundField DataField="Miesiąc" HeaderText="Miesiąc" ReadOnly="True" SortExpression="Miesiąc" />
                        <asp:BoundField DataField="Zamówiona ilość" HeaderText="Zamówiona ilość" SortExpression="Zamówiona ilość" />
                        <asp:BoundField DataField="Koszt całkowity" HeaderText="Koszt całkowity" ReadOnly="True" SortExpression="Koszt całkowity" />
                        <asp:BoundField DataField="Cena (szt.)" HeaderText="Cena (szt.)" SortExpression="Cena (szt.)" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:Button ID="Button1" runat="server" Text="Dodaj zamówienie" Height="36px" Width="210px" />

            </div>
            <div id="footer">
                Stopka, stopka, stopka
            </div>
        </div>
    </form>
</body>
</html>

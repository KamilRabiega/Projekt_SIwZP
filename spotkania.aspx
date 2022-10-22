<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spotkania.aspx.cs" Inherits="Projekt_SIwZP.spotkania" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Spotkania</title>
<link rel="stylesheet" href="style.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:SqlDataSource ID="SqlPonanski" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        uzytkownicy.Imie, uzytkownicy.Naziwsko, firma.Nazwa, decyzyjna.Imie AS Expr1, decyzyjna.Nazwisko, spotkania.Data_spotkania, spotkania.Efekty_spotkania, spotkania.Umowa
FROM            firma INNER JOIN
                         decyzyjna ON firma.Id_firmy = decyzyjna.Id_firmy INNER JOIN
                         spotkania ON decyzyjna.Id_decyzyjna = spotkania.Id_decyzyjna INNER JOIN
                         uzytkownicy ON spotkania.Id_pracownika = uzytkownicy.Id_pracownika
WHERE uzytkownicy.Naziwsko LIKE 'Poznanski'">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlSzczecinski" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        uzytkownicy.Imie, uzytkownicy.Naziwsko, firma.Nazwa, decyzyjna.Imie AS Expr1, decyzyjna.Nazwisko, spotkania.Data_spotkania, spotkania.Efekty_spotkania, spotkania.Umowa
FROM            firma INNER JOIN
                         decyzyjna ON firma.Id_firmy = decyzyjna.Id_firmy INNER JOIN
                         spotkania ON decyzyjna.Id_decyzyjna = spotkania.Id_decyzyjna INNER JOIN
                         uzytkownicy ON spotkania.Id_pracownika = uzytkownicy.Id_pracownika
WHERE uzytkownicy.Naziwsko LIKE 'Szczecinski'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlWroclawski" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        uzytkownicy.Imie, uzytkownicy.Naziwsko, firma.Nazwa, decyzyjna.Imie AS Expr1, decyzyjna.Nazwisko, spotkania.Data_spotkania, spotkania.Efekty_spotkania, spotkania.Umowa
FROM            firma INNER JOIN
                         decyzyjna ON firma.Id_firmy = decyzyjna.Id_firmy INNER JOIN
                         spotkania ON decyzyjna.Id_decyzyjna = spotkania.Id_decyzyjna INNER JOIN
                         uzytkownicy ON spotkania.Id_pracownika = uzytkownicy.Id_pracownika
WHERE uzytkownicy.Naziwsko LIKE 'Wroclawski'"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlWszystko" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT uzytkownicy.Imie, uzytkownicy.Naziwsko, firma.Nazwa, decyzyjna.Imie AS Expr1, decyzyjna.Nazwisko, spotkania.Data_spotkania, spotkania.Efekty_spotkania, spotkania.Umowa FROM firma INNER JOIN decyzyjna ON firma.Id_firmy = decyzyjna.Id_firmy INNER JOIN spotkania ON decyzyjna.Id_decyzyjna = spotkania.Id_decyzyjna INNER JOIN uzytkownicy ON spotkania.Id_pracownika = uzytkownicy.Id_pracownika"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlPrzedstawiciele" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id_pracownika, { fn CONCAT(Imie, Naziwsko) } AS [Imię i nazwisko przedstawiciela], Rola FROM uzytkownicy"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDecyzyjna" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id_decyzyjna, { fn CONCAT(Imie, Nazwisko) } AS [Imię i nazwisko osoby decyzyjnej] FROM decyzyjna"></asp:SqlDataSource>

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
                <h2>Spotkania wszystkich przedstawicieli</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlWszystko" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                        <asp:BoundField DataField="Naziwsko" HeaderText="Naziwsko" SortExpression="Naziwsko" />
                        <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                        <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                        <asp:BoundField DataField="Data_spotkania" HeaderText="Data_spotkania" SortExpression="Data_spotkania" />
                        <asp:BoundField DataField="Efekty_spotkania" HeaderText="Efekty_spotkania" SortExpression="Efekty_spotkania" />
                        <asp:CheckBoxField DataField="Umowa" HeaderText="Umowa" SortExpression="Umowa" />
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


                <asp:Button ID="Button4" runat="server" Text="Dodaj nowe spotkanie" Height="58px" OnClick="Button4_Click" Width="220px" />
                <asp:Panel ID="PanelNowe" runat="server" Visible="false">

                    <asp:Label ID="Label1" runat="server" Text="Data spotkania: "></asp:Label>
                    <asp:TextBox ID="datepicker" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label2" runat="server" Text="Efekty spotkania: "></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label3" runat="server" Text="Czy zawarto umowę?: "></asp:Label>
                    <asp:CheckBox ID="CheckBox1" runat="server" /><br />

                    <asp:Label ID="Label4" runat="server" Text="Przedstawiciel: "></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlPrzedstawiciele" DataTextField="Imię i nazwisko przedstawiciela" DataValueField="Id_pracownika">
                    </asp:DropDownList>
                    <br />

                    <asp:Label ID="Label5" runat="server" Text="Osoba decyzyjna: "></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDecyzyjna" DataTextField="Imię i nazwisko osoby decyzyjnej" DataValueField="Id_decyzyjna">
                    </asp:DropDownList>
                    <br />


                    <asp:Button ID="Button5" runat="server" Text="Dodaj spotkanie" OnClick="Button5_Click" /><asp:Button ID="Button6" runat="server" Text="Anuluj" OnClick="Button6_Click" /><br />
                    <asp:Label ID="LabelErrorDodawania" runat="server" Text="Label"></asp:Label>
                </asp:Panel>




                <h2>Ilość spotkań każdego z przedstawicieli</h2>

                <asp:Button ID="Button1" runat="server" Text="Spotkania Mateusza Poznanskiego" Height="50px" Width="250px" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Spotkania Radka Szczecinskiego" Height="50px" Width="250px" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Spotkania Bartka Wroclawskiego" Height="50px" Width="250px" OnClick="Button3_Click" />

                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <h3>Spotkania: Poznanski</h3>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlPonanski" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Naziwsko" HeaderText="Naziwsko" SortExpression="Naziwsko" />
                            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Data_spotkania" HeaderText="Data_spotkania" SortExpression="Data_spotkania" />
                            <asp:BoundField DataField="Efekty_spotkania" HeaderText="Efekty_spotkania" SortExpression="Efekty_spotkania" />
                            <asp:CheckBoxField DataField="Umowa" HeaderText="Umowa" SortExpression="Umowa" />
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
                </asp:Panel>

                <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <h3>Spotkania: Szczecinski</h3>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlSzczecinski" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Naziwsko" HeaderText="Naziwsko" SortExpression="Naziwsko" />
                            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Data_spotkania" HeaderText="Data_spotkania" SortExpression="Data_spotkania" />
                            <asp:BoundField DataField="Efekty_spotkania" HeaderText="Efekty_spotkania" SortExpression="Efekty_spotkania" />
                            <asp:CheckBoxField DataField="Umowa" HeaderText="Umowa" SortExpression="Umowa" />
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
                </asp:Panel>

                <asp:Panel ID="Panel3" runat="server" Visible="false">
                    <h3>Spotkania: Wroclawski</h3>
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlWroclawski" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                            <asp:BoundField DataField="Naziwsko" HeaderText="Naziwsko" SortExpression="Naziwsko" />
                            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                            <asp:BoundField DataField="Data_spotkania" HeaderText="Data_spotkania" SortExpression="Data_spotkania" />
                            <asp:BoundField DataField="Efekty_spotkania" HeaderText="Efekty_spotkania" SortExpression="Efekty_spotkania" />
                            <asp:CheckBoxField DataField="Umowa" HeaderText="Umowa" SortExpression="Umowa" />
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
                </asp:Panel>

            </div>
            <div id="footer">
                Stopka, stopka, stopka
            </div>
        </div>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="firmy.aspx.cs" Inherits="Projekt_SIwZP.firmy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Współprace</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [firma] WHERE [Id_firmy] = @Id_firmy" InsertCommand="INSERT INTO [firma] ([Nazwa], [Miejscowosc], [Kod_pocztowy]) VALUES (@Nazwa, @Miejscowosc, @Kod_pocztowy)" SelectCommand="SELECT * FROM [firma]" UpdateCommand="UPDATE [firma] SET [Nazwa] = @Nazwa, [Miejscowosc] = @Miejscowosc, [Kod_pocztowy] = @Kod_pocztowy WHERE [Id_firmy] = @Id_firmy">
            <DeleteParameters>
                <asp:Parameter Name="Id_firmy" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="Miejscowosc" Type="String" />
                <asp:Parameter Name="Kod_pocztowy" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="Miejscowosc" Type="String" />
                <asp:Parameter Name="Kod_pocztowy" Type="String" />
                <asp:Parameter Name="Id_firmy" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
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
                <h2>Firmy,  którymi współpracujemy</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_firmy" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id_firmy" HeaderText="Id_firmy" InsertVisible="False" ReadOnly="True" SortExpression="Id_firmy" />
                        <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                        <asp:BoundField DataField="Miejscowosc" HeaderText="Miejscowosc" SortExpression="Miejscowosc" />
                        <asp:BoundField DataField="Kod_pocztowy" HeaderText="Kod_pocztowy" SortExpression="Kod_pocztowy" />
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

                <asp:Button ID="Button1" runat="server" Text="Dodaj współpracę z firma" Height="46px" Width="231px" />

            </div>
            <div id="footer">
                Stopka, stopka, stopka
            </div>
        </div>
    </form>
</body>
</html>

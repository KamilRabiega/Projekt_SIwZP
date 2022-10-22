<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="towary.aspx.cs" Inherits="Projekt_SIwZP.towary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Nasze towary</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [towary] WHERE [Id] = @Id" InsertCommand="INSERT INTO [towary] ([Nazwa_towaru], [Cena], [Ilosc]) VALUES (@Nazwa_towaru, @Cena, @Ilosc)" SelectCommand="SELECT * FROM [towary]" UpdateCommand="UPDATE [towary] SET [Nazwa_towaru] = @Nazwa_towaru, [Cena] = @Cena, [Ilosc] = @Ilosc WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nazwa_towaru" Type="String" />
                <asp:Parameter Name="Cena" Type="Int32" />
                <asp:Parameter Name="Ilosc" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nazwa_towaru" Type="String" />
                <asp:Parameter Name="Cena" Type="Int32" />
                <asp:Parameter Name="Ilosc" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
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
                <h2>Towary, które mamy w ofercie</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_towaru" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id_towaru" HeaderText="Id_towaru" InsertVisible="False" ReadOnly="True" SortExpression="Id_towaru" />
                        <asp:BoundField DataField="Nazwa_towaru" HeaderText="Nazwa_towaru" SortExpression="Nazwa_towaru" />
                        <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                        <asp:BoundField DataField="Stan" HeaderText="Stan" SortExpression="Stan" />
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

                <asp:Button ID="Button1" runat="server" Text="Dodaj produkty" Height="35px" OnClick="Button1_Click" Width="189px" />

                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <asp:Label ID="Label1" runat="server" Text="Wprowadź nazwę produktu: "></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label2" runat="server" Text="Wprowadź cenę produktu: "></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label3" runat="server" Text="Wprowadź ilość: "></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />

                    <asp:Button ID="Button2" runat="server" Text="Dodaj produkt" OnClick="Button2_Click" /><asp:Button ID="Button3" runat="server" Text="Anuluj" OnClick="Button3_Click" /><br />
                    <asp:Label ID="LabelError" runat="server" Text="Label"></asp:Label>


                </asp:Panel>

            </div>
            <div id="footer">
                Stopka, stopka, stopka
            </div>
        </div>
    </form>
</body>
</html>

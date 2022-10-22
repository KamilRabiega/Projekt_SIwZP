<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="potencjalni.aspx.cs" Inherits="Projekt_SIwZP.potencjalni" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Potencjalni klienci</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [potencjalni] WHERE [Id_potencjalni] = @Id_potencjalni" InsertCommand="INSERT INTO [potencjalni] ([Nazwa], [Miejscowosc], [Kod_pocztowy], [Telefon], [Email]) VALUES (@Nazwa, @Miejscowosc, @Kod_pocztowy, @Telefon, @Email)" SelectCommand="SELECT Id_potencjalni AS ID, Nazwa AS [Nazwa Sklepu], Miejscowosc AS Miejscowość, Kod_pocztowy AS [Kod pocztowy], Telefon, Email, Informacje, CzyKontakt AS [Czy nawiązano kontakt], CzyChetni AS [Czy fima jest zainteresowana współpracą?] FROM [potencjalni]" UpdateCommand="UPDATE [potencjalni] SET [Nazwa] = @Nazwa, [Miejscowosc] = @Miejscowosc, [Kod_pocztowy] = @Kod_pocztowy, [Telefon] = @Telefon, [Email] = @Email, [CzyKontakt] = @CzyKontakt, [CzyChetni] = @CzyChetni WHERE [Id_potencjalni] = @Id_potencjalni">
            <DeleteParameters>
                <asp:Parameter Name="Id_potencjalni" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="Miejscowosc" Type="String" />
                <asp:Parameter Name="Kod_pocztowy" Type="String" />
                <asp:Parameter Name="Telefon" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CzyKontakt" Type="Boolean"/>
                <asp:Parameter Name="CzyChetni" Type="Boolean"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="Miejscowosc" Type="String" />
                <asp:Parameter Name="Kod_pocztowy" Type="String" />
                <asp:Parameter Name="Telefon" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CzyKontakt" Type="Boolean"/>
                <asp:Parameter Name="CzyChetni" Type="Boolean"/>
                <asp:Parameter Name="Id_potencjalni" Type="Int32" />
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
                <h2>Potencjalni klienci</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Nazwa Sklepu" HeaderText="Nazwa Sklepu" SortExpression="Nazwa Sklepu" />
                        <asp:BoundField DataField="Miejscowość" HeaderText="Miejscowość" SortExpression="Miejscowość" />
                        <asp:BoundField DataField="Kod pocztowy" HeaderText="Kod pocztowy" SortExpression="Kod pocztowy" />
                        <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Informacje" HeaderText="Informacje" SortExpression="Informacje" />
                        <asp:CheckBoxField DataField="Czy nawiązano kontakt" HeaderText="Czy nawiązano kontakt" SortExpression="Czy nawiązano kontakt" />
                        <asp:CheckBoxField DataField="Czy fima jest zainteresowana współpracą?" HeaderText="Czy fima jest zainteresowana współpracą?" SortExpression="Czy fima jest zainteresowana współpracą?" />
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

                <asp:Button ID="Button1" runat="server" Text="Dodaj potencjalnego klienta" OnClick="Button1_Click" Height="55px" Width="280px" /><br /><br />

                <asp:Panel ID="Panel1" runat="server" Visible="false">

                    <asp:Label ID="Label1" runat="server" Text="Nazwa sklepu: "></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label2" runat="server" Text="Miejscowość: "></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label3" runat="server" Text="Kod pocztowy: "></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label4" runat="server" Text="Telefon: "></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label5" runat="server" Text="Email: "></asp:Label>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label6" runat="server" Text="Informacje: "></asp:Label>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><br />

                    <asp:Label ID="Label7" runat="server" Text="Czy nawiązano kontakt?: "></asp:Label>
                    <asp:CheckBox ID="CheckBox1" runat="server" /><br />

                    <asp:Label ID="Label8" runat="server" Text="Czy firma jest zainteresowana współpracą?: "></asp:Label>
                    <asp:CheckBox ID="CheckBox2" runat="server" /><br />


                    <asp:Button ID="Button2" runat="server" Text="Dodaj firmę" OnClick="Button2_Click" /><asp:Button ID="Button3" runat="server" Text="Anuluj" Width="92px" OnClick="Button3_Click" />


                    <br /><asp:Label ID="LabelError" runat="server" Text="Label" Visible="false"></asp:Label>


                </asp:Panel>





            </div>
            <div id="footer">
                Stopka, stopka, stopka
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master_end.Master" AutoEventWireup="true" CodeBehind="db_publication.aspx.cs" Inherits="StaffHao_SQLserver.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT DISTINCT [time] FROM [t_publication]"></asp:SqlDataSource>
        Select the publiction time:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="time" DataValueField="time">
    </asp:DropDownList>
        <br /><br />
        <span id="list">News List</span><hr />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT [id], [Pub_name], [time] FROM [t_publication] WHERE ([time] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="time" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
		<asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" CssClass="mGridView" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Pub_name" HeaderText="Publication name" SortExpression="Pub_name" />
                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
		<br /><br />
        <span id="manage">Manage News</span><hr />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" DeleteCommand="DELETE FROM [t_publication] WHERE [id] = ? AND (([publications] = ?) OR ([publications] IS NULL AND ? IS NULL)) AND (([time] = ?) OR ([time] IS NULL AND ? IS NULL)) AND (([Pub_name] = ?) OR ([Pub_name] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [t_publication] ([publications], [time], [Pub_name]) VALUES (?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT * FROM [t_publication] WHERE ([id] = ?)" UpdateCommand="UPDATE [t_publication] SET [publications] = ?, [time] = ?, [Pub_name] = ? WHERE [id] = ? AND (([publications] = ?) OR ([publications] IS NULL AND ? IS NULL)) AND (([time] = ?) OR ([time] IS NULL AND ? IS NULL)) AND (([Pub_name] = ?) OR ([Pub_name] IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_publications" Type="String" />
            <asp:Parameter Name="original_publications" Type="String" />
            <asp:Parameter Name="original_time" Type="String" />
            <asp:Parameter Name="original_time" Type="String" />
            <asp:Parameter Name="original_Pub_name" Type="String" />
            <asp:Parameter Name="original_Pub_name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="publications" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="Pub_name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="publications" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="Pub_name" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_publications" Type="String" />
            <asp:Parameter Name="original_publications" Type="String" />
            <asp:Parameter Name="original_time" Type="String" />
            <asp:Parameter Name="original_time" Type="String" />
            <asp:Parameter Name="original_Pub_name" Type="String" />
            <asp:Parameter Name="original_Pub_name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" CssClass="mDetailView" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource3" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Pub_name" HeaderText="Name" SortExpression="Pub_name" />
            <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
            <asp:BoundField DataField="publications" HeaderText="publications" SortExpression="publications" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
</asp:Content>

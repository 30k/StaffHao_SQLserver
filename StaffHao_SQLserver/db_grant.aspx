<%@ Page Title="" Language="C#" MasterPageFile="~/Master_end.Master" AutoEventWireup="true" CodeBehind="db_grant.aspx.cs" Inherits="StaffHao_SQLserver.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-holder-back">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT DISTINCT [G_cate] FROM [t_grant]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT * FROM [t_grant] WHERE ([G_cate] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" Name="G_cate" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="G_cate" DataValueField="G_cate">
        </asp:RadioButtonList>
        <br />
        <br />
        <span id="list">News List</span><hr />
        <asp:GridView ID="GridView1" runat="server" CssClass="mGridView" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="G_name" HeaderText="G_name" SortExpression="G_name" />
                <asp:BoundField DataField="G_cate" HeaderText="G_cate" SortExpression="G_cate" />
                <asp:BoundField DataField="G_amount" HeaderText="G_amount" SortExpression="G_amount" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <br />
        <br />
        <span id="manage">Manage News</span><hr />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" DeleteCommand="DELETE FROM [t_grant] WHERE [id] = ?" InsertCommand="INSERT INTO [t_grant] ([G_desc], [G_cate], [G_name], [G_amount]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT * FROM [t_grant] WHERE ([id] = ?)" UpdateCommand="UPDATE [t_grant] SET [G_desc] = ?, [G_cate] = ?, [G_name] = ?, [G_amount] = ? WHERE [id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="G_desc" Type="String" />
                <asp:Parameter Name="G_cate" Type="String" />
                <asp:Parameter Name="G_name" Type="String" />
                <asp:Parameter Name="G_amount" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="G_desc" Type="String" />
                <asp:Parameter Name="G_cate" Type="String" />
                <asp:Parameter Name="G_name" Type="String" />
                <asp:Parameter Name="G_amount" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" CssClass="mDetailView" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource3" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" >
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="G_desc" HeaderText="G_desc" SortExpression="G_desc" />
                <asp:BoundField DataField="G_cate" HeaderText="G_cate" SortExpression="G_cate" />
                <asp:BoundField DataField="G_name" HeaderText="G_name" SortExpression="G_name" />
                <asp:BoundField DataField="G_amount" HeaderText="G_amount" SortExpression="G_amount" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
    </div>
</asp:Content>

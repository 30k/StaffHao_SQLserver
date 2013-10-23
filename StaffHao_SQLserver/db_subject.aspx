<%@ Page Title="" Language="C#" MasterPageFile="~/Master_end.Master" AutoEventWireup="true" CodeBehind="db_subject.aspx.cs" Inherits="StaffHao_SQLserver.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-holder-back">


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT DISTINCT [Sub_time] FROM [t_subject]"></asp:SqlDataSource>
        Select the subject time:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Sub_time" DataValueField="Sub_time">
        </asp:DropDownList>
        <br /><br />
        <span id="list">Subject List</span>
        <hr />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT * FROM [t_subject] WHERE ([Sub_time] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Sub_time" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" 
             EnableModelValidation="True" CssClass="mGridView" CellPadding="4" 
             ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Sub_ID" HeaderText="Subject ID" SortExpression="Sub_ID" />
                <asp:BoundField DataField="Sub_name" HeaderText="Subject name" SortExpression="Sub_name" />
                <asp:BoundField DataField="Sub_time" HeaderText="Subject time" SortExpression="Sub_time" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <br /><br />
        <span id="manage">Subject Manage<br />
        </span>
        <hr />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringHAO %>" DeleteCommand="DELETE FROM [t_subject] WHERE [id] = ?" InsertCommand="INSERT INTO [t_subject] ([Sub_time], [Sub_name], [Sub_desc], [Sub_link], [Sub_ID]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionStringHAO.ProviderName %>" SelectCommand="SELECT * FROM [t_subject] WHERE ([id] = ?)" UpdateCommand="UPDATE [t_subject] SET [Sub_time] = ?, [Sub_name] = ?, [Sub_desc] = ?, [Sub_link] = ?, [Sub_ID] = ? WHERE [id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Sub_time" Type="String" />
                <asp:Parameter Name="Sub_name" Type="String" />
                <asp:Parameter Name="Sub_desc" Type="String" />
                <asp:Parameter Name="Sub_link" Type="String" />
                <asp:Parameter Name="Sub_ID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sub_time" Type="String" />
                <asp:Parameter Name="Sub_name" Type="String" />
                <asp:Parameter Name="Sub_desc" Type="String" />
                <asp:Parameter Name="Sub_link" Type="String" />
                <asp:Parameter Name="Sub_ID" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
             CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource3" 
             EnableModelValidation="True" ForeColor="#333333" GridLines="None"
             CssClass="mDetailView" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Sub_time" HeaderText="Sub_time" SortExpression="Sub_time" />
                <asp:BoundField DataField="Sub_name" HeaderText="Sub_name" SortExpression="Sub_name" />
                <asp:BoundField DataField="Sub_desc" HeaderText="Sub_desc" SortExpression="Sub_desc" />
                <asp:BoundField DataField="Sub_link" HeaderText="Sub_link" SortExpression="Sub_link" />
                <asp:BoundField DataField="Sub_ID" HeaderText="Sub_ID" SortExpression="Sub_ID" />
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

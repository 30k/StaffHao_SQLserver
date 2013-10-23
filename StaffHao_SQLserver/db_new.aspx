<%@ Page Title="" Language="C#" MasterPageFile="~/Master_end.Master" AutoEventWireup="true" CodeBehind="db_new.aspx.cs" Inherits="StaffHao_SQLserver.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-holder-back">

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/db_hao.mdb" SelectCommand="SELECT DISTINCT [New_time] FROM [t_new]"></asp:AccessDataSource>
        Select the News by time: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource1" 
             DataTextField="New_time" DataValueField="New_time" AutoPostBack="True">
        </asp:DropDownList>
          &nbsp;&nbsp;
                
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/db_hao.mdb" SelectCommand="SELECT * FROM [t_new] WHERE ([New_time] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="New_time" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br /><br />
        <span id="list">News List</span><hr />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
             DataSourceID="AccessDataSource2" EnableModelValidation="True" 
             CssClass="mGridView" AutoGenerateColumns="False"
             DataKeyNames="id" BackColor="White" BorderColor="#CC9966" 
             BorderStyle="None" BorderWidth="1px" CellPadding="4"
             PageSize="5">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="New_name" HeaderText="New name" SortExpression="New_name" />
                <asp:BoundField DataField="New_time" HeaderText="New time" SortExpression="New_time" />
                <asp:BoundField DataField="New_desc" HeaderText="Details" SortExpression="New_desc" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        </asp:GridView>

        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/db_hao.mdb" DeleteCommand="DELETE FROM [t_new] WHERE [id] = ?" InsertCommand="INSERT INTO [t_new] ([New_name], [New_time], [New_desc]) VALUES (?, ?, ?)" SelectCommand="SELECT * FROM [t_new] WHERE ([id] = ?)" UpdateCommand="UPDATE [t_new] SET [New_name] = ?, [New_time] = ?, [New_desc] = ? WHERE [id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="New_name" Type="String" />
                <asp:Parameter Name="New_time" Type="String" />
                <asp:Parameter Name="New_desc" Type="String" />

            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="New_name" Type="String" />
                <asp:Parameter Name="New_time" Type="String" />
                <asp:Parameter Name="New_desc" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <br /><br />
        <span id="manage">Manage News</span><hr />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
             DataKeyNames="id" DataSourceID="AccessDataSource3" EnableModelValidation="True" 
             CssClass="mDetailView" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="New_name" HeaderText="New name" SortExpression="New_name" />
                <asp:BoundField DataField="New_time" HeaderText="New time" SortExpression="New_time" />
                <asp:BoundField DataField="New_desc" HeaderText="Details" SortExpression="New_desc" />
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

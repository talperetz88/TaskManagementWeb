<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addTaskToWorker.aspx.cs" Inherits="addTaskToWorker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="he">
<head runat="server">
    <title>הוספת מטלה לעובד</title>
    <link rel="stylesheet" href="CSS/formAdding.css"/>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div class="panel">
        <fieldset>
    <div><h2>הוספת מטלה לעובד</h2></div>        
       
        <div style="padding:15px 25px 10px">
            <div><h3>שם עובד</h3></div>
        <asp:DropDownList ID="Dr1" runat="server" CssClass="input" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>" SelectCommand="SELECT [Name] FROM [Table1] WHERE ([Email] = @Email)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Email" QueryStringField="Email" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="padding:15px 25px 10px">
            <div><h3>שם המטלה</h3></div>
        <asp:DropDownList ID="Dr2" runat="server" CssClass="input" DataSourceID="SqlDataSource2" DataTextField="Task" DataValueField="Task">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>" SelectCommand="SELECT [Task] FROM [Tasks]"></asp:SqlDataSource>
       </div>
    <div style="padding:25px">
        <div><h3>תיאור המטלה</h3></div>
        <asp:TextBox ID="TextBox1" CssClass="input" runat="server"></asp:TextBox>
    </div>
    
    <div>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" style="padding:10px" Width="100%" OnClick="Button1_Click" Text="שליחה" />
        </div>
        </fieldset>
        </div>
    </form>
</body>
</html>

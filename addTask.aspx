<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addTask.aspx.cs" Inherits="addTask" %>

<!DOCTYPE html>

<html lang="he">
<head runat="server">
    <meta charset="utf-8" />
    <title>הוספת מטלה חדשה</title>
    <link rel="stylesheet" href="CSS/formAdding.css"/> 
</head>


<body dir="rtl">
    <form id="form1" runat="server">
        
        <div class="panel">
            <fieldset>
        <div ><h2>הוספת מטלה חדשה</h2></div>
        <div style="padding:25px 25px 10px">
            <h4 style="padding:0px 0px 2px">שם המטלה</h4>
            <asp:TextBox ID="taskTextBox1" class=input runat="server"></asp:TextBox>
        </div>
        <div style="padding:25px">
            <h4 style="padding:0px 0px 2px">שם המחלקה</h4>
            <asp:DropDownList ID="depDrop" class=input runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">Management</asp:ListItem>
                <asp:ListItem Value="1">Kitchen</asp:ListItem>
                <asp:ListItem Value="2">Bar</asp:ListItem>
                <asp:ListItem Value="3">Maintenance</asp:ListItem>
              
            </asp:DropDownList>

        </div>
        <div>

            <asp:Button ID="Button1" runat="server"  CssClass="btn btn-info" style="padding:10px" Width="100%" Text="שליחה" OnClick="Button1_Click" />

        </div>

</fieldset>
   </div>
              
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addWorker.aspx.cs" Inherits="addWorker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="he">
<head runat="server">
    <title>הוספת עובד חדש</title>
    <link rel="stylesheet" href="CSS/formAdding.css"/>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div class="panel">
    <fieldset>
        <div ><h2>הוספת עובד חדש</h2></div>
        <div style="padding:15px 25px 10px">
         <h4 style="padding:0px 0px 2px">שם פרטי</h4>
            <asp:TextBox ID="firstNameText" CssClass="input" runat="server"></asp:TextBox>
        </div>
         <div style="padding:15px 25px 10px">
         <h4 style="padding:0px 0px 2px">שם משפחה</h4>
             <asp:TextBox ID="lastNameText" CssClass="input" runat="server"></asp:TextBox>
        </div>

         <div style="padding:15px 25px 10px">
         <h4 style="padding:0px 0px 2px">דואר אלקטרוני</h4>
             <asp:TextBox ID="emailText" CssClass="input" runat="server"></asp:TextBox>
        </div>

         <div style="padding:15px 25px 10px">
         <h4 style="padding:0px 0px 2px">סיסמא</h4>
             <asp:TextBox ID="passwordText" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>
        </div>

         <div style="padding:15px 25px 10px">
         <h4 style="padding:0px 0px 2px">שם מחלקה</h4>
             <asp:DropDownList ID="DepDrop" CssClass="input" runat="server">
                 <asp:ListItem Value="0">Management</asp:ListItem>
                <asp:ListItem Value="1">Kitchen</asp:ListItem>
                <asp:ListItem Value="2">Bar</asp:ListItem>
                <asp:ListItem Value="3">Maintenance</asp:ListItem>
             </asp:DropDownList>
         </div>

         <div style="padding:15px 25px 10px">
         <h4 style="padding:0px 0px 2px">תפקיד</h4>
             <asp:DropDownList ID="RoleDrop" CssClass="input" runat="server">
                 <asp:ListItem Value="0">Management</asp:ListItem>
                 <asp:ListItem Value="1">Cook</asp:ListItem>
                 <asp:ListItem Value="2">Bartender</asp:ListItem>
                 <asp:ListItem Value="3">Washing dishes</asp:ListItem>
                 <asp:ListItem Value="4">Handyman</asp:ListItem>
             </asp:DropDownList>
        </div>
        <div>
            <asp:Button ID="sendbtn" runat="server" Text="שליחה" OnClick="sendbtn_click" />
        </div>
    </fieldset>
    </div>
    </form>
</body>
</html>

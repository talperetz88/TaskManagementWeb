<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="he">
<head runat="server" >
    <title>התחבר</title>
    <link rel="stylesheet" href="CSS/LoginStyle.css"/>    
</head>
<script src="Scripts/jquery-1.10.2.min.js"></script>
<script src="Scripts/jquery-1.9.1.intellisense.js"></script>
<script src="Scripts/jquery-1.9.1.js"></script>
<script src="Scripts/jquery-1.9.1.min.js"></script>
<body dir="rtl">
   
        <form id="form1" runat="server">
                      <div class="panel">
                            <fieldset>
                                    <h2>מערכת לניהול משימות</h2>
                                    <h4>ברוך הבא!</h4>
                                    <h4>התחבר</h4>
                                    <asp:TextBox CssClass="input" class="input" ID="txtusername" placeholder="הכנס שם משתמש" runat="server"></asp:TextBox>
                                     
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="הכנס שם משתמש"></asp:RequiredFieldValidator> 
                                
                                    <asp:TextBox CssClass="input" class="input" ID="txtpassword" runat="server" placeholder="הכנס סיסמא" TextMode="Password"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="הכנס סיסמא"></asp:RequiredFieldValidator>
                                
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me"/>זכור אותי
                                    </label>
                                </div>
                                
                               <asp:Button ID="but" runat="server" CssClass="btn btn-info" Width="100%"  Text="התחבר" OnClick="login_but"/>
                            
                            </fieldset>
                          </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>    
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        </form>
</body>
</html>

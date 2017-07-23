<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tasks.aspx.cs" Inherits="tasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="he">
<head runat="server">
    <meta charset="utf-8" />
   <title>מעקב אחרי עובדים ומטלות</title>
    <link rel="stylesheet" href="CSS/taskCss.css"/> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
<script type="text/javascript"></script>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
       <div class="panel">
        <fieldset>
        <h2>מעקב אחרי עובדים ומטלות</h2>
            <div style="padding :7px">
            <asp:HyperLink ID="logout" runat="server" NavigateUrl="~/login.aspx" Font-Bold="True" Font-Size="Medium" ForeColor="Black">יציאה</asp:HyperLink>
        </div>
        <div style="width: 90%; margin-right: 5%; margin-left: 5%; text-align: center">
        <h4>רשימת עובדים</h4>
            <asp:GridView ID="GridView1" CssClass="table table-hover table-striped" Width="450px" HorizontalAlign="Center" AutoGenerateColumns="False" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" Height="249px" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="שם העובד" SortExpression="Name" />
                <asp:BoundField DataField="Department" HeaderText="שם המחקלה" SortExpression="Department" />
                <asp:BoundField DataField="Role" HeaderText="תפקיד העובד" SortExpression="Role" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>" SelectCommand="SELECT [Name], [Department], [Role] FROM [Table1]" ></asp:SqlDataSource>
        <br />
            </div>
        
        <div style="width: 90%; margin-right: 5%; margin-left: 5%; text-align: center">
            <h4>רשימת מטלות</h4>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>" SelectCommand="SELECT * FROM [Tasks]" OldValuesParameterFormatString="original_{0}">
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3"  leng="he" CssClass="table table-hover table-striped" Width="450px" HorizontalAlign="Center" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="מס" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Task" HeaderText="מטלה" SortExpression="Task" />
                    <asp:BoundField DataField="Department" HeaderText="מחלקה" SortExpression="Department" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

            <asp:Button ID="Button3" runat="server" Text="הוספה" Width="168px" OnClick="Button3_Click" />

        </div>
        <div style="width: 90%; margin-right: 5%; margin-left: 5%; text-align: center">
        <h4>רשימת מטלות לעובד</h4>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>"  OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT taskForWorker.WorkerName, taskForWorker.Task, taskForWorker.Description, taskForWorker.status FROM Table1 INNER JOIN taskForWorker ON Table1.Name = taskForWorker.WorkerName INNER JOIN Tasks ON Tasks.Task = taskForWorker.Task WHERE (Table1.Email = @Email)" 
                UpdateCommand="UPDATE taskForWorker SET status = @status FROM Table1 INNER JOIN taskForWorker ON Table1.Name = taskForWorker.WorkerName INNER JOIN Tasks ON Tasks.Task = taskForWorker.Task WHERE (Table1.Email = @Email) AND (taskForWorker.Task = @Task)" 
                DeleteCommand="DELETE FROM taskForWorker FROM Table1 INNER JOIN taskForWorker ON Table1.Name = taskForWorker.WorkerName INNER JOIN Tasks ON Tasks.Task = taskForWorker.Task WHERE (Table1.Email = @Email) AND (taskForWorker.[Task] = @original_Task)"
                InsertCommand="INSERT INTO [taskForWorker] ([WorkerName], [Task], [Description], [status]) VALUES (@WorkerName, @Task, @Description, @status)">
                <DeleteParameters>
                    <asp:Parameter  Name="original_Task" Type="String" />
                    <asp:QueryStringParameter Name="Email" QueryStringField="Email" />
                    
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="WorkerName" Type="String" />
                    <asp:Parameter Name="Task" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="status" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="Email" QueryStringField="Email" />
                </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="status" Type="String" />
                 <asp:QueryStringParameter Name="Email" QueryStringField="Email" />
                 
                 <asp:Parameter Name="Task" Type="String"/>
                 
             </UpdateParameters>
        </asp:SqlDataSource>
        <br />
            <asp:GridView ID="GridView4" CssClass="table table-hover table-striped" Width="450px" HorizontalAlign="Center" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="WorkerName" HeaderText="שם העובד" SortExpression="WorkerName" ReadOnly="True" />
                    <asp:BoundField DataField="Task" HeaderText="שם המטלה" SortExpression="Task" />
                    <asp:BoundField DataField="Description" HeaderText="תאור המטלה" SortExpression="Description" ReadOnly="True" />
                    <asp:BoundField DataField="status" HeaderText="סטטוס" SortExpression="status" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" CancelText="ביטול" DeleteText="מחיקה" EditText="עריכה" UpdateText="עדכון" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>"
                 DeleteCommand="DELETE FROM [taskForWorker] WHERE [Id] = @original_Id AND (([WorkerName] = @original_WorkerName) OR ([WorkerName] IS NULL AND @original_WorkerName IS NULL)) AND (([Task] = @original_Task) OR ([Task] IS NULL AND @original_Task IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL))" 
                 OldValuesParameterFormatString="original_{0}"
                 SelectCommand="SELECT * FROM [taskForWorker]" 
                UpdateCommand="UPDATE [taskForWorker] SET [WorkerName] = @WorkerName, [Task] = @Task, [Description] = @Description, [status] = @status WHERE [Id] = @original_Id AND (([WorkerName] = @original_WorkerName) OR ([WorkerName] IS NULL AND @original_WorkerName IS NULL)) AND (([Task] = @original_Task) OR ([Task] IS NULL AND @original_Task IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([status] = @original_status) OR ([status] IS NULL AND @original_status IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_WorkerName" Type="String" />
                    <asp:Parameter Name="original_Task" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_status" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="WorkerName" Type="String" />
                    <asp:Parameter Name="Task" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="WorkerName" Type="String" />
                    <asp:Parameter Name="Task" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="status" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_WorkerName" Type="String" />
                    <asp:Parameter Name="original_Task" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_status" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2" Text="הוספה" Width="168px" />
            <br />
        </div>
     </fieldset>
    </div>
    </form>
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>    
</body>
</html>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;

public partial class addTask : System.Web.UI.Page
{
    string var;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
               
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["loginConnectionString1"].ConnectionString);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO [Tasks]([Task],[Department]) VALUES('" + taskTextBox1.Text+"','"+ depDrop.SelectedItem.Text + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        if (Session["role"].ToString() == "Management")
        {
            String username = (String)Session["useremail"];
            string url1 = "~/tasksManagment.aspx?Email=" + username;
            Response.Redirect(url1);
        }
        else
        {
            String username = (String)Session["useremail"];
            string url1 = "~/tasks.aspx?Email=" + username;
            Response.Redirect(url1);

        }
    }

}
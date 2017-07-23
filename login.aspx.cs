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

public partial class login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["loginConnectionString1"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
       // string url = "~/HtmlPage2.html";
        //Response.Redirect(url);
    }

    protected void login_but(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["loginConnectionString1"].ConnectionString);
        con.Open();
        string checkUser = "SELECT count(*) FROM [Table1] WHERE Email='" + txtusername.Text + "'";
        SqlCommand com = new SqlCommand(checkUser, con);
        string temp = com.ExecuteScalar().ToString();
       
        con.Close();
        
        if (temp == "1")
        {
            Response.Write("password incorrect");
            con.Open();
            String checkPassword = "SELECT Password FROM [Table1] WHERE Email='" + txtusername.Text + "'";
            SqlCommand comm = new SqlCommand(checkPassword, con);
            string password = comm.ExecuteScalar().ToString().Replace(" ", "");
            con.Close();
            if (password == txtpassword.Text)
            {
                con.Open();
                String checkRole = "SELECT Role FROM [Table1] WHERE Email='" + txtusername.Text + "'";
                SqlCommand com1 = new SqlCommand(checkRole, con);
                string role = com1.ExecuteScalar().ToString().Replace(" ", "");
                con.Close();
                string str = "Management";
                if (role == "Management")
                {
                    Session["useremail"] = txtusername.Text;
                    Session["role"] = role;
                    string username = (String)Session["useremail"];
                    string url1 = "~/tasksManagment.aspx?Email=" + username;
                    Response.Redirect(url1);
                }
                else
                {
                    Session["useremail"] = txtusername.Text;
                    Session["role"] = role;
                    string username = (String)Session["useremail"];

                    string url = "~/tasks.aspx?Email=" + username;
                    Response.Redirect(url);
                } 

            }
            else
            {
                Response.Write("password incorrect");
            }
        }
    }


    
}
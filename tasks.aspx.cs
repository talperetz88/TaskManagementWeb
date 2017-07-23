using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tasks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
       
    }



    protected void Button1_Click2(object sender, EventArgs e)
    {
        String username = (String)Session["useremail"];
        string url1 = "~/addTaskToWorker.aspx?Email=" + username;
        Response.Redirect(url1);
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/addWorker.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        String username = (String)Session["useremail"];
        string url1 = "~/addTask.aspx?Email=" + username;
        Response.Redirect(url1);
       
    }

}
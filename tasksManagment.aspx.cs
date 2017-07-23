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



    protected void addTaskBtn_click(object sender, EventArgs e)
    {
        
        string username = (String)Session["useremail"];

        Response.Redirect("~/addTaskToWorkerManager.aspx?Email="+username);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string username = (String)Session["useremail"];
        Response.Redirect("~/addWorker.aspx?Email="+username);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/addTask.aspx");
    }
}
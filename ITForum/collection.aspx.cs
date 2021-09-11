using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class collection : System.Web.UI.Page
{
    protected DataRowCollection drsForumColl = null;
    protected DataRowCollection drsQuestionColl = null;
    protected DataRowCollection drsCodeColl = null;
    protected Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {

        //Session.Add("UserName", "41801");
        try
        {
            if (Session["UserName"] == null)
            {
                WebMessageBox.Show("请登录！", "Login.aspx");
            }
        }
        catch { }
        drsForumColl = operation.selectForumColl(Session["UserName"].ToString(), 3.ToString()).Tables[0].Rows;
        drsQuestionColl = operation.selectForumColl(Session["UserName"].ToString(), 2.ToString()).Tables[0].Rows;
        drsCodeColl = operation.selectForumColl(Session["UserName"].ToString(), 1.ToString()).Tables[0].Rows;
    }
}
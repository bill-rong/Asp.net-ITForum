using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchResult : System.Web.UI.Page
{
    protected DataRowCollection drsForumSearch = null;
    protected DataRowCollection drsQuestionSearch = null;
    protected DataRowCollection drsCodeSearch = null;
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
        drsForumSearch = operation.SearchResult(Request.QueryString["text"], "tb_forum").Tables[0].Rows;
        drsQuestionSearch = operation.SearchResult(Request.QueryString["text"], "tb_question").Tables[0].Rows;
        drsCodeSearch = operation.SearchResult(Request.QueryString["text"], "tb_code").Tables[0].Rows;
    }
}
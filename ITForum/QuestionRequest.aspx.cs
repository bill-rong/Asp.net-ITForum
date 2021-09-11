using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuestionRequest : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["UserName"] == null)
            {
                WebMessageBox.Show("请登录！", "Login.aspx");
            }
        }
        catch { }
        question_title.DataSource = operation.answerTitle(Request.QueryString["id"]);
        answer.DataSource = operation.questionAnswer(Request.QueryString["id"]);
        question_title.DataBind();
        answer.DataBind();
        if (operation.collectionState(Request.QueryString["id"], Session["UserName"].ToString(),2.ToString()).Tables["tb_collection"].Rows.Count > 0)
        {
            cbtn.Style["background-image"] = "url(../image/c.png)";
        }
        else
        {
            cbtn.Style["background-image"] = "url(../image/un-c.png)";
        }
    }

    protected void release_Click(object sender, EventArgs e)
    {
        operation.answerRelease(Request.QueryString["id"], Session["UserName"].ToString(), Request.Form["text"], DateTime.Now.ToLocalTime().ToString());
        Response.AddHeader("Refresh", "0");
    }



    protected void cbtn_Click(object sender, EventArgs e)
    {

        if (operation.collectionState(Request.QueryString["id"],Session["UserName"].ToString(),2.ToString()).Tables["tb_collection"].Rows.Count == 0){
            operation.addCollection(Session["UserName"].ToString(), Request.QueryString["id"],2.ToString());
            Response.Redirect(Request.Url.ToString());
        }
        else{
            operation.delCollection(Request.QueryString["id"], 2.ToString(), Session["UserName"].ToString());
            cbtn.Style["background-image"] = "url(../image/un-c.png)";
            Response.Redirect(Request.Url.ToString());
        }
    }
}
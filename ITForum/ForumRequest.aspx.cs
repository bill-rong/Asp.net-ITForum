using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForumRequest : System.Web.UI.Page
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
        forum_title.DataSource = operation.requestTitle(Request.QueryString["id"]);
        comment.DataSource = operation.forumAnswer(Request.QueryString["id"]);
        forum_title.DataBind();
        comment.DataBind();
        if (operation.collectionState(Request.QueryString["id"], Session["UserName"].ToString(), 3.ToString()).Tables["tb_collection"].Rows.Count > 0)
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
        operation.commentRelease(Session["UserName"].ToString(), Request.QueryString["id"], Request.Form["text"], DateTime.Now.ToLocalTime().ToString());
        Response.AddHeader("Refresh", "0");
    }



    protected void cbtn_Click(object sender, EventArgs e)
    {

        if (operation.collectionState(Request.QueryString["id"], Session["UserName"].ToString(), 3.ToString()).Tables["tb_collection"].Rows.Count == 0)
        {
            operation.addCollection(Session["UserName"].ToString(), Request.QueryString["id"], 3.ToString());
            Response.Redirect(Request.Url.ToString());
        }
        else
        {
            operation.delCollection(Request.QueryString["id"], 3.ToString(), Session["UserName"].ToString());
            Response.Redirect(Request.Url.ToString());
        }
    }
}
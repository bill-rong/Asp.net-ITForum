using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forum : System.Web.UI.Page
{
    Operation operation = new Operation();
    public static PagedDataSource ps = new PagedDataSource();

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
        if (!IsPostBack)
        {
            Bind(0);
        }
    }
    public void Bind(int CurrentPage)
    {
        ps.DataSource = operation.forumTitle().Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 8;
        ps.CurrentPageIndex = CurrentPage;
        this.forumList.DataSource = ps;
        this.forumList.DataKeyField = "id";
        this.forumList.DataBind();
    }
    protected void PageView(object sender, DataListItemEventArgs e)
    {
        Label CurrentPage = e.Item.FindControl("Lable1") as Label;
        Label PageCount = e.Item.FindControl("Lable2") as Label;
        LinkButton FirstPage = e.Item.FindControl("first") as LinkButton;
        LinkButton NextPage = e.Item.FindControl("next") as LinkButton;
        LinkButton PerviousPage = e.Item.FindControl("pervious") as LinkButton;
        LinkButton EndPage = e.Item.FindControl("end") as LinkButton;
        CurrentPage.Text = (ps.CurrentPageIndex + 1).ToString();
        PageCount.Text = ps.PageCount.ToString();
    }


    protected void first_Click(object sender, EventArgs e)
    {
        ps.CurrentPageIndex = 0;
        Bind(ps.CurrentPageIndex);
    }

    protected void end_Click(object sender, EventArgs e)
    {
        ps.CurrentPageIndex = ps.PageCount - 1;
        Bind(ps.CurrentPageIndex);
    }

    protected void next_Click(object sender, EventArgs e)
    {
        if (ps.CurrentPageIndex != ps.PageCount - 1)
        {
            ps.CurrentPageIndex = ps.CurrentPageIndex + 1;
            Bind(ps.CurrentPageIndex);
        }

    }

    protected void previous_Click(object sender, EventArgs e)
    {
        if (ps.CurrentPageIndex != 0)
        {
            ps.CurrentPageIndex = ps.CurrentPageIndex - 1;
            Bind(ps.CurrentPageIndex);
        }
    }
}
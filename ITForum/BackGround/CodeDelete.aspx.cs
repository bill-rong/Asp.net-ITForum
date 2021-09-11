using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackGround_CodeDelete : System.Web.UI.Page
{

    Operation operation = new Operation();
    public static PagedDataSource ps = new PagedDataSource();

    protected void Page_Load(object sender, EventArgs e)
    {

        Session.Add("UserName", "41801");
        if (!IsPostBack)
        {
            Bind(0);
        }

    }
    public void Bind(int CurrentPage)
    {
        ps.DataSource = operation.SelectCodeAll().Tables[0].DefaultView;  // 这里要加查询代码表的方法
        ps.AllowPaging = true;
        ps.PageSize = 6;
        ps.CurrentPageIndex = CurrentPage;
        this.codeList.DataSource = ps;
        this.codeList.DataKeyField = "id";
        this.codeList.DataBind();

    }
    protected void PageView(object sender, DataListItemEventArgs e)
    {
        LinkButton FirstPage = e.Item.FindControl("first") as LinkButton;
        LinkButton NextPage = e.Item.FindControl("next") as LinkButton;
        LinkButton PerviousPage = e.Item.FindControl("pervious") as LinkButton;
        LinkButton EndPage = e.Item.FindControl("end") as LinkButton;
        Label nowPage = e.Item.FindControl("nowPage") as Label;
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



    /// <summary>
    /// 删除命令事件
    /// </summary>
    /// <param name="source"></param>
    /// <param name="e"></param>
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string id = e.CommandArgument.ToString();   //获取要删除行的id号,执行删除命令
            Response.Write("<script>alert(" + id + ")</script>");
            operation.delCode(id);
            Response.Redirect(Request.Url.ToString());
        }
    }
}
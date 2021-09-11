using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected Operation operation = new Operation();
    protected DataRowCollection drsForum = null;
    protected DataRowCollection drsQuestion = null;
    protected DataRowCollection codeQuestion = null;
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
        drsForum = operation.selectForum().Tables["tb_forum"].Rows;
        drsQuestion = operation.selectQuestion().Tables["tb_question"].Rows;
        codeQuestion = operation.selectCode().Tables["tb_code"].Rows;
    }
}
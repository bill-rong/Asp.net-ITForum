using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackGround_QuesChecked : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        operation.forumRelease(forumTitle.Text.ToString(), forumText.Text.ToString(), DateTime.Now.ToLocalTime().ToString());
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{

    Random random = new Random();
    Operation operation = new Operation();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserName"] = null;
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        string Check1 = Convert.ToString(Request.Cookies["CheckCode"].Value);
        string ch = tbCheck.Text.Trim();
        string inputCheck = "";
        string ident = "tb_user";
        for(int i=0; i<ch.Length; i++)
        {
            char temp = ch[i];
            if(ch[i]>='a' && ch[i] <= 'z')
            {
                temp = (char)(ch[i] - ('a' - 'A'));
            }
            inputCheck += temp.ToString();
        }

        if (Check1 != inputCheck)
        {
            WebMessageBox.Show("验证码不正确！", "Login.aspx");

        }
        if(ADMIN.Checked == true)
        {
            ident = "tb_admin";
        }
        else
        {
            ident = "tb_user";
        }
        if (operation.login(tbUser.Text.Trim(), tbPwd.Text.Trim(), ident).Tables[0].Rows.Count > 0)
        {
            
            if (ADMIN.Checked == true)
            {
                Session.Add("AdminName", tbUser.Text.Trim());
                Response.Redirect("Backstage.aspx");
            }
            else
            {
                Session.Add("UserName", tbUser.Text.Trim());
                Response.Redirect("Default.aspx");
            }
            
        }
        else
        {
            //Response.Write("<script>alert('用户名称或密码输入不正确')</script>");
            WebMessageBox.Show("用户名称或密码输入不正确！", "Login.aspx");
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Register_Click(object sender, EventArgs e)
    {
        string id = uid.Text;
        string name = uname.Text;
        string tel = utel.Text;
        string sex = usex.SelectedItem.Text;
        string email = uemail.Text
;        string tag = utag.Text;
        string pwd = upwd.Text;
        if (id == "")
        {
            Response.Write("<script>alert('账号不能为空')</script>");
        }
        else if (pwd == "")
        {
            Response.Write("<script>alert('密码不能为空')</script>");
        }
        else if (operation.selectName(int.Parse(id)).Tables[0].Rows.Count > 0)
        {
            Response.Write("<script>alert('该账号已被注册')</script>");
        }
        else
        {
            try
            {
                operation.register(id, name, tel, sex, email, tag, pwd);
                WebMessageBox.Show("注册成功", "Login.aspx");
            }
            catch { }
            
        }
    }
}
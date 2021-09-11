using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    Operation operation = new Operation();
    DataSet ds ;
    protected void Page_Load(object sender, EventArgs e)
    {
        ds = operation.personalInfo(Session["UserName"].ToString());
        if (!IsPostBack)
        {
            // 个人信息卡片数据源绑定
            dlInfo.DataSource = ds;
            dlInfo.DataBind();

            // 修改信息的模态框的数据绑定
            name.Text = ds.Tables["tb_user"].Rows[0].ItemArray[1].ToString();
            tel.Text = ds.Tables["tb_user"].Rows[0].ItemArray[2].ToString();
            string strSex = ds.Tables["tb_user"].Rows[0].ItemArray[3].ToString();
            // 选定对应的选项（男/女）
            for (int i = 0; i < this.ddlSex.Items.Count; i++)
            {
                ddlSex.Items[i].Selected = false;
                if (ddlSex.Items[i].Value.Trim() == strSex)
                {
                    ddlSex.Items[i].Selected = true;
                }
            }
            email.Text = ds.Tables["tb_user"].Rows[0].ItemArray[4].ToString();
            tag.Text = ds.Tables["tb_user"].Rows[0].ItemArray[5].ToString();
        }

    }

    protected void Update_Click(object sender, EventArgs e)
    {
        string[] info =
        {
            ds.Tables["tb_user"].Rows[0].ItemArray[0].ToString(),
            name.Text.Trim(),
            tel.Text.Trim(),
            ddlSex.SelectedItem.Text,
            email.Text.Trim(),
            tag.Text.Trim()
        };
        //Response.Write("<script>alert('" + ddlSex.SelectedItem.Text + "');</script>");
        operation.updateInfo(info);
        Response.Redirect(Request.Url.ToString());
        //string id = ds.Tables["tb_user"].Rows[0].ItemArray[0].ToString();
        //string newName = name.Text.Trim();
        //string newTel = tel.Text.Trim();
        //string newSex = ddlSex.SelectedItem.Text;
        //string newEmail = email.Text.Trim();
        //string newTag = tag.Text.Trim();
        //Response.Write("<script>alert('" + newSex + "');</script>");
    }

    protected void Download_Click(object sender, EventArgs e)
    {
        string filename = Request.Form["onFileName"];

        try
        {
            // 服务器文件路径
            string strFilePath = Server.MapPath("~") + "/" + "FileManager/" + filename;
            FileInfo fileInfo = new FileInfo(strFilePath);
            Response.Clear();
            Response.Charset = "GB2312";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.AddHeader("Content-Disposition", "attachment;filename=" + Server.UrlEncode(fileInfo.Name));
            Response.AddHeader("Content-Length", fileInfo.Length.ToString());
            Response.ContentType = "application/x-bittorrent";
            Response.WriteFile(fileInfo.FullName);
            Response.End();
        }
        catch (System.Threading.ThreadAbortException ex)
        {
        }
        catch (Exception ex)
        {
        }
    }



    protected void enter_Click(object sender, EventArgs e)
    {
        string text = search.Text.Trim();
        Response.Redirect("SearchResult.aspx?text=" + text);
    }
}

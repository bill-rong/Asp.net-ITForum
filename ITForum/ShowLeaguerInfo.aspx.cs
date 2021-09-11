using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ShowLeaguerInfo : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = null;
        if ((id = Request.QueryString["id"]) != null)
        {
            DataSet ds = operation.SelectCodeOne(id);
            title.InnerText = ds.Tables[0].Rows[0][1].ToString();
            describe.Text = ds.Tables[0].Rows[0][2].ToString().Replace("\n","<br/>");
            codeType.InnerText = ds.Tables[0].Rows[0][3].ToString();
            string timeStr = ds.Tables[0].Rows[0][4].ToString();
            time.InnerText = timeStr.Substring(0,timeStr.Length-9);
            file.InnerText = ds.Tables[0].Rows[0][5].ToString();
        }
    }
}

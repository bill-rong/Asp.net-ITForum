﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// WebMessageBox 的摘要说明
/// </summary>
public class WebMessageBox
{
    /// <summary>
    /// 网页消息对话框
    /// </summary>
    /// <param name="Message">要显示的消息文本</param>
    public static void Show(string Message)
    {
        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message + "')</script>");
        HttpContext.Current.Response.Write("<script>history.go(-1)</script>");
        HttpContext.Current.Response.End();
    }

    /// <summary>
    /// 网页消息对话框
    /// </summary>
    /// <param name="Message">要显示的消息文本</param>
    /// <param name="Src">点击确定后跳转的页面</param>
    public static void Show(string Message, string Src)
    {
        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message + "');location.href='" + Src + "'</script>");
        HttpContext.Current.Response.End();
    }

    /// <summary>
    /// 网页消息对话框
    /// </summary>
    /// <param name="Message">要显示的消息文本</param>
    /// <param name="Close">关闭当前页面</param>
    public static void Show(string Message, bool Close)
    {
        if (Close)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message + "');window.close()</script>");
            HttpContext.Current.Response.End();
        }
        else
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message + "')</script>");
            HttpContext.Current.Response.End();
        }
    }
}

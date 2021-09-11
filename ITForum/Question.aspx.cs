﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Question : System.Web.UI.Page
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
        ps.DataSource = operation.questionTitle().Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 8;
        ps.CurrentPageIndex = CurrentPage;
        this.questionList.DataSource = ps;
        this.questionList.DataKeyField = "id";
        this.questionList.DataBind();
        
    }
    protected void PageView(object sender,DataListItemEventArgs e)
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
        if(ps.CurrentPageIndex != ps.PageCount - 1)
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


    protected void upload_Click(object sender, EventArgs e)
    {
        operation.quesRelease(Session["UserName"].ToString(), questionTitle.Text.Trim(), Request.Form["questionDescribe"], DateTime.Now.ToLocalTime().ToString());
    }
}
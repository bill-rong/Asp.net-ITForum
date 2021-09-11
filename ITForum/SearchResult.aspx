<%@ Page Title="ITForum" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/Default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row" style="margin-top:30px;min-height:650px;">
        <div class="col-md-1"></div>
        <div class="col-md-10 tuijian">
          <div class="title" >搜索结果</div>
      <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">论坛</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">问答</a></li>
            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">代码</a></li>
           
          </ul>

          <!-- Tab panes -->
          <div class="tab-content" style="margin-bottom:10px;">
            <div role="tabpanel" class="tab-pane active" id="home" >
                <table class="table table-hover">
                    <thead><tr><th>#</th><th>标题</th><th>发表日期</th></tr></thead>
                    <tbody>
                    <%
                        if(drsForumSearch != null)
                        {
                            int i = 0;
                            foreach(System.Data.DataRow dr in drsForumSearch)
                            {
                                i++;
                    %>
                            
                                <tr>
                                    <td><%=i %></td>
                                    <td><a href="ForumRequest.aspx?id=<%=dr["id"] %>" class="title-a" target="_blank"><%=dr["forum_title"] %></a></td>
                                    <td><%=dr["forum_time"] %></td>
                                </tr>
                            
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile" >
                <table class="table table-hover">
                    <thead><tr><th>#</th><th>标题</th><th>发表日期</th><th>提问人</th></tr></thead>
                    <tbody>
                    <%
                        if(drsQuestionSearch != null)
                        {
                            int i = 0;
                            foreach(System.Data.DataRow dr in drsQuestionSearch)
                            {
                                i++;
                    %>
                            <tr>
                                <td><%=i %></td>
                                <td><a href="QuestionRequest.aspx?id=<%=dr["id"] %>" class="title-a" target="_blank"><%=dr["title"] %></a></td>
                                <td><%=dr["ques_time"] %></td>
                                <td><%=operation.selectName(Convert.ToInt32(dr["user_id"])).Tables["tb_user"].Rows[0].ItemArray[0].ToString() %></td>
                            </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div role="tabpanel" class="tab-pane" id="messages" >
                <table class="table table-hover">
                    <thead><tr><th>#</th><th>标题</th><th>发表日期</th></tr></thead>
                    <tbody>
                    <%
                        if(drsCodeSearch != null)
                        {
                            int i = 0;
                            foreach(System.Data.DataRow dr in drsCodeSearch)
                            {
                                i++;
                    %>
                            <tr>
                                <td><%=i %></td>
                                <td><a href="#" onclick="SetID('<%=dr["id"] %>','<%=dr["path"] %>')" class="title-a" data-toggle="modal" data-target="#showLeaguer"><%=dr["title"] %></a></td>
                                <%--<td><%=dr["path"] %></td>--%>
                                <td><%=dr["code_time"] %></td>
                            </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
          </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</asp:Content>
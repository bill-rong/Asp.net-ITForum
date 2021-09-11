<%@ Page Title="ITFroum-首页" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/Default.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <div class="row ">
        <div class="col-md-1"></div>
        <div class="col-md-10" style="margin-top:10px;">
            <!-- 轮播图  -->
	        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="image/carousel_1.jpg" alt="..." >
                  <div class="carousel-caption">
                  </div>
                </div>
                <div class="item">
                  <img src="image/carousel_2.jpg" alt="...">
                  <div class="carousel-caption">
                  </div>
                </div>
                <div class="item">
                  <img src="image/carousel_3.jpg" alt="...">
                  <div class="carousel-caption">
                  </div>
                </div>
                
              </div>

              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left-1" aria-hidden="true" style="transform:rotate(180deg);">➤</span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right-1" aria-hidden="true">➤</span>
                <span class="sr-only">Next</span>
              </a>
            </div>
        </div>    
        <div class="col-md-1"></div>
    </div>

     
    <div class="row" style="margin-top:30px;">
        <div class="col-md-2"></div>
        <div class="col-md-8 tuijian">
          <div class="title" >热门推荐</div>
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
                        if(drsForum != null)
                        {
                            int i = 0;
                            foreach(System.Data.DataRow dr in drsForum)
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
                        if(drsQuestion != null)
                        {
                            int i = 0;
                            foreach(System.Data.DataRow dr in drsQuestion)
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
                    <thead><tr><th>#</th><th>标题</th><th>文件名</th><th>发表日期</th></tr></thead>
                    <tbody>
                    <%
                        if(drsQuestion != null)
                        {
                            int i = 0;
                            foreach(System.Data.DataRow dr in codeQuestion)
                            {
                                i++;
                    %>
                            <tr>
                                <td><%=i %></td>
                                <td><a href="#" onclick="SetID('<%=dr["id"] %>','<%=dr["path"] %>')" class="title-a" data-toggle="modal" data-target="#showLeaguer"><%=dr["title"] %></a></td>
                                <td><%=dr["path"] %></td>
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
        <div class="col-md-2"></div>
        <script>
            $('#myTabs a').click(function (e) {
              e.preventDefault()
              $(this).tab('show')
            })
            $('#myTabs a[href="#profile"]').tab('show') // Select tab by name
            $('#myTabs a:first').tab('show') // Select first tab
            $('#myTabs a:last').tab('show') // Select last tab
            $('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)
        </script>
    </div>
        
   

    
</asp:Content>


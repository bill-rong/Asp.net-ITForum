<%@ Page Title="ITForum-资源" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Code.aspx.cs" Inherits="Code" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/Code.css" rel="stylesheet" type="text/css" />
    <link href="css/question.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10 new">
	        <p>热门语言</p>
	        <ul>
		        <li>
			        <hgroup>
                        <h2>C/C++</h2>
				        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C语言是一门面向过程的、抽象化的通用程序设计语言，
                            广泛应用于底层开发。C语言能以简易的方式编译、处理低级存储器。
                            C语言是仅产生少量的机器语言以及不需要任何运行环境支持便能运行的高效率程序设计语言。
				        </h5>
				        
			        </hgroup>
		        </li>
		        <li>
			        <hgroup>
                        <h2>JAVA</h2>
				        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Java是一门面向对象编程语言，
                            不仅吸收了C++语言的各种优点，
                            还摒弃了C++里难以理解的多继承、
                            指针等概念，因此Java语言具有功能强大和简单易用两个特征。
				        </h5>
				        
			        </hgroup>
		        </li>
		        <li>
			        <hgroup>
				        <h2>Python</h2>
				        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Python语法和动态类型，
                            以及解释型语言的本质，使它成为多数平台上写脚本和快速开发应用的编程语言，
                            随着版本的不断更新和语言新功能的添加，逐渐被用于独立的、大型项目的开发。
				        </h5>
			        </hgroup>
		        </li>
	        </ul>
        </div>
        <div class="col-md-1"></div>
    </div>

    <div class="upload-file">
            <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">
          点击此处分享资源
        </button>
    </div>
    <div class="row" >
        <div class="col-md-1">
        </div>
        <div class="col-md-10" >
            <asp:DataList ID="codeList" runat="server" style="margin-bottom:10px;width:100%;" >
                <FooterTemplate>
                    <div class="page">
                        <asp:LinkButton ID="first" CssClass="btn btn-default" runat="server" CommandName="first" OnClick="first_Click">第一页</asp:LinkButton>
                        <asp:LinkButton ID="previous" CssClass="btn btn-default" runat="server" CommandName="pre" OnClick="previous_Click">上一页</asp:LinkButton>
                        <asp:Label CssClass="btn btn-default" ID="nowPage"  runat="server">第<%=ps.CurrentPageIndex + 1 %>页</asp:Label>
                        <asp:LinkButton ID="next" CssClass="btn btn-default" runat="server" CommandName="next" OnClick="next_Click">下一页</asp:LinkButton>
                        <asp:LinkButton ID="end" CssClass="btn btn-default" runat="server" CommandName="end" OnClick="end_Click">尾页</asp:LinkButton>
                    </div>
                </FooterTemplate>
                <ItemTemplate>  
                    <a href="#" class="list-group-item item-a"  onclick="SetID('<%#DataBinder.Eval(Container.DataItem,"id")%>','<%# DataBinder.Eval(Container.DataItem,"path")%>')" data-toggle="modal" data-target="#showLeaguer">
                        <label id="itemTitle"><%#DataBinder.Eval(Container.DataItem,"title") %></label>
                        <label id="itemTime" class="item-time"><%#DataBinder.Eval(Container.DataItem,"code_time").ToString()
                                                                       .Substring(0,DataBinder.Eval(Container.DataItem,"code_time").ToString().IndexOf(" ")) %></label>
                        <br />
                        <label id="itemDescribe" class="item-Describe">
                            <%#DataBinder.Eval(Container.DataItem,"code_text").ToString().Length>40
                                    ?DataBinder.Eval(Container.DataItem,"code_text").ToString().Substring(0,40)+"..."
                                    :DataBinder.Eval(Container.DataItem,"code_text").ToString() %>

                        </label>
                    </a>
                </ItemTemplate>
                <HeaderTemplate>
                    <a href="#" class="list-group-item active">资源文件列表</a>
                </HeaderTemplate>
               
            </asp:DataList>
          </div>
        <div class="col-md-1">
            
        </div> 
    </div>
    <%--上传文件的模态框--%>
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">Modal title</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="fileTitle">标题</label>
                        <asp:TextBox ID="fileTitle" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="fileDescribe">描述</label>
                        <textarea class="form-control" name="fileDescribe"></textarea>
                        <%--<asp:TextBox ID="fileDescribe" class="form-control" runat="server"></asp:TextBox>--%>
                    </div>
                    <div class="form-group">
                        <label for="fileType">代码语言</label>
                        <asp:TextBox ID="fileType" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="File">上传文件</label>
                        <asp:FileUpload ID="File" runat="server" />
                    </div>
                </div>
                <div class="modal-footer" runat="server">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <%--<button type="button" id="upload" class="btn btn-primary" runat="server" OnClick="Upload_Click">上传</button>--%>
                    
                    <asp:Button ID="upload" class="btn btn-primary" runat="server" Text="上传" OnClick="Upload_Click" />
                </div>
            </div>
      </div>
    </div>




    

</asp:Content>


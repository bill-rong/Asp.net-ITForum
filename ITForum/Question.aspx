<%@ Page Title="ITForum-问答" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/question.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" style="min-height:650px;">
            <asp:DataList ID="questionList" runat="server">
                <ItemTemplate>
                    <table class="t-outside">
                        <tr>
                            <td>
                                <a href="QuestionRequest.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>" target="_blank">
                                    <span class="q-title"><%#DataBinder.Eval(Container.DataItem,"title") %></span>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td id="pro">
                                <span class="q-text" ><%#DataBinder.Eval(Container.DataItem,"problem") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="time">
                                <span class="q-title"><%#DataBinder.Eval(Container.DataItem,"ques_time") %></span>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="page">
                        <asp:LinkButton ID="first" CssClass="btn btn-default" runat="server" CommandName="first" OnClick="first_Click">第一页</asp:LinkButton>
                        <asp:LinkButton ID="previous" CssClass="btn btn-default" runat="server" CommandName="pre" OnClick="previous_Click">上一页</asp:LinkButton>
                        <asp:Label CssClass="btn btn-default" ID="nowPage"  runat="server">第<%=ps.CurrentPageIndex + 1 %>页</asp:Label>
                        <asp:LinkButton ID="next" CssClass="btn btn-default" runat="server" CommandName="next" OnClick="next_Click">下一页</asp:LinkButton>
                        <asp:LinkButton ID="end" CssClass="btn btn-default" runat="server" CommandName="end" OnClick="end_Click">尾页</asp:LinkButton>
                    </div>
                </FooterTemplate>
            </asp:DataList>
        </div>
        <div class="col-md-1"></div> 
        </div>


        <div class="upload-file">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalQues">
              点击此处发起提问
            </button>
        </div>
        <%--发起提问的模态框--%>
        <div class="modal fade" id="myModalQues" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel3">发起提问</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="questionTitle">标题</label>
                            <asp:TextBox ID="questionTitle" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="questionDescribe">内容</label>
                            <textarea class="form-control" name="questionDescribe"></textarea>
                            <%--<asp:TextBox ID="fileDescribe" class="form-control" runat="server"></asp:TextBox>--%>
                        </div>
                    </div>
                    <div class="modal-footer" runat="server">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <%--<button type="button" id="upload" class="btn btn-primary" runat="server" OnClick="Upload_Click">上传</button>--%>
                    
                        <asp:Button ID="upload" class="btn btn-primary" runat="server" Text="上传" OnClick="upload_Click"  />
                    </div>
                </div>
            </div>
        </div>

</asp:Content>




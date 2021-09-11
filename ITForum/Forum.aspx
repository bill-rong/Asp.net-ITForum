<%@ Page Title="ITForum-论坛" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/question.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" style="min-height:650px;">
            <asp:DataList ID="forumList" runat="server">
                <ItemTemplate>
                    <table class="t-outside">
                        <tr>
                            <td>
                                <a href="ForumRequest.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>" target="_blank">
                                    <span class="q-title"><%#DataBinder.Eval(Container.DataItem,"forum_title") %></span>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td id="pro">
                                <span class="q-text" ><%#DataBinder.Eval(Container.DataItem,"forum_text") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="time">
                                <span class="q-title"><%#DataBinder.Eval(Container.DataItem,"forum_time") %></span>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="page">
                        <asp:LinkButton ID="first" CssClass="btn btn-default" runat="server" CommandName="first" OnClick="first_Click">第一页</asp:LinkButton>
                        <asp:LinkButton ID="previous" CssClass="btn btn-default" runat="server" CommandName="pre" OnClick="previous_Click">上一页</asp:LinkButton>
                        <asp:LinkButton ID="next" CssClass="btn btn-default" runat="server" CommandName="next" OnClick="next_Click">下一页</asp:LinkButton>
                        <asp:LinkButton ID="end" CssClass="btn btn-default" runat="server" CommandName="end" OnClick="end_Click">尾页</asp:LinkButton>
                    </div>
                </FooterTemplate>
            </asp:DataList>
          </div>
        <div class="col-md-1">
     </div> 
    </div>
</asp:Content>


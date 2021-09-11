<%@ Page Title="ITForum-问答" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionRequest.aspx.cs" Inherits="QuestionRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/question.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="t-outside" style="background-color:#fff;">
            <asp:DataList ID="question_title" runat="server" Width="100%">
                <ItemTemplate>
                    <table class="outside">
                        <tr>
                            <td>
                                <span class="q-title"><%#DataBinder.Eval(Container.DataItem,"title") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="q-time">
                                <span class="t-time"><%#DataBinder.Eval(Container.DataItem,"ques_time") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="q-text">&nbsp;&nbsp<%#DataBinder.Eval(Container.DataItem,"problem") %></span>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>

        <asp:Button id="cbtn" class="c-btn" type="button" runat="server" OnClick="cbtn_Click"/>

    </div>
    
    <div style="min-height:600px;">
        <asp:DataList ID="answer" runat="server" Width="100%">
            <ItemTemplate>
                <table class="text">
                    <tr>
                        <td>
                            <span class="a-name"><%#DataBinder.Eval(Container.DataItem,"name") %></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="a-text">&nbsp;&nbsp<%#DataBinder.Eval(Container.DataItem,"ans").ToString().Replace("\n","<br>") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td id="time">
                            <span class="a-time"><%#DataBinder.Eval(Container.DataItem,"ans_time") %></span>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>

          
        <div class="input-group-t" runat="server">
            <textarea id="ans" rows="6" class="input-text" name="text" placeholder="说点什么吧..." cols="20"></textarea>
            <span class="input-group-btn">
                <asp:Button ID="release" runat="server" Text="发布" CssClass="btn btn-default" OnClick="release_Click" />
            </span>
        </div>
</asp:Content>


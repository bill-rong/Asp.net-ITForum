<%@ Page Title="ITForum-论坛" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForumRequest.aspx.cs" Inherits="ForumRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/Forum.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="f-outside">
        <asp:Button id="cbtn" class="c-btn" type="button" runat="server" OnClick="cbtn_Click"/>
            <asp:DataList ID="forum_title" runat="server" Width="100%">
                
                <ItemTemplate>
                    <table class="F-outside">
                        <tr>
                            <td>
                                <span class="f-title"><%#DataBinder.Eval(Container.DataItem,"forum_title") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="f-time">
                                <span class="time" ><%#DataBinder.Eval(Container.DataItem,"forum_time") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <span class="f-text">&nbsp;&nbsp<%#DataBinder.Eval(Container.DataItem,"forum_text") %></span>
                            </td>
                        </tr>
                        
                    </table>
                </ItemTemplate>
            </asp:DataList>

        

    </div>
    
    <div style="min-height:600px;">
        <asp:DataList ID="comment" runat="server" Width="100%" >
            <ItemTemplate>
                <table class="text">
                    <tr>
                        <td>
                            <span class="a-name"><%#DataBinder.Eval(Container.DataItem,"name") %></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="a-text">&nbsp;&nbsp<%#DataBinder.Eval(Container.DataItem,"comment_text").ToString().Replace("\n","<br>") %></label>
                        </td>
                    </tr>
                    <tr>
                        <td id="time">
                            <span class="a-time"><%#DataBinder.Eval(Container.DataItem,"com_time") %></span>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
          
        <div class="input-group-ig" runat="server">
            <textarea id="ans" rows="6" class="input-text" name="text" placeholder="说点什么吧..." cols="20"></textarea>
            <span class="input-group-btn">
                <asp:Button ID="release" runat="server" Text="发布" CssClass="btn btn-default" OnClick="release_Click" />
            </span>
        </div>
</asp:Content>


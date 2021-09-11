<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuesChecked.aspx.cs" Inherits="BackGround_QuesChecked" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/Bforum.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <asp:DataList ID="quesList" runat="server" OnDeleteCommand="DataList1_DeleteCommand" OnUpdateCommand="DataList1_UpdateCommand">
                <ItemTemplate>
                    <table class="f-outside">
                        <tr>
                            <td>
                                <span class="f-title"><%#DataBinder.Eval(Container.DataItem,"title") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="pro">
                                <span class="f-text" ><%#DataBinder.Eval(Container.DataItem,"problem") %></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="time">
                                <span class="f-time"><%#DataBinder.Eval(Container.DataItem,"ques_time") %></span>
                            </td>
                        </tr>
                    </table>

                    <asp:LinkButton class="cBtn"  ID="LinkButton1" runat="server" CommandName="Update" CommandArgument='<%#Eval("id") %>'>通过</asp:LinkButton>
                    <asp:LinkButton class="dBtn"  ID="lbtDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("id") %>'>删除</asp:LinkButton>

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
        <div class="col-md-1">
     </div> 
    </div>
    </form>
</body>
</html>

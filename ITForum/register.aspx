<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>ITForum-用户注册</title>
    <script type="text/javascript" src="Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/Login.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <form id="main" runat="server">

        <div id="account" runat="server">
            <h4 style="text-align:center">&nbsp;</h4>
            <h2 style="text-align:center">用户注册</h2>
            
            <div class="input-box" runat="server">
                <asp:TextBox ID="uid" CssClass="input" runat="server" placeholder="账号"></asp:TextBox>
            </div>
            <div class="input-box" runat="server">
                <asp:TextBox ID="uname" CssClass="input" runat="server" placeholder="昵称"></asp:TextBox>
            </div>
            <div class="input-box" runat="server">
                <asp:TextBox ID="utel" CssClass="input" runat="server" placeholder="联系方式"></asp:TextBox>
            </div>
            <div class="input-box" runat="server">
                <%--<asp:TextBox ID="TextBox3" CssClass="input" runat="server" placeholder="请输入您的性别"></asp:TextBox>--%>
                <asp:DropDownList ID="usex" runat="server" CssClass="input">
                    <asp:ListItem Value="男">男</asp:ListItem>
                    <asp:ListItem Value="女">女</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="input-box" runat="server">
                <asp:TextBox ID="uemail" CssClass="input" runat="server" placeholder="邮箱"></asp:TextBox>
            </div>

            <div class="input-box" runat="server">
                <asp:TextBox ID="utag" CssClass="input" runat="server" placeholder="兴趣标签"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="upwd" CssClass="input" runat="server" placeholder="密码"></asp:TextBox>
            </div>
            
            
        </div>
        
        <asp:Button ID="Register" CssClass="login-btn" runat="server" Text="注册" OnClick="Register_Click" />
          


    </form>
</body>
</html>

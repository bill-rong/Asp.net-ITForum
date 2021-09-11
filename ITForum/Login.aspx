<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <title>ITForum-登录</title>
    <link rel="Shortcut Icon" href="image/IT.png" type="image/x-icon" />
    <link href="css/Login.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <form id="main" runat="server">
        
        <div id="avatar">
        </div>

        <div id="account" runat="server">
            <div class="input-box" runat="server">
                <asp:TextBox ID="tbUser" CssClass="input" runat="server" placeholder="请输入您的账号"></asp:TextBox>
            </div>
            <div class="input-box">
                <asp:TextBox ID="tbPwd" CssClass="input" runat="server" TextMode="Password" placeholder="请输入您的密码"></asp:TextBox>
            </div>
            <div class="input-box input-box3" >
                <asp:TextBox ID="tbCheck" CssClass="input" runat="server" placeholder="请输入验证码"></asp:TextBox>
            </div>
            <asp:Image ID="Image1" class="box_image" ImageUrl="~/CheckCode.aspx" runat="server" />
        </div>
        
        <asp:Button ID="Button1" CssClass="login-btn" runat="server" Text="登录" OnClick="Button1_Click" />
          

        <div id="footer">
            <a href="Register.aspx">注册用户</a>
        </div>
        <div class="admin dh">
            <div></div>
            <label for="ADMIN">管理员登录&nbsp;<asp:CheckBox ID="ADMIN" runat="server" /></label>
            
            <%--<asp:RadioButton ID="ADMIN" runat="server" />--%>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForumCreate.aspx.cs" Inherits="BackGround_QuesChecked" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row custom-add-row">
            <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "tel">信息标题</label> </div>
            <div class="col-md-6"> 
                <div class = "input-group">                 
                    <asp:TextBox ID="forumTitle" CssClass="form-control " runat="server" Width="337px"></asp:TextBox>                
                </div>             
            </div> 
            <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="forumTitle" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
        </div>
        <div class="row custom-add-row">
            <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "idCard">信息内容</label> </div>
            <div class="col-md-6"> 
                <div class = "input-group"> 
                    <asp:TextBox ID="forumText" CssClass="form-control" runat="server" Height="147px" TextMode="MultiLine" Width="360px"></asp:TextBox>                
                </div>             
            </div> 
            <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="forumText" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
        </div>
        
        
        <div class="row form-group custom-add-row"> 
            <div class="col-sm-2 col-sm-offset-2"> 
                <asp:Button ID="btnAdd" runat="server" Text="发布信息" Height="46px" Width="145px" OnClick="btnAdd_Click"  />
            </div>    
        </div> 
    </form>
</body>
</html>

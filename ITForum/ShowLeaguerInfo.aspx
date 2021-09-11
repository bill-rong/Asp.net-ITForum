<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowLeaguerInfo.aspx.cs" Inherits="ShowLeaguerInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" src="Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .row {
            margin-top:20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">    
        <div class="row">
            <label for="" class="col-xs-4 text-right">标题：</label>
            <div class="col-xs-8 text-left"><span id="title" runat="server" ></span></div>
        </div>
        <div class="row" >
            <label for="" class="col-xs-4 text-right">描述：</label>
            <div class="col-xs-8 text-left">
                <asp:Label ID="describe" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <label for="" class="col-xs-4 text-right">代码语言：</label>
            <div class="col-xs-8 text-left"><span id="codeType" runat="server" ></span></div>
        </div>
        <div class="row">
            <label for="" class="col-xs-4 text-right">上传时间：</label>
            <div class="col-xs-8 text-left"><span id="time" runat="server" ></span></div>
        </div>
        <div class="row">
            <label for="" class="col-xs-4 text-right">文件：</label>
            <div class="col-xs-8 text-left"><span id="file" runat="server" ></span></div>
        </div> 
    </form>
</body>
</html>

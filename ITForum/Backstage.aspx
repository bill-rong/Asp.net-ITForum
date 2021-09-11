<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Backstage.aspx.cs" Inherits="Backstage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

     <title>「后台管理」</title>
    <link rel="Shortcut Icon" href="image/IT.png" type="image/x-icon" />
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <link href="../Css/BackGround-Default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" style="height:70px;background-color:#f3f3f3">
                <div class="col-md-1"></div>
                <div class="col-md-2"><img src="image/logo.jpg" height="70"/></div>
                <div class="col-md-2" style="line-height:70px;font-size:30px;font-family:'楷体';font-weight:700">后台管理</div>

            </div>
            
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 custom-menu">
                    <div class="custom-menu-title"></div>
                    <div class="custom-menu-content" style="font-size:20px;">
                        <!-- 添加TreeView控件 -->
                        
                        <asp:TreeView ID="TreeView1" runat="server">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="true" ForeColor="#5555DD" />
                            <SelectedNodeStyle Font-Underline="true" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                            <Nodes>
                                <asp:TreeNode Text="论坛信息" Value="论坛信息">
                                    <asp:TreeNode Text="信息发布" Value="信息发布" NavigateUrl="~/BackGround/ForumCreate.aspx"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息修改" Value="信息修改" NavigateUrl="~/BackGround/ForumDelete.aspx"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="问题信息" Value="问题信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/QuesChecked.aspx"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/QuesDelete.aspx"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="资源信息" Value="资源信息">
                                    <asp:TreeNode Text="资源删除" Value="资源删除" NavigateUrl="~/BackGround/CodeDelete.aspx"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                        
                    </div>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 custom-list">
                    <div class="custom-list-title"  style="font-size:20px;">现在的位置：ITForum &gt; <span class="hong">后台管理系统</span> <span id="curNode" runat="server"></span></div>  
                     <!-- 添加iframe框架 -->
                    <iframe id="iframe1" name="mainFrame" style="width: 100%; height: 780px;background-color:#fff" ></iframe>
                    
                </div>
            </div>
        </div>
    </form>
    <script >
        var a_idx=0;
        jQuery(document).ready(function($){
                addTips = function (e) {
                    var a = new Array("富强", "民主", "文明", "和谐", "自由", "平等", "公正", "法治", "爱国", "敬业", "诚信", "友善");
                    var i = $("<span />").text(a[a_idx]);
                    a_idx = (a_idx + 1) % a.length;
                    var x = e.pageX, y = e.pageY;
                    i.css({
                        "z-index": 999999999,
                        "top": y - 20,
                        "left": x,
                        "position": "absolute",
                        "font-weight": "bold",
                        "color": "#ff6651"
                    });

                    $("body").append(i);
                    i.animate({ "top": y - 180, "opacity": 0 }, 1500, function () { i.remove() })
                    return false;
                }
            //绑定鼠标左键
            $("body").mouseup(addTips);
            //绑定鼠标右键
            //$("body").bind("contextmenu",addTips)
        });
    </script>
    <script>
        function o(w,v,i){
          return w.getAttribute(v)||i
        }
        function j(i){
            return document.getElementsByTagName(i)
        }
        function l(){
          var i=j("script"),w=i.length,v=i[w-1];
          return {l: w,z:o(v,"zIndex",-1),o:o(v,"opacity",1),c:o(v,"color","0,0,0"),n:o(v,"count",99)}
        }
        function k(){
            r = u.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
            n=u.height=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight
        }
        function b(){
            e.clearRect(0, 0, r, n);
            var w=[f].concat(t);
            var x,v,A,B,z,y;
            t.forEach(function(i){
            i.x += i.xa,
            i.y+=i.ya,
            i.xa*=i.x>r||i.x<0?-1:1,
            i.ya*=i.y>n||i.y<0?-1:1,
            e.fillRect(i.x-0.5,i.y-0.5,1,1);
            for(v=0;v<w.length; v++){
                x = w[v];
                if(i!==x&&null!==x.x&&null!==x.y){
                    B = i.x - x.x,z=i.y-x.y,y=B*B+z*z;
                    y<x.max&&(x===f&&y>=x.max/2&&(i.x-=0.03*B,i.y-=0.03*z),A=(x.max-y)/x.max,e.beginPath(),e.lineWidth=A/2,e.strokeStyle="rgba("+s.c+","+(A+0.2)+")",e.moveTo(i.x,i.y),e.lineTo(x.x,x.y),e.stroke())
                }
            }
            w.splice(w.indexOf(i),1)
            }),m(b)
        }
        var u=document.createElement("canvas"),s=l(),c="c_n"+s.l,e=u.getContext("2d"),r,n,
        m=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(i){
            window.setTimeout(i, 1000 / 45)
        },
        a=Math.random,f={x: null,y:null,max:20000};
        u.className="particle_canvas";
        var browserName = navigator.userAgent.toLowerCase();
        if (/msie/i.test(browserName) && !/opera/.test(browserName)) {
            u.className += ' ie10_gte';
        };
        u.id=c;
        u.style.cssText="position:fixed;top:0;left:0;z-index:"+s.z+";opacity:"+s.o;
        j("body")[0].appendChild(u);
        k(),window.onresize=k;
        window.onmousemove=function(i){
            i = i || window.event,
        f.x=i.clientX,
        f.y=i.clientY
        },
        window.onmouseout=function(){
            f.x = null,
        f.y=null
        };
        for(var t=[],p=0;s.n>p;p++){
            var h=a()*r,
            g=a()*n,
            q=2*a()-1,
            d=2*a()-1;
            t.push({x: h,y:g,xa:q,ya:d,max:6000})
        }
      setTimeout(function(){b()},100)
    </script>
    <style>
        .github-corner:hover .octo-arm {
            animation: octocat-wave 560ms ease-in-out
        }
        @keyframes octocat-wave {
                0 %, 100% {
                transform: rotate(0)
            }
        20%, 60% {
                transform: rotate(-25deg)
            }
        40%, 80% {
                transform: rotate(10deg)
            }
        }
        @media (max-width:500px) {
        .github - corner: hover .octo-arm {
                animation: none
            }
        .github-corner .octo-arm {
                animation: octocat-wave 560ms ease-in-out
            }
        }
        .auto-style2 {
            width: 76px;
        }
        .auto-style3 {
            width: 80px;
        }
    </style>
</body>
</html>


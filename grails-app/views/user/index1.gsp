<!DOCTYPE html>
<html class=" js csstransforms3d"><head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>uimaker网站后台管理系统</title>
    <asset:stylesheet src="base.css"/>
    <asset:stylesheet src="page.css"/>
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="modernizr.js"/>
</head>
<body>
<div class="superWrap clearfix" style="height: 781px;">
    <!--side S-->
    <div class="super-side-menu">
        <iframe width="205" height="100%" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"></iframe>
    <div class="super-side-menu">
        <div class="logo"><a href="public_super_cg.html" target="_parent"><asset:image src="logo.png"/></a></div>
        <div class="side-menu">
            <ul>
                <li class=""><a href="${createLink(uri: '/')}" target="Mainindex"></i>首页</a></li>
                <li class="menuButton"><g:link class="list" controller="analysis" action="index" target="Mainindex">分析列表</g:link></li>
                <li class="menuButton"><g:link class="list" controller="project" action="index" target="Mainindex">项目列表</g:link></li>
                <li class="menuButton"><g:link class="list" controller="user" action="index" target="Mainindex">用户列表</g:link></li>
                <li class="menuButton"><g:link class="exclamation" controller="user" action="logout" onclick="return warnBeforeUserLogout();">用户注销</g:link></li>
            </ul>
        </div>
    </div>
    </div>
    <div class="superContent">
        <div class="super-header clearfix">
        <h2>网站后台管理系统</h2>
    </div>
        <div class="superCtab superCtabBot" style="height: 695px;">
            <iframe id="Mainindex" name="Mainindex" width="100%" height="100%" marginheight="0" marginwidth="0" frameborder="0"></iframe>
    </div>
</div>
</div>
<script>
    window.onresize = function(){
        var winH=$(window).height();
        var headH=$('.super-header').height();
        $('.superWrap').height(winH);
        $('.superCtabBot').height(winH-headH);
    };
    $(window).resize();
</script>
</body></html>
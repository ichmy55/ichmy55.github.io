<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="ja-JP">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="Author" content="ichmy">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" href="/css/ichmy.css" type="text/css">
<!--[if IE]>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<![endif]-->
    <link rel="shortcut icon" href="/favicon.ico"
          type="image/vnd.microsoft.icon">
    <link rel="icon" href="/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon-precomposed" type="image/x-icon" href="/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" type="image/x-icon" sizes="57x57" href="/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" type="image/x-icon" sizes="72x72" href="/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" type="image/x-icon" sizes="114x114" href="/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" type="image/x-icon" sizes="144x144" href="/apple-touch-icon-144x144-precomposed.png">

    <title>{$jtitle}</title>

{literal}
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-10809675-1']);
  _gaq.push(['_trackPageview']);
  _gaq.push([‘_trackPageLoadTime’]);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
{/literal}
</head>

<body>
  <div class="header">
    {include file="header.tpl"}
  </div>

  <div class="navigate">
    {include file="navigate.tpl"}
  </div>

  <div class="main">

    <div class="maincol">
       {include file="$section.tpl"}
    </div>

    <hr width=0>

    <div class="leftcol">
      {include file="sidemenu.tpl"}
    </div>

    <div class="padding">
    </div>

    <div class="footer">
      {include file="footer.tpl"}
    </div>
  </div>
</body>
</html>

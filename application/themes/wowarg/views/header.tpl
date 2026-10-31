<!DOCTYPE html>
<!--
 ____  _      _  __   _        _    ____   ____  _____ _   _ _____ ___ _   _    _
| __ )| |    / \/ /__| |      / \  |  _ \ / ___|| ____| \ | |_   _|_ _| \ | |  / \
|  _ \| |   / _ / __| |     / _ \ | |_) | |  _ |  _| |  \| | | |  | ||  \| | / _ \
| |_) | |  / ___ \__ \ |___ / ___ \|  _ <| |_| || |___| |\  | | |  | || |\  |/ ___ \
|____/|_| /_/   \_|___/_____/_/   \_\_| \_\\____|_____|_| \_| |_| |___|_| \_/_/   \_\

 WoW Argentina Theme for FusionCMS 9.5.0
 AzerothCore WotLK 3.3.5a | wowarg.com
-->
<html lang="{lang('abbreviation', 'main')}" dir="ltr">
<head>
    <title>{$title}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{$description}">
    <meta name="keywords" content="{$keywords}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="theme-color" content="#101F35">

    <meta property="og:title" content="{$title}">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{$url}">
    <meta property="og:description" content="{$description}">
    <meta property="og:site_name" content="{$serverName}">

    <link rel="shortcut icon" href="{if $cdn_link != false}{$cdn_link}{$theme_path}{else}{$full_theme_path}{/if}images/favicon.ico">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    {minify files=array(
        "application/css/default.css",
        "application/css/tooltip.css",
        "application/fonts/fontawesome/v6.6.0/css/all.css",
        "node_modules/bootstrap/dist/css/bootstrap.min.css",
        "node_modules/sweetalert2/dist/sweetalert2.min.css",
        "node_modules/owl.carousel/dist/assets/owl.carousel.min.css",
        "node_modules/owl.carousel/dist/assets/owl.theme.default.min.css",
        "node_modules/datatables/media/css/jquery.dataTables.min.css",
        "{$full_theme_path}css/main.css",
        "{$full_theme_path}css/custom.css"
    ) type='css' output='writable/cache/data/minify/wowarg_all.min.css' disable="1"}

    {if $extra_css}
        {if !is_array($extra_css)}
            <link type="text/css" rel="stylesheet" href="{$path}{$extra_css}">
        {else}
            {foreach from=$extra_css item=css}
                <link type="text/css" rel="stylesheet" href="{$path}{$css}">
            {/foreach}
        {/if}
    {/if}

    {minify files=array(
        "application/js/jquery-3.6.0.min.js",
        "application/js/jquery.placeholder.min.js",
        "application/js/jquery.sort.js",
        "node_modules/bootstrap/dist/js/bootstrap.bundle.min.js",
        "node_modules/sweetalert2/dist/sweetalert2.all.min.js",
        "node_modules/owl.carousel/dist/owl.carousel.min.js",
        "node_modules/datatables/media/js/jquery.dataTables.min.js",
        "application/js/main.js",
        "application/js/cookie.js",
        "application/js/ui.js",
        "application/js/language.js",
        "application/js/tooltip.js",
        "{$full_theme_path}js/main.js"
    ) type='js' output='writable/cache/data/minify/wowarg_all.min.js' disable="1"}

    <script type="text/javascript">
        var isIE = isIE();
        var Config = {
            URL: "{$url}",
            image_path: "{$image_path}",
            CSRF: getCookie('csrf_cookie_name'),
            language: "{$activeLanguage}",
            UseFusionTooltip: true,
            Slider: {
                interval: {$slider_interval},
                effect: {if $slider_style}"{$slider_style}"{else}""{/if}
            }
        };
        $(document).ready(function() {
            {if $client_language}Language.set("{addslashes($client_language)}");{/if}
            Tooltip.initialize();
        });
        UI.initialize();
        {if $analytics}
        (function() {
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '{$analytics}']);
            _gaq.push(['_trackPageview']);
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
        {/if}
    </script>
    {if $extra_js}
        {if !is_array($extra_js)}
            <script type="text/javascript" src="{$path}{$extra_js}"></script>
        {else}
            {foreach from=$extra_js item=js}
                <script type="text/javascript" src="{$path}{$js}"></script>
            {/foreach}
        {/if}
    {/if}
</head>

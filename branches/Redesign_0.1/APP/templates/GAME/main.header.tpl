<!DOCTYPE html>
<html> 
    <head>
        <title>{block name="title"}{$title} - {$game_config['game_name']}{/block}</title>
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" type="text/css" href="{$dpath}/default.css" />
        <link rel="stylesheet" type="text/css" href="{$dpath}/formate.css" />
        <link rel="stylesheet" type="text/css" href="{$dpath}/redesign.css" />
        <meta http-equiv="content-type" content="text/html; charset={$encoding}" />
    </head>
    <body id="{$smarty.get.page}" class="ogame lang-pt no-touch">
        <div class="contentBoxBody">
            <div id="ie_message">
                <p><img src="{$dpath}img/info.gif" height="16" width="16">
                   {$lang['tpn_update_browser']}
                   <a href="http://www.microsoft.com/upgrade/">{$lang['tpn_IE']}</a>
                   {$lang['tpn_or']}
                   <a href="http://www.mozilla-europe.org/de/firefox/">{$lang['tpn_FF']}</a>.</p>
            </div>

            <!-- HEADER -->
            <!-- ONET 4 POLAND -->

            <div id="boxBG">
                <div id="box">
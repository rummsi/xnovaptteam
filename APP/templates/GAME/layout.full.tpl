{include file="main.header.tpl"}
{include file="main.topmenu.tpl"}
{include file="main.topnav.tpl"}
{include file="main.leftmenu.tpl"}

                    <!-- CONTENT AREA -->
                    <div id="contentWrapper">
                        <div id="eventboxContent"{if count($fleet_list) == 0} style="display: none;"{/if}>
                            <div id="eventListWrap">
                                <div id="eventHeader">
                                    <a class="close_details eventToggle" href="javascript:void(0);">
                                        <img src="{$dpath}img/pixel.gif" height="16" width="16">
                                    </a>
                                    <h4>{$lang['Events']}</h4>
                                </div>
                                <table id="eventContent">
                                    <tbody>
                                        {$fleet_list}
                                    </tbody>
                                </table>
                                <div id="eventFooter"></div>
                            </div>
                        </div>
{block name="content"}{/block}{if $smarty.get.page != 'overview'}
                        <div id="detailWrapper"></div>{/if}
                    </div>
                    <!-- END CONTENT AREA -->
{include file="main.rightmenu.tpl"}
{include file="main.javascript.tpl"}
{include file="main.footer.tpl"}
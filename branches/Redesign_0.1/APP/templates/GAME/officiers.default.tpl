{block name="title" prepend}{/block}
{block name="content"}
                        <div id="inhalt" class="officers">
                            <div id="planet">
                                <div id="header_text">
                                    <h2>
                                        Recrutar Oficiais
                                    </h2>
                                </div>{if empty($desc)}<div id="detail" class="detail_screen small">{else}
                                <div id="detail" class="detail_screen small" style="height: 250px; display: block; overflow: hidden; margin-top: 0px;">
                                    <div class="officers200  {$desc}  "></div>
                                    <div id="content">
                                        <h2>{$lang['link'][$desc]}</h2>
                                        <a id="close" class='close_details' href="javascript:void(0);" onclick="gfSlider.hide(getElementByIdWithCache('detail')); return false;"></a>
                                        <span class="level">
                                            <span class="undermark">{$lang['off_tx_lvl']} {$user[$resource[$desc]]}</span>
                                        </span>
                                        <br class="clearfloat">
                                        <div id="wrapper">
                                            <div id="features">
                                                <p>{$lang['Desc'][$desc]}</p>{$Result = IsOfficierAccessible($user, $desc)}
                                                        {if $Result != 0}
                                                            {if $Result == 1}
                                                    <div class="build-it_wrap">
                                                        <a class="officer build-it overlay" href="game.php?page=officier&mode=hire&offi={$desc}">
                                                        <span>{$lang['link'][$desc]}</span>
                                                            {else}
                                                    <div class="build-it_wrap">
                                                        <a class="officer build-it_disabled" href="game.php?page=officier&mode=hire&offi={$desc}">
                                                            <span>{$lang['link'][$desc]}</span>
                                                        {/if}
                                                        {/if}
                                                    </a>
                                                </div>
                                                <br class="clearfloat"/>
                                            </div>
                                        </div>
                                    </div>
                                    <br clear="all"/>
                                    <div id="description">
                                        <div class="benefits">
                                            Benefícios:<br\>
                                            <a href="javascript:void(0);" class="tooltipRight help" title="&lt;b&gt;Lista de Construção&lt;/b&gt;&lt;p&gt;Coloca até 4 edifícios adicionais simultaneamente na lista de construção&lt;/p&gt;&lt;br/&gt;&lt;b&gt;Vista Império&lt;/b&gt;&lt;p&gt;Numa página poderás consultar uma vista geral de todos os teus recursos, edifícios, pesquisas e unidades. Também poderás iniciar construções e pesquisas.&lt;/p&gt;&lt;br/&gt;&lt;b&gt;Menu de Galáxia Melhorado&lt;/b&gt;&lt;p&gt;A partir daqui poderás enviar directamente Recicladores para Campos de Destroços e iniciar Espionagens a Luas&lt;/p&gt;&lt;br/&gt;&lt;b&gt;Filtro de Mensagens&lt;/b&gt;&lt;p&gt;A tua Caixa de Entrada de mensagens será ordenada por temas e todas as mensagens serão guardadas durante 7 dias. Além disto, poderás enviar mais mensagens e escrever directamente para amigos da tua lista de contactos.&lt;/p&gt;&lt;br/&gt;&lt;b&gt;Verificação dos Transportes&lt;/b&gt;&lt;p&gt;Será exibido o número de recursos em transporte para o teu planeta.&lt;/p&gt;&lt;br/&gt;&lt;b&gt;Sem Publicidade&lt;/b&gt;&lt;p&gt;Não verás mais publicidade a outros jogos. Em vez disso serão apenas exibidos anúncios a ofertas e eventos específicos do Ogame.&lt;/p&gt;" data-tooltip-width="450"></a>
                                        </div>
                                        <div class="benefitlist">
                                            {$lang['Desc1'][$desc]}
                                        </div>
                                    </div>{/if}
                                </div>
                            </div>
                            <div class="c-left"></div>
                            <div class="c-right"></div>
                            <div id="buttonz">
                                <div class="header">       
                                    <h2>{$lang['off_points']} {$user['rpg_points']}</h2>
                                </div>
                                <div class="content">
                                    <p class="stimulus">
                                        Com os oficiais poderás levar o teu império a novos patamares - Tudo o que precisas é de alguma Matéria Negra e os teus trabalhadores e conselheiros trabalharão ainda com mais afinco!        </p>
                                    <ul id="building">
                                    {for $Officier=601 to 615}
                                        {$Result = IsOfficierAccessible($user, $Officier)}
                                        {if $Result != 0}
                                        <li class="button" id="button{$Officier - 600}">
                                            <div class="officier">
                                                <div class="officers100 officer{$Officier}">
                                                    <a tabindex="{$Officier - 600}" href="game.php?page=officier&desc={$Officier}" title="
                                                        {if $Result == 1}
                                                            {$lang['link'][$Officier]}
                                                        {else}
                                                            {$lang['Maxlvl']}
                                                        {/if}" ref="{$Officier - 600}" class="detail_button tooltip js_hideTipOnMobile slideIn">
                                                        <span class="ecke">
                                                            <span class="level">
                                                                <img src="images/{if $Result == 1}true{else}r1{/if}.png" width="12" height="11">
                                                            </span>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        {/if}
                                    {/for}
                                    </ul>
                                    <br class="clearfloat">      
                                    <div class="footer"></div>
                                </div>  
                            </div>
                        </div>
{/block}
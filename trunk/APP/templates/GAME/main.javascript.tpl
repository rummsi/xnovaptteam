
                    <!-- JAVASCRIPT -->
                    <script type='text/javascript' src='http://gf3.geo.gfsrv.net/cdnef/56996a817665f19c0402f4f3c32c00.js'></script>            <script type="text/javascript">
                var session = "3fac132d0d5bf86180b422c1a5ce678a73bf0dbd";
                var vacation = 0;
                var timerHandler = new TimerHandler();
                function redirectPremium()
                { 
                    location.href = "http://s114-pt.ogame.gameforge.com/game/index.php?page=premium&showDarkMatter=1";
                }
                var isMobile = false;
                var isMobileApp = false;
                var isMobileOnly = false;
                var isFacebookUser = false;
                var overlayWidth = 770;
                var overlayHeight = 600;
                var isRTLEnabled = 0;
                var activateToken = "167addb58433e00cf5302df2559d804f";
                var miniFleetToken = "6d8fbcca869cb8ff0be763f7acd85c65";
                var currentPage = "overview";
                var bbcodePreviewUrl = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=bbcodePreview";
                var popupWindows = [];
                var honorScore = 9558;
                var darkMatter = 4158;
       //         var serverTime = new Date(2014, 4, 6, 15, 23, 59);
       //         var localTime = new Date();
       //         var timeDiff = serverTime - localTime;
       //         localTS = localTime.getTime();
       //         var startServerTime = localTime.getTime() - (3600000) - localTime.getTimezoneOffset() * 60 * 1000;
       //         var LocalizationStrings = { "timeunits": { "short": { "year": "a", "month": "m", "week": "s", "day": "d", "hour": "h", "minute": "m", "second": "s" } }, "status": { "ready": "Conclu\u00eddo" }, "decimalPoint": ",", "thousandSeperator": ".", "unitMega": "M", "unitKilo": "K", "unitMilliard": "kM", "question": "Quest\u00e3o", "error": "Erro", "loading": "A carregar...", "yes": "sim", "no": "N\u00e3o", "ok": "Ok", "attention": "Cuidado", "outlawWarning": "Est\u00e1s prestes a atacar um jogador mais forte. Se o fizeres as tuas defesas de ataque ser\u00e3o desligadas por 7 dias e todos os jogadores te poder\u00e3o atacar sem serem punidos. Tens a certeza que queres continuar?", "lastSlotWarningMoon": "Este edif\u00edcio ira usar o \u00faltimo espa\u00e7o de constru\u00e7\u00e3o dispon\u00edvel. Expande a tua Base Lunar para receberes mais espa\u00e7o. Tens a certeza que pretendes construir este edif\u00edcio?", "lastSlotWarningPlanet": "Este edif\u00edcio ira usar o \u00faltimo espa\u00e7o de constru\u00e7\u00e3o dispon\u00edvel. Expande o teu Terra-Formador ou compra um item Campo de Planeta para receberes mais espa\u00e7os. Tens a certeza que pretendes construir este edif\u00edcio?", "forcedVacationWarning": "Algumas funcionalidades do jogo n\u00e3o est\u00e3o dispon\u00edveis at\u00e9 validares a tua conta.", "moreDetails": "Mais detalhes", "lessDetails": "Menos detalhes", "planetOrder": { "lock": "Bloquear ordena\u00e7\u00e3o", "unlock": "Desbloquear ordena\u00e7\u00e3o" }, "darkMatter": "Mat\u00e9ria Negra", "activateItem": { "upgradeItemQuestion": "Gostarias de substituir o item existente? O b\u00f3nus antigo ser\u00e1 perdido no processo.", "upgradeItemQuestionHeader": "Substituir item?" } };
                var constants = { "espionage": 6, "missleattack": 10, "language": "pt", "name": "114" };
                var userData = { "id": "110684" };
                var missleAttackLink = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=missileattacklayer&width=669&height=250";
                var showOutlawWarning = true;
                var miniFleetLink = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=minifleet&ajax=1";
                var ogameUrl = "http:\/\/s114-pt.ogame.gameforge.com";
                var startpageUrl = "http:\/\/pt.ogame.gameforge.com";
                OGConfig = new Array();
                OGConfig.sliderOn = 1;
                function redirectLogout() { 
                    location.href = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=logout";
                 }
                function redirectOverview() { 
                    location.href = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=overview";
                 }
                function initAjaxEventbox()
                { 
                    reloadEventbox({ "hostile": 0, "neutral": 0, "friendly": 0 });
                }
                function initAjaxResourcebox() { 
                    reloadResources({ "metal": { "resources": { "actualFormat": "7.573.482", "actual": 7573482, "max": 2920000, "production": 5.5427410118342 }, "tooltip": "Metal|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Dispon\u00edvel:<\/th>\n                <td><span class=\"overmark\">7.573.482<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Capacidade de Armazenamento:<\/th>\n                <td><span class=\"overmark\">2.920.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Produ\u00e7\u00e3o actual:<\/th>\n                <td><span class=\"overmark\">0<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Capacidade Den:<\/th>\n                <td><span class=\"overermark\">0<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "overmark" }, "crystal": { "resources": { "actualFormat": "2.207.837", "actual": 2207837, "max": 2920000, "production": 2.7561571365935 }, "tooltip": "Cristal|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Dispon\u00edvel:<\/th>\n                <td><span class=\"\">2.207.837<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Capacidade de Armazenamento:<\/th>\n                <td><span class=\"\">2.920.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Produ\u00e7\u00e3o actual:<\/th>\n                <td><span class=\"undermark\">+9.922<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Capacidade Den:<\/th>\n                <td><span class=\"overermark\">0<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "" }, "deuterium": { "resources": { "actualFormat": "1.102.616", "actual": 1102616, "max": 1590000, "production": 0.80647290424809 }, "tooltip": "Deut\u00e9rio|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Dispon\u00edvel:<\/th>\n                <td><span class=\"\">1.102.616<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Capacidade de Armazenamento:<\/th>\n                <td><span class=\"\">1.590.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Produ\u00e7\u00e3o actual:<\/th>\n                <td><span class=\"undermark\">+2.903<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Capacidade Den:<\/th>\n                <td><span class=\"overermark\">0<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "" }, "energy": { "resources": { "actual": -2644, "actualFormat": "-2.644" }, "tooltip": "Energia|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Dispon\u00edvel:<\/th>\n                <td><span class=\"overmark\">-2.644<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Produ\u00e7\u00e3o actual:<\/th>\n                <td><span class=\"undermark\">+8.075<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Consumo:<\/th>\n                <td><span class=\"overmark\">-10.719<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "overmark" }, "darkmatter": { "resources": { "actual": 4158, "actualFormat": "4.158" }, "string": "4.158 Mat\u00e9ria Negra", "tooltip": "Mat\u00e9ria Negra|<table class=\"resourceTooltip\">\n                <tr>\n                    <th>Dispon\u00edvel:<\/th>\n                    <td><span class=\"\">4.158<\/span><\/td>\n                <\/tr>\n                <tr>\n                    <th>Comprado:<\/th>\n                    <td><span class=\"\">500<\/span><\/td>\n                <\/tr>\n                <tr>\n                    <th>Encontrado:<\/th>\n                    <td><span class=\"\">3.658<\/span><\/td>\n                <\/tr>\n            <\/table>", "class": "" }, "honorScore": 9558 });
                }
                function getAjaxEventbox() { 
                    $.get("http://s114-pt.ogame.gameforge.com/game/index.php?page=fetchEventbox&ajax=1", reloadEventbox, "text");
                }
                function getAjaxResourcebox(callback) { 
                    $.get("http://s114-pt.ogame.gameforge.com/game/index.php?page=fetchResources&ajax=1", function(data) { 
                        reloadResources(data, callback);
                    }, "text");
                }
                var changeSettingsLink = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=changeSettings";
                var changeSettingsToken = "b6d1955ee1e296ef5d854139b9a9b50a";
                var eventlistLink = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=eventList&ajax=1";
                function openAnnouncement() { 
                    openOverlay("http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=announcement&ajax=1", { 'class': 'announcement', zIndex: 4000 });
                }
                var timeDelta = 1399386239000 - (new Date()).getTime();
                var LocalizationStrings = { "timeunits": { "short": { "year": "a", "month": "m", "week": "s", "day": "d", "hour": "h", "minute": "m", "second": "s" } }, "status": { "ready": "Conclu\u00eddo" }, "decimalPoint": ",", "thousandSeperator": ".", "unitMega": "M", "unitKilo": "K", "unitMilliard": "kM", "question": "Quest\u00e3o", "error": "Erro", "loading": "A carregar...", "yes": "sim", "no": "N\u00e3o", "ok": "Ok", "attention": "Cuidado", "outlawWarning": "Est\u00e1s prestes a atacar um jogador mais forte. Se o fizeres as tuas defesas de ataque ser\u00e3o desligadas por 7 dias e todos os jogadores te poder\u00e3o atacar sem serem punidos. Tens a certeza que queres continuar?", "lastSlotWarningMoon": "Este edif\u00edcio ira usar o \u00faltimo espa\u00e7o de constru\u00e7\u00e3o dispon\u00edvel. Expande a tua Base Lunar para receberes mais espa\u00e7o. Tens a certeza que pretendes construir este edif\u00edcio?", "lastSlotWarningPlanet": "Este edif\u00edcio ira usar o \u00faltimo espa\u00e7o de constru\u00e7\u00e3o dispon\u00edvel. Expande o teu Terra-Formador ou compra um item Campo de Planeta para receberes mais espa\u00e7os. Tens a certeza que pretendes construir este edif\u00edcio?", "forcedVacationWarning": "Algumas funcionalidades do jogo n\u00e3o est\u00e3o dispon\u00edveis at\u00e9 validares a tua conta.", "moreDetails": "Mais detalhes", "lessDetails": "Menos detalhes", "planetOrder": { "lock": "Bloquear ordena\u00e7\u00e3o", "unlock": "Desbloquear ordena\u00e7\u00e3o" }, "darkMatter": "Mat\u00e9ria Negra", "activateItem": { "upgradeItemQuestion": "Gostarias de substituir o item existente? O b\u00f3nus antigo ser\u00e1 perdido no processo.", "upgradeItemQuestionHeader": "Substituir item?" } };
                $(document).ready(function() { 
                    initEventTable();
                });
                var planetMoveLoca = { "askTitle": "Relocalizar o planeta", "askCancel": "Tem a certeza que quer cancelar esta recoloca\u00e7\u00e3o do planeta? O tempo normal de espera ir\u00e1 continuar o mesmo.", "yes": "sim", "no": "N\u00e3o", "success": "A recoloca\u00e7\u00e3o do planeta foi cancelada com sucesso.", "error": "Erro" };
                function openPlanetRenameGiveupBox()
                { 
                    openOverlay("http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=planetlayer", { title: "Abandonar\/Renomear SPIRIT", 'class': "planetRenameOverlay" });
                }
                var textContent = [];
                textContent[0] = "Di\u00e2metro:";
                textContent[1] = "13.832km (<span>171<\/span>\/<span>191<\/span>)";
                textContent[2] = "Temperatura";
                textContent[3] = "51 \u00b0C para 91\u00b0C";
                textContent[4] = "Coordenadas:";
                textContent[5] = "<a  href=\"http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=galaxy&galaxy=5&system=132&position=4\" >[5:132:4]<\/a>";
                textContent[6] = "Pontos:";
                textContent[7] = "<a href='http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=highscore'>534.497 (Posi\u00e7\u00e3o 274 de 1.021)<\/a>";
                textContent[8] = "Pontos de Honra:";
                textContent[9] = "9.558";
                var textDestination = [];
                textDestination[0] = "diameterField";
                textDestination[1] = "diameterContentField";
                textDestination[2] = "temperatureField";
                textDestination[3] = "temperatureContentField";
                textDestination[4] = "positionField";
                textDestination[5] = "positionContentField";
                textDestination[6] = "scoreField";
                textDestination[7] = "scoreContentField";
                textDestination[8] = "honorField";
                textDestination[9] = "honorContentField";
                var currentIndex = 0;
                var currentChar = 0;
                var linetwo = 0;
                var locaPremium = { "buildingHalfOverlay": "Queres reduzir o tempo de constru\u00e7\u00e3o em 50% do tempo total de constru\u00e7\u00e3o () por <b>750 Mat\u00e9ria Negra<\/b>?", "buildingFullOverlay": "Queres concluir imediatamente a constru\u00e7\u00e3o por <b>750 Mat\u00e9ria Negra<\/b>?", "shipsHalfOverlay": "Queres reduzir o tempo de constru\u00e7\u00e3o em 50% do tempo total de constru\u00e7\u00e3o () por <b>750 Mat\u00e9ria Negra<\/b>?", "shipsFullOverlay": "Queres concluir imediatamente a constru\u00e7\u00e3o por <b>750 Mat\u00e9ria Negra<\/b>?", "researchHalfOverlay": "Queres reduzir o tempo de pesquisa em 50% do tempo total de pesquisa () por <b>750 Mat\u00e9ria Negra<\/b>?", "researchFullOverlay": "Queres concluir imediatamente a pesquisa por <b>750 Mat\u00e9ria Negra<\/b>?" };
                var priceBuilding = 750;
                var priceResearch = 750;
                var priceShips = 750;
                var loca = loca || {  };
                loca = $.extend({  }, loca, { "error": "Erro", "errorNotEnoughDM": "N\u00e3o tens Mat\u00e9ria Negra suficiente! Queres comprar alguma agora?", "notice": "Refer\u00eancia", "planetGiveupQuestion": "Tens a certeza que pretendes abandonar o planeta %planetName% %planetCoordinates%?", "moonGiveupQuestion": "Tens a certeza que pretendes abandonar a lua %planetName% %planetCoordinates%?" });
                function type()
                { 
                    for (var i = 0; i < textDestination.length; i++) { 
                        document.getElementById(textDestination[i]).innerHTML = textContent[i];
                     }
                 }
                function planetRenamed(data)
                { 
                    var data = $.parseJSON(data);
                    if (data["status"]) { 
                        $("#planetNameHeader").html(data["newName"]);
                        reloadRightmenu("http://s114-pt.ogame.gameforge.com/game/index.php?page=rightmenu&renamed=1&pageToLink=overview");
                        $(".overlayDiv.planetRenameOverlay").dialog('close');
                     }
                    errorBoxAsArray(data["errorbox"]);
                }
                function reloadPage()
                { 
                    location.href = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=overview";
                }
                var demolish_id;
                var buildUrl;
                function loadDetails(type)
                { 
                    url = "http://s114-pt.ogame.gameforge.com/game/index.php?page=overview&ajax=1";
                    if (typeof (detailUrl) != 'undefined') { 
                        url = detailUrl;
                     }
                    $.get(url, { type: type }, function(data) { 
                        $("#detail").html(data);
                        $("#techDetailLoading").hide();
                        $("input[type='text']:first", document.forms["form"]).focus();
                     });
                }
                function sendBuildRequest(url, ev, showSlotWarning)
                { 
                    if (ev != undefined) { 
                        var keyCode;
                        if (window.event) { 
                            keyCode = window.event.keyCode;
                         } else if (ev) { 
                            keyCode = ev.which;
                         } else { 
                            return true;
                         }
                        if (keyCode != 13) { 
                            return true;
                         }
                     }
                    function build() { 
                        if (url == null) { 
                            sendForm();
                         } else { 
                            fastBuild();
                         }
                     }
                    if (url == null) { 
                        fallBackFunc = sendForm;
                     } else { 
                        fallBackFunc = build;
                        buildUrl = url;
                     }
                    if (showSlotWarning) { 
                        build();
                     } else { 
                        build();
                     }
                    return false;
                }
                function fastBuild() { 
                    location.href = buildUrl;
                    return false;
                }
                function sendForm() { 
                    document.form.submit();
                    return false;
                }
                function demolishBuilding(id, question) { 
                    demolish_id = id;
                    question += "<br/><br/>" + $("#demolish" + id).html();
                    errorBoxDecision("Cuidado", "" + question + "", "sim", "Não", demolishStart);
                }
                function demolishStart()
                { 
                    window.location.replace("http://s114-pt.ogame.gameforge.com/game/index.php?page=overview&modus=3&token=805ba7c7e01b099a87deaa2d17b3d252&type=" + demolish_id);
                }
                gfSlider = new GFSlider(getElementByIdWithCache('detailWrapper'));
                gfSlider.duration = 1;
                var detailUrl = "http:\/\/s114-pt.ogame.gameforge.com\/game\/index.php?page=buffActivation&ajax=1";
                var cancelProduction_id;
                var production_listid;
                function cancelProduction(id, listid, question)
                { 
                    cancelProduction_id = id;
                    production_listid = listid;
                    errorBoxDecision("Cuidado", "" + question + "", "sim", "N\u00e3o", cancelProductionStart);
                }
                function cancelProductionStart()
                { 
                    window.location.replace("http://s114-pt.ogame.gameforge.com/game/index.php?page=overview&modus=2&token=f6f13d597dd295d9dc0ef96ef9f5c99b&techid=" + cancelProduction_id + "&listid=" + production_listid);
                }
                function initType() { 
                    type();
                }
                new baulisteCountdown(getElementByIdWithCache("moveCountdown"), -1399386239);
                    $('#planet').find('h2 a').hover(function() { 
                        $('#planet').find('h2 a img').toggleClass('hinted');
                     }, function() { 
                        $('#planet').find('h2 a img').toggleClass('hinted');
                     });
                    var player = { hasCommander: true };
                    $(document).ready(function() { 
                        initIndex();
                        initAjaxEventbox();
                        initOverview();
                        initBuffBar();
                        initType();
                        tabletInitOverviewAdvice();
                    });
                    </script>     
                    <!-- END JAVASCRIPT -->
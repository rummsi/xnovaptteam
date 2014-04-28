
                    <!-- JAVASCRIPT -->
                    <script type="text/javascript" src="overview_moon_ficheiros/74f7703078308d0fa77b4d99b85843.js"></script>            <script type="text/javascript">
                var session = "a51ec7b15e9bbb85afe835888271e449c70dba94";
                var vacation = 0;
                var timerHandler = new TimerHandler();
                function redirectPremium()
                { 
                    location.href = "http://uni20.ogame.org/game/index.php?page=premium&showDarkMatter=1";
                 }
                var isMobile = false;
                var isMobileApp = false;
                var isMobileOnly = false;
                var isFacebookUser = false;
                var overlayWidth = 770;
                var overlayHeight = 600;
                var isRTLEnabled = 0;
                var activateToken = "aa1116b571d02122134a6d4865cea266";
                var miniFleetToken = "af00d92a88444e935a47acf8fd3cb308";
                var currentPage = "overview";
                var bbcodePreviewUrl = "http:\/\/uni20.ogame.org\/game\/index.php?page=bbcodePreview";
                var popupWindows = [];
                var honorScore = 1111;
                var darkMatter = 29247;
       //         var serverTime = new Date(2013, 5, 29, 10, 28, 20);
       //         var localTime = new Date();
       //         var timeDiff = serverTime - localTime;
       //         localTS = localTime.getTime();
       //         var startServerTime = localTime.getTime() - (3600000) - localTime.getTimezoneOffset() * 60 * 1000;
       //         var LocalizationStrings = { "timeunits": { "short": { "year": "y", "month": "m", "week": "w", "day": "d", "hour": "h", "minute": "m", "second": "s" } }, "status": { "ready": "done" }, "decimalPoint": ".", "thousandSeperator": ".", "unitMega": "M", "unitKilo": "K", "unitMilliard": "Bn", "question": "Question", "error": "Error", "loading": "load...", "yes": "yes", "no": "No", "ok": "Ok", "attention": "Caution", "outlawWarning": "You are about to attack a stronger player. If you do this, your attack defences will be shut down for 7 days and all players will be able to attack you without punishment. Are you sure you want to continue?", "lastSlotWarningMoon": "This building will use the last available building slot. Expand your Lunar Base to receive more space. Are you sure you want to build this building?", "lastSlotWarningPlanet": "This building will use the last available building slot. Expand your Terraformer or buy a Planet Field item to obtain more slots. Are you sure you want to build this building?", "forcedVacationWarning": "Some game features are unavailable until your account is validated.", "moreDetails": "More details", "lessDetails": "Less detail", "planetOrder": { "lock": "Lock arrangement", "unlock": "Unlock arrangement" }, "darkMatter": "Dark Matter", "activateItem": { "upgradeItemQuestion": "Would you like to replace the existing item? The old bonus will be lost in the process.", "upgradeItemQuestionHeader": "Replace item?" } };
                var constants = { "espionage": 6, "missleattack": 10, "language": "en", "name": "20" };
                var userData = { "id": "160649" };
                var missleAttackLink = "http:\/\/uni20.ogame.org\/game\/index.php?page=missileattacklayer&width=669&height=250";
                var showOutlawWarning = true;
                var miniFleetLink = "http:\/\/uni20.ogame.org\/game\/index.php?page=minifleet&ajax=1";
                var ogameUrl = "http:\/\/uni20.ogame.org";
                var startpageUrl = "http:\/\/ogame.org";
                OGConfig = new Array();
                OGConfig.sliderOn = 1;
                function redirectLogout() { 
                    location.href = "http:\/\/uni20.ogame.org\/game\/index.php?page=logout";
                 }
                function redirectOverview() { 
                    location.href = "http:\/\/uni20.ogame.org\/game\/index.php?page=overview";
                 }
                function initAjaxEventbox()
                { 
                    reloadEventbox({ "hostile": 0, "neutral": 0, "friendly": 0 });
                 }
                function initAjaxResourcebox() { 
                    reloadResources({ "metal": { "resources": { "actualFormat": "5.355.000", "actual": 5355000, "max": 5355000, "production": 4.110264790936 }, "tooltip": "Metal|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Available:<\/th>\n                <td><span class=\"overmark\">5.355.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Storage capacity:<\/th>\n                <td><span class=\"overmark\">5.355.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Current production:<\/th>\n                <td><span class=\"overmark\">0<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Den Capacity:<\/th>\n                <td><span class=\"overermark\">0<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "overmark" }, "crystal": { "resources": { "actualFormat": "3.281.061", "actual": 3281061, "max": 1590000, "production": 2.3510712135163 }, "tooltip": "Crystal|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Available:<\/th>\n                <td><span class=\"overmark\">3.281.061<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Storage capacity:<\/th>\n                <td><span class=\"overmark\">1.590.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Current production:<\/th>\n                <td><span class=\"overmark\">0<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Den Capacity:<\/th>\n                <td><span class=\"overermark\">0<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "overmark" }, "deuterium": { "resources": { "actualFormat": "1.057.520", "actual": 1057520, "max": 470000, "production": 0.90821420225863 }, "tooltip": "Deuterium|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Available:<\/th>\n                <td><span class=\"overmark\">1.057.520<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Storage capacity:<\/th>\n                <td><span class=\"overmark\">470.000<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Current production:<\/th>\n                <td><span class=\"overmark\">0<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Den Capacity:<\/th>\n                <td><span class=\"overermark\">0<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "overmark" }, "energy": { "resources": { "actual": 10, "actualFormat": "10" }, "tooltip": "Energy|<table class=\"resourceTooltip\">\n            <tr>\n                <th>Available:<\/th>\n                <td><span class=\"\">10<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Current production:<\/th>\n                <td><span class=\"undermark\">+12.768<\/span><\/td>\n            <\/tr>\n            <tr>\n                <th>Consumption:<\/th>\n                <td><span class=\"overmark\">-12.758<\/span><\/td>\n            <\/tr>\n        <\/table>", "class": "" }, "darkmatter": { "resources": { "actual": 29247, "actualFormat": "29.247" }, "string": "29.247 Dark Matter", "tooltip": "Dark Matter|<table class=\"resourceTooltip\">\n                <tr>\n                    <th>Available:<\/th>\n                    <td><span class=\"\">29.247<\/span><\/td>\n                <\/tr>\n                <tr>\n                    <th>Purchased:<\/th>\n                    <td><span class=\"\">24.500<\/span><\/td>\n                <\/tr>\n                <tr>\n                    <th>Found:<\/th>\n                    <td><span class=\"\">4.747<\/span><\/td>\n                <\/tr>\n            <\/table>", "class": "" }, "honorScore": 1111 });
                 }
                function getAjaxEventbox() { 
                    $.get("http://uni20.ogame.org/game/index.php?page=fetchEventbox&ajax=1", reloadEventbox, "text");
                 }
                function getAjaxResourcebox(callback) { 
                    $.get("http://uni20.ogame.org/game/index.php?page=fetchResources&ajax=1", function(data) { 
                        reloadResources(data, callback);
                     }, "text");
                 }
                var changeSettingsLink = "http:\/\/uni20.ogame.org\/game\/index.php?page=changeSettings";
                var changeSettingsToken = "f3e39969e12aaa94d50396a65b2a0746";
                var eventlistLink = "http:\/\/uni20.ogame.org\/game\/index.php?page=eventList&ajax=1";
                function openAnnouncement() { 
                    openOverlay("http:\/\/uni20.ogame.org\/game\/index.php?page=announcement&ajax=1", { 'class': 'announcement', zIndex: 4000 });
                 }
                var timeDelta = 1372498100000 - (new Date()).getTime();
                var LocalizationStrings = { "timeunits": { "short": { "year": "y", "month": "m", "week": "w", "day": "d", "hour": "h", "minute": "m", "second": "s" } }, "status": { "ready": "done" }, "decimalPoint": ".", "thousandSeperator": ".", "unitMega": "M", "unitKilo": "K", "unitMilliard": "Bn", "question": "Question", "error": "Error", "loading": "load...", "yes": "yes", "no": "No", "ok": "Ok", "attention": "Caution", "outlawWarning": "You are about to attack a stronger player. If you do this, your attack defences will be shut down for 7 days and all players will be able to attack you without punishment. Are you sure you want to continue?", "lastSlotWarningMoon": "This building will use the last available building slot. Expand your Lunar Base to receive more space. Are you sure you want to build this building?", "lastSlotWarningPlanet": "This building will use the last available building slot. Expand your Terraformer or buy a Planet Field item to obtain more slots. Are you sure you want to build this building?", "forcedVacationWarning": "Some game features are unavailable until your account is validated.", "moreDetails": "More details", "lessDetails": "Less detail", "planetOrder": { "lock": "Lock arrangement", "unlock": "Unlock arrangement" }, "darkMatter": "Dark Matter", "activateItem": { "upgradeItemQuestion": "Would you like to replace the existing item? The old bonus will be lost in the process.", "upgradeItemQuestionHeader": "Replace item?" } };
                $(document).ready(function() { 
                    initEventTable();
                 });
                var planetMoveLoca = { "askTitle": "Resettle Planet", "askCancel": "Are you sure that you wish to cancel this planet relocation? The normal waiting time will thereby be maintained.", "yes": "yes", "no": "No", "success": "The planet relocation was successfully cancelled.", "error": "Error" };
                function openPlanetRenameGiveupBox()
                { 
                    openOverlay("http:\/\/uni20.ogame.org\/game\/index.php?page=planetlayer", { title: "abandon\/rename Selva178", 'class': "planetRenameOverlay" });
                 }
                var textContent = new Array();
                textContent[0] = "Diameter:";
                textContent[1] = "13.344km (<span>174<\/span>\/<span>189<\/span>)";
                textContent[2] = "Temperature:";
                textContent[3] = "-84\u00b0C to -44\u00b0C";
                textContent[4] = "Position:";
                textContent[5] = "<a  href=\"http:\/\/uni20.ogame.org\/game\/index.php?page=galaxy&galaxy=2&system=356&position=14\" >[2:356:14]<\/a>";
                textContent[6] = "Points:";
                textContent[7] = "<a href='http:\/\/uni20.ogame.org\/game\/index.php?page=highscore'>1.152.623 (Place 584 of 1.155)<\/a>";
                textContent[8] = "Honour points:";
                textContent[9] = "1.111"
                var textDestination = new Array();
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
                var locaPremium = { "buildingHalfOverlay": "Do you want to reduce the construction time by 50% of the total construction time () for <b>750 Dark Matter<\/b>?", "buildingFullOverlay": "Do you want to immediately complete the construction order for <b>750 Dark Matter<\/b>?", "shipsHalfOverlay": "Do you want to reduce the construction time by 50% of the total construction time () for <b>750 Dark Matter<\/b>?", "shipsFullOverlay": "Do you want to immediately complete the construction order for <b>750 Dark Matter<\/b>?", "researchHalfOverlay": "Do you want to reduce the research time by 50% of the total research time () for <b>750 Dark Matter<\/b>?", "researchFullOverlay": "Do you want to immediately complete the research order for <b>750 Dark Matter<\/b>?" };
                var priceBuilding = 750;
                var priceResearch = 750;
                var priceShips = 750;
                var loca = { "error": "Error", "errorNotEnoughDM": "Not enough Dark Matter available! Do you want to buy some now?", "notice": "Reference", "planetGiveupQuestion": "Are you sure you want to give up the planet %planetName% %planetCoordinates%?", "moonGiveupQuestion": "Are you sure you want to give up the moon %planetName% %planetCoordinates%?" };
                function type()
                { 
                    var destination = document.getElementById(textDestination[currentIndex]);
                    if (destination) { 
                        if (textContent[currentIndex].substr(currentChar, 1) == "<" && linetwo != 1) { 
                            while (textContent[currentIndex].substr(currentChar, 1) != ">") { 
                                currentChar++;
                             }
                         }
                        if (linetwo == 1) { 
                            destination.innerHTML = textContent[currentIndex];
                            currentChar = destination.innerHTML = textContent[currentIndex].length + 1;
                         } else { 
                            destination.innerHTML = textContent[currentIndex].substr(0, currentChar) + "_";
                            currentChar++;
                         }
                        if (currentChar > textContent[currentIndex].length) { 
                            destination.innerHTML = textContent[currentIndex];
                            currentIndex++;
                            currentChar = 0;
                            if (currentIndex < textContent.length) { 
                                type();
                             }
                         } else { 
                            setTimeout("type()", 15);
                         }
                     }
                 }
                function planetRenamed(data)
                { 
                    var data = $.parseJSON(data);
                    if (data["status"]) { 
                        $("#planetNameHeader").html(data["newName"]);
                        reloadRightmenu("http://uni20.ogame.org/game/index.php?page=rightmenu&renamed=1&pageToLink=overview");
                        $(".overlayDiv.planetRenameOverlay").dialog('close');
                     }
                    errorBoxAsArray(data["errorbox"]);
                 }
                function reloadPage()
                { 
                    location.href = "http:\/\/uni20.ogame.org\/game\/index.php?page=overview";
                 }
                var demolish_id;
                var buildUrl;
                function loadDetails(type)
                { 
                    url = "http://uni20.ogame.org/game/index.php?page=overview&ajax=1";
                    if (typeof (detailUrl) != 'undefined') { 
                        url = detailUrl;
                     }
                    $.post(url, { type: type }, function(data) { 
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
                    errorBoxDecision("Caution", "" + question + "", "yes", "No", demolishStart);
                 }
                function demolishStart()
                { 
                    window.location.replace("http://uni20.ogame.org/game/index.php?page=overview&modus=3&token=f17bc41d6a7f1f16d1aa42bcef1c97eb&type=" + demolish_id);
                 }
                gfSlider = new GFSlider(getElementByIdWithCache('detailWrapper'));
                gfSlider.duration = 1;
                var detailUrl = "http:\/\/uni20.ogame.org\/game\/index.php?page=buffActivation&ajax=1";
                var cancelProduction_id;
                var production_listid;
                function cancelProduction(id, listid, question)
                { 
                    cancelProduction_id = id;
                    production_listid = listid;
                    errorBoxDecision("Caution", "" + question + "", "yes", "No", cancelProductionStart);
                 }
                function cancelProductionStart()
                { 
                    window.location.replace("http://uni20.ogame.org/game/index.php?page=overview&modus=2&token=9d83c8cb837e6c2eb1c1c8f57b615383&techid=" + cancelProduction_id + "&listid=" + production_listid);
                 }
                function initType() { 
                    type();
                 }
                new baulisteCountdown(getElementByIdWithCache("moveCountdown"), -1372498100);
                $('#planet h2 a').hover(function() { 
                    $('#planet h2 a img').toggleClass('hinted');
                 }, function() { 
                    $('#planet h2 a img').toggleClass('hinted');
                 });
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
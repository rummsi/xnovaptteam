/* 
 * XNovaPT
 * Copyright (C) 2012
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should read the GNU General Public License, see <http://www.gnu.org/licenses/>.
 * 
 * XNovaPT
 * @author XNovaPT Team <xnovaptteam@gmail.com>
 * @javascript-mouse-wheel_v3.0.6.js
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 0.01  10/Mai/2014 22:19:43
 */

/*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 * 
 * Requires: 1.2.2+
 */
(function(g) {
    var e = ["DOMMouseScroll", "mousewheel"];
    if (g.event.fixHooks) {
        for (var f = e.length; f; ) {
            g.event.fixHooks[e[--f]] = g.event.mouseHooks
        }
    }
    g.event.special.mousewheel = {setup: function() {
            if (this.addEventListener) {
                for (var a = e.length; a; ) {
                    this.addEventListener(e[--a], h, false)
                }
            } else {
                this.onmousewheel = h
            }
        }, teardown: function() {
            if (this.removeEventListener) {
                for (var a = e.length; a; ) {
                    this.removeEventListener(e[--a], h, false)
                }
            } else {
                this.onmousewheel = null
            }
        }};
    g.fn.extend({mousewheel: function(a) {
            return a ? this.bind("mousewheel", a) : this.trigger("mousewheel")
        }, unmousewheel: function(a) {
            return this.unbind("mousewheel", a)
        }});
    function h(b) {
        var d = b || window.event, n = [].slice.call(arguments, 1), a = 0, c = true, o = 0, p = 0;
        b = g.event.fix(d);
        b.type = "mousewheel";
        if (d.wheelDelta) {
            a = d.wheelDelta / 120
        }
        if (d.detail) {
            a = -d.detail / 3
        }
        p = a;
        if (d.axis !== undefined && d.axis === d.HORIZONTAL_AXIS) {
            p = 0;
            o = -1 * a
        }
        if (d.wheelDeltaY !== undefined) {
            p = d.wheelDeltaY / 120
        }
        if (d.wheelDeltaX !== undefined) {
            o = -1 * d.wheelDeltaX / 120
        }
        n.unshift(b, a, o, p);
        return(g.event.dispatch || g.event.handle).apply(this, n)
    }}
)(jQuery);
(function($) {
    $.extend({tablesorter: new function() {
            var parsers = [], widgets = [];
            this.defaults = {cssHeader: "header", cssAsc: "headerSortUp", cssDesc: "headerSortDown", cssChildRow: "expand-child", sortInitialOrder: "asc", sortMultiSortKey: "shiftKey", sortForce: null, sortAppend: null, sortLocaleCompare: true, textExtraction: "simple", parsers: {}, widgets: [], widgetZebra: {css: ["even", "odd"]}, headers: {}, widthFixed: false, cancelSelection: true, sortList: [], headerList: [], dateFormat: "us", decimal: "/.|,/g", onRenderHeader: null, selectorHeaders: "thead th", debug: false};
            function benchmark(s, d) {
                log(s + "," + (new Date().getTime() - d.getTime()) + "ms")
            }
            this.benchmark = benchmark;
            function log(s) {
                if (typeof console != "undefined" && typeof console.debug != "undefined") {
                    console.log(s)
                } else {
                    alert(s)
                }
            }
            function buildParserCache(table, $headers) {
                if (table.config.debug) {
                    var parsersDebug = ""
                }
                if (table.tBodies.length == 0) {
                    return
                }
                var rows = table.tBodies[0].rows;
                if (rows[0]) {
                    var list = [], cells = rows[0].cells, l = cells.length;
                    for (var i = 0; i < l; i++) {
                        var p = false;
                        if ($.metadata && ($($headers[i]).metadata() && $($headers[i]).metadata().sorter)) {
                            p = getParserById($($headers[i]).metadata().sorter)
                        } else {
                            if ((table.config.headers[i] && table.config.headers[i].sorter)) {
                                p = getParserById(table.config.headers[i].sorter)
                            }
                        }
                        if (!p) {
                            p = detectParserForColumn(table, rows, -1, i)
                        }
                        if (table.config.debug) {
                            parsersDebug += "column:" + i + " parser:" + p.id + "\n"
                        }
                        list.push(p)
                    }
                }
                if (table.config.debug) {
                    log(parsersDebug)
                }
                return list
            }
            function detectParserForColumn(table, rows, rowIndex, cellIndex) {
                var l = parsers.length, node = false, nodeValue = false, keepLooking = true;
                while (nodeValue == "" && keepLooking) {
                    rowIndex++;
                    if (rows[rowIndex]) {
                        node = getNodeFromRowAndCellIndex(rows, rowIndex, cellIndex);
                        nodeValue = trimAndGetNodeText(table.config, node);
                        if (table.config.debug) {
                            log("Checking if value was empty on row:" + rowIndex)
                        }
                    } else {
                        keepLooking = false
                    }
                }
                for (var i = 1; i < l; i++) {
                    if (parsers[i].is(nodeValue, table, node)) {
                        return parsers[i]
                    }
                }
                return parsers[0]
            }
            function getNodeFromRowAndCellIndex(rows, rowIndex, cellIndex) {
                return rows[rowIndex].cells[cellIndex]
            }
            function trimAndGetNodeText(config, node) {
                return $.trim(getElementText(config, node))
            }
            function getParserById(name) {
                var l = parsers.length;
                for (var i = 0; i < l; i++) {
                    if (parsers[i].id.toLowerCase() == name.toLowerCase()) {
                        return parsers[i]
                    }
                }
                return false
            }
            function buildCache(table) {
                if (table.config.debug) {
                    var cacheTime = new Date()
                }
                var totalRows = (table.tBodies[0] && table.tBodies[0].rows.length) || 0, totalCells = (table.tBodies[0].rows[0] && table.tBodies[0].rows[0].cells.length) || 0, parsers = table.config.parsers, cache = {row: [], normalized: []};
                for (var i = 0; i < totalRows; ++i) {
                    var c = $(table.tBodies[0].rows[i]), cols = [];
                    if (c.hasClass(table.config.cssChildRow)) {
                        cache.row[cache.row.length - 1] = cache.row[cache.row.length - 1].add(c);
                        continue
                    }
                    cache.row.push(c);
                    for (var j = 0; j < totalCells; ++j) {
                        cols.push(parsers[j].format(getElementText(table.config, c[0].cells[j]), table, c[0].cells[j]))
                    }
                    cols.push(cache.normalized.length);
                    cache.normalized.push(cols);
                    cols = null
                }
                if (table.config.debug) {
                    benchmark("Building cache for " + totalRows + " rows:", cacheTime)
                }
                return cache
            }
            function getElementText(config, node) {
                var text = "";
                if (!node) {
                    return""
                }
                if (!config.supportsTextContent) {
                    config.supportsTextContent = node.textContent || false
                }
                if (config.textExtraction == "simple") {
                    if (config.supportsTextContent) {
                        text = node.textContent
                    } else {
                        if (node.childNodes[0] && node.childNodes[0].hasChildNodes()) {
                            text = node.childNodes[0].innerHTML
                        } else {
                            text = node.innerHTML
                        }
                    }
                } else {
                    if (typeof (config.textExtraction) == "function") {
                        text = config.textExtraction(node)
                    } else {
                        text = $(node).text()
                    }
                }
                return text
            }
            function appendToTable(table, cache) {
                if (table.config.debug) {
                    var appendTime = new Date()
                }
                var c = cache, r = c.row, n = c.normalized, totalRows = n.length, checkCell = (n[0].length - 1), tableBody = $(table.tBodies[0]), rows = [];
                for (var i = 0; i < totalRows; i++) {
                    var pos = n[i][checkCell];
                    rows.push(r[pos]);
                    if (!table.config.appender) {
                        var l = r[pos].length;
                        for (var j = 0; j < l; j++) {
                            tableBody[0].appendChild(r[pos][j])
                        }
                    }
                }
                if (table.config.appender) {
                    table.config.appender(table, rows)
                }
                rows = null;
                if (table.config.debug) {
                    benchmark("Rebuilt table:", appendTime)
                }
                applyWidget(table);
                setTimeout(function() {
                    $(table).trigger("sortEnd")
                }, 0)
            }
            function buildHeaders(table) {
                if (table.config.debug) {
                    var time = new Date()
                }
                var meta = ($.metadata) ? true : false;
                var header_index = computeTableHeaderCellIndexes(table);
                $tableHeaders = $(table.config.selectorHeaders, table).each(function(index) {
                    this.column = header_index[this.parentNode.rowIndex + "-" + this.cellIndex];
                    this.order = formatSortingOrder(table.config.sortInitialOrder);
                    this.count = this.order;
                    if (checkHeaderMetadata(this) || checkHeaderOptions(table, index)) {
                        this.sortDisabled = true
                    }
                    if (checkHeaderOptionsSortingLocked(table, index)) {
                        this.order = this.lockedOrder = checkHeaderOptionsSortingLocked(table, index)
                    }
                    if (!this.sortDisabled) {
                        var $th = $(this).addClass(table.config.cssHeader);
                        if (table.config.onRenderHeader) {
                            table.config.onRenderHeader.apply($th)
                        }
                    }
                    table.config.headerList[index] = this
                });
                if (table.config.debug) {
                    benchmark("Built headers:", time);
                    log($tableHeaders)
                }
                return $tableHeaders
            }
            function computeTableHeaderCellIndexes(t) {
                var matrix = [];
                var lookup = {};
                var thead = t.getElementsByTagName("THEAD")[0];
                var trs = thead.getElementsByTagName("TR");
                for (var i = 0; i < trs.length; i++) {
                    var cells = trs[i].cells;
                    for (var j = 0; j < cells.length; j++) {
                        var c = cells[j];
                        var rowIndex = c.parentNode.rowIndex;
                        var cellId = rowIndex + "-" + c.cellIndex;
                        var rowSpan = c.rowSpan || 1;
                        var colSpan = c.colSpan || 1;
                        var firstAvailCol;
                        if (typeof (matrix[rowIndex]) == "undefined") {
                            matrix[rowIndex] = []
                        }
                        for (var k = 0; k < matrix[rowIndex].length + 1; k++) {
                            if (typeof (matrix[rowIndex][k]) == "undefined") {
                                firstAvailCol = k;
                                break
                            }
                        }
                        lookup[cellId] = firstAvailCol;
                        for (var k = rowIndex; k < rowIndex + rowSpan; k++) {
                            if (typeof (matrix[k]) == "undefined") {
                                matrix[k] = []
                            }
                            var matrixrow = matrix[k];
                            for (var l = firstAvailCol; l < firstAvailCol + colSpan; l++) {
                                matrixrow[l] = "x"
                            }
                        }
                    }
                }
                return lookup
            }
            function checkCellColSpan(table, rows, row) {
                var arr = [], r = table.tHead.rows, c = r[row].cells;
                for (var i = 0; i < c.length; i++) {
                    var cell = c[i];
                    if (cell.colSpan > 1) {
                        arr = arr.concat(checkCellColSpan(table, headerArr, row++))
                    } else {
                        if (table.tHead.length == 1 || (cell.rowSpan > 1 || !r[row + 1])) {
                            arr.push(cell)
                        }
                    }
                }
                return arr
            }
            function checkHeaderMetadata(cell) {
                if (($.metadata) && ($(cell).metadata().sorter === false)) {
                    return true
                }
                return false
            }
            function checkHeaderOptions(table, i) {
                if ((table.config.headers[i]) && (table.config.headers[i].sorter === false)) {
                    return true
                }
                return false
            }
            function checkHeaderOptionsSortingLocked(table, i) {
                if ((table.config.headers[i]) && (table.config.headers[i].lockedOrder)) {
                    return table.config.headers[i].lockedOrder
                }
                return false
            }
            function applyWidget(table) {
                var c = table.config.widgets;
                var l = c.length;
                for (var i = 0; i < l; i++) {
                    getWidgetById(c[i]).format(table)
                }
            }
            function getWidgetById(name) {
                var l = widgets.length;
                for (var i = 0; i < l; i++) {
                    if (widgets[i].id.toLowerCase() == name.toLowerCase()) {
                        return widgets[i]
                    }
                }
            }
            function formatSortingOrder(v) {
                if (typeof (v) != "Number") {
                    return(v.toLowerCase() == "desc") ? 1 : 0
                } else {
                    return(v == 1) ? 1 : 0
                }
            }
            function isValueInArray(v, a) {
                var l = a.length;
                for (var i = 0; i < l; i++) {
                    if (a[i][0] == v) {
                        return true
                    }
                }
                return false
            }
            function setHeadersCss(table, $headers, list, css) {
                $headers.removeClass(css[0]).removeClass(css[1]);
                var h = [];
                $headers.each(function(offset) {
                    if (!this.sortDisabled) {
                        h[this.column] = $(this)
                    }
                });
                var l = list.length;
                for (var i = 0; i < l; i++) {
                    h[list[i][0]].addClass(css[list[i][1]])
                }
            }
            function fixColumnWidth(table, $headers) {
                var c = table.config;
                if (c.widthFixed) {
                    var colgroup = $("<colgroup>");
                    $("tr:first td", table.tBodies[0]).each(function() {
                        colgroup.append($("<col>").css("width", $(this).width()))
                    });
                    $(table).prepend(colgroup)
                }
            }
            function updateHeaderSortCount(table, sortList) {
                var c = table.config, l = sortList.length;
                for (var i = 0; i < l; i++) {
                    var s = sortList[i], o = c.headerList[s[0]];
                    o.count = s[1];
                    o.count++
                }
            }
            function multisort(table, sortList, cache) {
                if (table.config.debug) {
                    var sortTime = new Date()
                }
                var dynamicExp = "var sortWrapper = function(a,b) {", l = sortList.length;
                for (var i = 0; i < l; i++) {
                    var c = sortList[i][0];
                    var order = sortList[i][1];
                    var s = (table.config.parsers[c].type == "text") ? ((order == 0) ? makeSortFunction("text", "asc", c) : makeSortFunction("text", "desc", c)) : ((order == 0) ? makeSortFunction("numeric", "asc", c) : makeSortFunction("numeric", "desc", c));
                    var e = "e" + i;
                    dynamicExp += "var " + e + " = " + s;
                    dynamicExp += "if(" + e + ") { return " + e + "; } ";
                    dynamicExp += "else { "
                }
                var orgOrderCol = cache.normalized[0].length - 1;
                dynamicExp += "return a[" + orgOrderCol + "]-b[" + orgOrderCol + "];";
                for (var i = 0; i < l; i++) {
                    dynamicExp += "}; "
                }
                dynamicExp += "return 0; ";
                dynamicExp += "}; ";
                if (table.config.debug) {
                    benchmark("Evaling expression:" + dynamicExp, new Date())
                }
                eval(dynamicExp);
                cache.normalized.sort(sortWrapper);
                if (table.config.debug) {
                    benchmark("Sorting on " + sortList.toString() + " and dir " + order + " time:", sortTime)
                }
                return cache
            }
            function makeSortFunction(type, direction, index) {
                var a = "a[" + index + "]", b = "b[" + index + "]";
                if (type == "text" && direction == "asc") {
                    return"(" + a + " == " + b + " ? 0 : (" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : (" + a + " < " + b + ") ? -1 : 1 )));"
                } else {
                    if (type == "text" && direction == "desc") {
                        return"(" + a + " == " + b + " ? 0 : (" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : (" + b + " < " + a + ") ? -1 : 1 )));"
                    } else {
                        if (type == "numeric" && direction == "asc") {
                            return"(" + a + " === null && " + b + " === null) ? 0 :(" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : " + a + " - " + b + "));"
                        } else {
                            if (type == "numeric" && direction == "desc") {
                                return"(" + a + " === null && " + b + " === null) ? 0 :(" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : " + b + " - " + a + "));"
                            }
                        }
                    }
                }
            }
            function makeSortText(i) {
                return"((a[" + i + "] < b[" + i + "]) ? -1 : ((a[" + i + "] > b[" + i + "]) ? 1 : 0));"
            }
            function makeSortTextDesc(i) {
                return"((b[" + i + "] < a[" + i + "]) ? -1 : ((b[" + i + "] > a[" + i + "]) ? 1 : 0));"
            }
            function makeSortNumeric(i) {
                return"a[" + i + "]-b[" + i + "];"
            }
            function makeSortNumericDesc(i) {
                return"b[" + i + "]-a[" + i + "];"
            }
            function sortText(a, b) {
                if (table.config.sortLocaleCompare) {
                    return a.localeCompare(b)
                }
                return((a < b) ? -1 : ((a > b) ? 1 : 0))
            }
            function sortTextDesc(a, b) {
                if (table.config.sortLocaleCompare) {
                    return b.localeCompare(a)
                }
                return((b < a) ? -1 : ((b > a) ? 1 : 0))
            }
            function sortNumeric(a, b) {
                return a - b
            }
            function sortNumericDesc(a, b) {
                return b - a
            }
            function getCachedSortType(parsers, i) {
                return parsers[i].type
            }
            this.construct = function(settings) {
                return this.each(function() {
                    if (!this.tHead || !this.tBodies) {
                        return
                    }
                    var $this, $document, $headers, cache, config, shiftDown = 0, sortOrder;
                    this.config = {};
                    config = $.extend(this.config, $.tablesorter.defaults, settings);
                    $this = $(this);
                    $.data(this, "tablesorter", config);
                    $headers = buildHeaders(this);
                    this.config.parsers = buildParserCache(this, $headers);
                    cache = buildCache(this);
                    var sortCSS = [config.cssDesc, config.cssAsc];
                    fixColumnWidth(this);
                    $headers.click(function(e) {
                        var totalRows = ($this[0].tBodies[0] && $this[0].tBodies[0].rows.length) || 0;
                        if (!this.sortDisabled && totalRows > 0) {
                            $this.trigger("sortStart");
                            var $cell = $(this);
                            var i = this.column;
                            this.order = this.count++ % 2;
                            if (this.lockedOrder) {
                                this.order = this.lockedOrder
                            }
                            if (!e[config.sortMultiSortKey]) {
                                config.sortList = [];
                                if (config.sortForce != null) {
                                    var a = config.sortForce;
                                    for (var j = 0; j < a.length; j++) {
                                        if (a[j][0] != i) {
                                            config.sortList.push(a[j])
                                        }
                                    }
                                }
                                config.sortList.push([i, this.order])
                            } else {
                                if (isValueInArray(i, config.sortList)) {
                                    for (var j = 0; j < config.sortList.length; j++) {
                                        var s = config.sortList[j], o = config.headerList[s[0]];
                                        if (s[0] == i) {
                                            o.count = s[1];
                                            o.count++;
                                            s[1] = o.count % 2
                                        }
                                    }
                                } else {
                                    config.sortList.push([i, this.order])
                                }
                            }
                            setTimeout(function() {
                                setHeadersCss($this[0], $headers, config.sortList, sortCSS);
                                appendToTable($this[0], multisort($this[0], config.sortList, cache))
                            }, 1);
                            return false
                        }
                    }).mousedown(function() {
                        if (config.cancelSelection) {
                            this.onselectstart = function() {
                                return false
                            };
                            return false
                        }
                    });
                    $this.bind("update", function() {
                        var me = this;
                        setTimeout(function() {
                            me.config.parsers = buildParserCache(me, $headers);
                            cache = buildCache(me)
                        }, 1)
                    }).bind("updateCell", function(e, cell) {
                        var config = this.config;
                        var pos = [(cell.parentNode.rowIndex - 1), cell.cellIndex];
                        cache.normalized[pos[0]][pos[1]] = config.parsers[pos[1]].format(getElementText(config, cell), cell)
                    }).bind("sorton", function(e, list) {
                        $(this).trigger("sortStart");
                        config.sortList = list;
                        var sortList = config.sortList;
                        updateHeaderSortCount(this, sortList);
                        setHeadersCss(this, $headers, sortList, sortCSS);
                        appendToTable(this, multisort(this, sortList, cache))
                    }).bind("appendCache", function() {
                        appendToTable(this, cache)
                    }).bind("applyWidgetId", function(e, id) {
                        getWidgetById(id).format(this)
                    }).bind("applyWidgets", function() {
                        applyWidget(this)
                    });
                    if ($.metadata && ($(this).metadata() && $(this).metadata().sortlist)) {
                        config.sortList = $(this).metadata().sortlist
                    }
                    if (config.sortList.length > 0) {
                        $this.trigger("sorton", [config.sortList])
                    }
                    applyWidget(this)
                })
            };
            this.addParser = function(parser) {
                var l = parsers.length, a = true;
                for (var i = 0; i < l; i++) {
                    if (parsers[i].id.toLowerCase() == parser.id.toLowerCase()) {
                        a = false
                    }
                }
                if (a) {
                    parsers.push(parser)
                }
            };
            this.addWidget = function(widget) {
                widgets.push(widget)
            };
            this.formatFloat = function(s) {
                var i = parseFloat(s);
                return(isNaN(i)) ? 0 : i
            };
            this.formatInt = function(s) {
                var i = parseInt(s);
                return(isNaN(i)) ? 0 : i
            };
            this.isDigit = function(s, config) {
                return/^[-+]?\d*$/.test($.trim(s.replace(/[,.']/g, "")))
            };
            this.clearTableBody = function(table) {
                if ($.browser.msie) {
                    function empty() {
                        while (this.firstChild) {
                            this.removeChild(this.firstChild)
                        }
                    }
                    empty.apply(table.tBodies[0])
                } else {
                    table.tBodies[0].innerHTML = ""
                }
            }
        }});
    $.fn.extend({tablesorter: $.tablesorter.construct});
    var ts = $.tablesorter;
    ts.addParser({id: "text", is: function(s) {
            return true
        }, format: function(s) {
            return $.trim(s.toLocaleLowerCase())
        }, type: "text"});
    ts.addParser({id: "digit", is: function(s, table) {
            var c = table.config;
            return $.tablesorter.isDigit(s, c)
        }, format: function(s) {
            return $.tablesorter.formatFloat(s)
        }, type: "numeric"});
    ts.addParser({id: "currency", is: function(s) {
            return/^[£$€?.]/.test(s)
        }, format: function(s) {
            return $.tablesorter.formatFloat(s.replace(new RegExp(/[£$€]/g), ""))
        }, type: "numeric"});
    ts.addParser({id: "ipAddress", is: function(s) {
            return/^\d{2,3}[\.]\d{2,3}[\.]\d{2,3}[\.]\d{2,3}$/.test(s)
        }, format: function(s) {
            var a = s.split("."), r = "", l = a.length;
            for (var i = 0; i < l; i++) {
                var item = a[i];
                if (item.length == 2) {
                    r += "0" + item
                } else {
                    r += item
                }
            }
            return $.tablesorter.formatFloat(r)
        }, type: "numeric"});
    ts.addParser({id: "url", is: function(s) {
            return/^(https?|ftp|file):\/\/$/.test(s)
        }, format: function(s) {
            return jQuery.trim(s.replace(new RegExp(/(https?|ftp|file):\/\//), ""))
        }, type: "text"});
    ts.addParser({id: "isoDate", is: function(s) {
            return/^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(s)
        }, format: function(s) {
            return $.tablesorter.formatFloat((s != "") ? new Date(s.replace(new RegExp(/-/g), "/")).getTime() : "0")
        }, type: "numeric"});
    ts.addParser({id: "percent", is: function(s) {
            return/\%$/.test($.trim(s))
        }, format: function(s) {
            return $.tablesorter.formatFloat(s.replace(new RegExp(/%/g), ""))
        }, type: "numeric"});
    ts.addParser({id: "usLongDate", is: function(s) {
            return s.match(new RegExp(/^[A-Za-z]{3,10}\.? [0-9]{1,2}, ([0-9]{4}|'?[0-9]{2}) (([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(AM|PM)))$/))
        }, format: function(s) {
            return $.tablesorter.formatFloat(new Date(s).getTime())
        }, type: "numeric"});
    ts.addParser({id: "shortDate", is: function(s) {
            return/\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}/.test(s)
        }, format: function(s, table) {
            var c = table.config;
            s = s.replace(/\-/g, "/");
            if (c.dateFormat == "us") {
                s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$1/$2")
            } else {
                if (c.dateFormat == "uk") {
                    s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$2/$1")
                } else {
                    if (c.dateFormat == "dd/mm/yy" || c.dateFormat == "dd-mm-yy") {
                        s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2})/, "$1/$2/$3")
                    }
                }
            }
            return $.tablesorter.formatFloat(new Date(s).getTime())
        }, type: "numeric"});
    ts.addParser({id: "time", is: function(s) {
            return/^(([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(am|pm)))$/.test(s)
        }, format: function(s) {
            return $.tablesorter.formatFloat(new Date("2000/01/01 " + s).getTime())
        }, type: "numeric"});
    ts.addParser({id: "metadata", is: function(s) {
            return false
        }, format: function(s, table, cell) {
            var c = table.config, p = (!c.parserMetadataName) ? "sortValue" : c.parserMetadataName;
            return $(cell).metadata()[p]
        }, type: "numeric"});
    ts.addWidget({id: "zebra", format: function(table) {
            if (table.config.debug) {
                var time = new Date()
            }
            var $tr, row = -1, odd;
            $("tr:visible", table.tBodies[0]).each(function(i) {
                $tr = $(this);
                if (!$tr.hasClass(table.config.cssChildRow)) {
                    row++
                }
                odd = (row % 2 == 0);
                $tr.removeClass(table.config.widgetZebra.css[odd ? 0 : 1]).addClass(table.config.widgetZebra.css[odd ? 1 : 0])
            });
            if (table.config.debug) {
                $.tablesorter.benchmark("Applying Zebra widget", time)
            }
        }})
})(jQuery);
(function(f) {
    var d = {init: function(b) {
            var a = this;
            if (!a.data("jqv") || a.data("jqv") == null) {
                b = d._saveOptions(a, b);
                f(document).on("click", ".formError", function() {
                    f(this).fadeOut(150, function() {
                        f(this).parent(".formErrorOuter").remove();
                        f(this).remove()
                    })
                })
            }
            return this
        }, attach: function(a) {
            var b = this;
            var c;
            if (a) {
                c = d._saveOptions(b, a)
            } else {
                c = b.data("jqv")
            }
            c.validateAttribute = (b.find("[data-validation-engine*=validate]").length) ? "data-validation-engine" : "class";
            if (c.binded) {
                b.on(c.validationEventTrigger, "[" + c.validateAttribute + "*=validate]:not([type=checkbox]):not([type=radio]):not(.datepicker)", d._onFieldEvent);
                b.on("click", "[" + c.validateAttribute + "*=validate][type=checkbox],[" + c.validateAttribute + "*=validate][type=radio]", d._onFieldEvent);
                b.on(c.validationEventTrigger, "[" + c.validateAttribute + "*=validate][class*=datepicker]", {delay: 300}, d._onFieldEvent)
            }
            if (c.autoPositionUpdate) {
                f(window).bind("resize", {noAnimation: true, formElem: b}, d.updatePromptsPosition)
            }
            b.on("click", "a[data-validation-engine-skip], a[class*='validate-skip'], button[data-validation-engine-skip], button[class*='validate-skip'], input[data-validation-engine-skip], input[class*='validate-skip']", d._submitButtonClick);
            b.removeData("jqv_submitButton");
            b.on("submit", d._onSubmitEvent);
            return this
        }, detach: function() {
            var a = this;
            var b = a.data("jqv");
            a.find("[" + b.validateAttribute + "*=validate]").not("[type=checkbox]").off(b.validationEventTrigger, d._onFieldEvent);
            a.find("[" + b.validateAttribute + "*=validate][type=checkbox],[class*=validate][type=radio]").off("click", d._onFieldEvent);
            a.off("submit", d._onSubmitEvent);
            a.removeData("jqv");
            a.off("click", "a[data-validation-engine-skip], a[class*='validate-skip'], button[data-validation-engine-skip], button[class*='validate-skip'], input[data-validation-engine-skip], input[class*='validate-skip']", d._submitButtonClick);
            a.removeData("jqv_submitButton");
            if (b.autoPositionUpdate) {
                f(window).off("resize", d.updatePromptsPosition)
            }
            return this
        }, validate: function() {
            var c = f(this);
            var a = null;
            if (c.is("form") || c.hasClass("validationEngineContainer")) {
                if (c.hasClass("validating")) {
                    return false
                } else {
                    c.addClass("validating");
                    var h = c.data("jqv");
                    var a = d._validateFields(this);
                    setTimeout(function() {
                        c.removeClass("validating")
                    }, 100);
                    if (a && h.onSuccess) {
                        h.onSuccess()
                    } else {
                        if (!a && h.onFailure) {
                            h.onFailure()
                        }
                    }
                }
            } else {
                if (c.is("form") || c.hasClass("validationEngineContainer")) {
                    c.removeClass("validating")
                } else {
                    var b = c.closest("form, .validationEngineContainer"), h = (b.data("jqv")) ? b.data("jqv") : f.validationEngine.defaults, a = d._validateField(c, h);
                    if (a && h.onFieldSuccess) {
                        h.onFieldSuccess()
                    } else {
                        if (h.onFieldFailure && h.InvalidFields.length > 0) {
                            h.onFieldFailure()
                        }
                    }
                }
            }
            if (h.onValidationComplete) {
                return !!h.onValidationComplete(b, a)
            }
            return a
        }, updatePromptsPosition: function(a) {
            if (a && this == window) {
                var b = a.data.formElem;
                var h = a.data.noAnimation
            } else {
                var b = f(this.closest("form, .validationEngineContainer"))
            }
            var c = b.data("jqv");
            b.find("[" + c.validateAttribute + "*=validate]").not(":disabled").each(function() {
                var g = f(this);
                if (c.prettySelect && g.is(":hidden")) {
                    g = b.find("#" + c.usePrefix + g.attr("id") + c.useSuffix)
                }
                var n = d._getPrompt(g);
                var m = f(n).find(".formErrorContent").html();
                if (n) {
                    d._updatePrompt(g, f(n), m, undefined, false, c, h)
                }
            });
            return this
        }, showPrompt: function(m, c, a, l) {
            var b = this.closest("form, .validationEngineContainer");
            var n = b.data("jqv");
            if (!n) {
                n = d._saveOptions(this, n)
            }
            if (a) {
                n.promptPosition = a
            }
            n.showArrow = l == true;
            d._showPrompt(this, m, c, false, n);
            return this
        }, hide: function() {
            var a = f(this).closest("form, .validationEngineContainer");
            var c = a.data("jqv");
            var b = (c && c.fadeDuration) ? c.fadeDuration : 0.3;
            var h;
            if (f(this).is("form") || f(this).hasClass("validationEngineContainer")) {
                h = "parentForm" + d._getClassName(f(this).attr("id"))
            } else {
                h = d._getClassName(f(this).attr("id")) + "formError"
            }
            f("." + h).fadeTo(b, 0.3, function() {
                f(this).parent(".formErrorOuter").remove();
                f(this).remove()
            });
            return this
        }, hideAll: function() {
            var b = this;
            var c = b.data("jqv");
            var a = c ? c.fadeDuration : 300;
            f(".formError").fadeTo(a, 300, function() {
                f(this).parent(".formErrorOuter").remove();
                f(this).remove()
            });
            return this
        }, _onFieldEvent: function(b) {
            var a = f(this);
            var c = a.closest("form, .validationEngineContainer");
            var h = c.data("jqv");
            h.eventTrigger = "field";
            window.setTimeout(function() {
                d._validateField(a, h);
                if (h.InvalidFields.length == 0 && h.onFieldSuccess) {
                    h.onFieldSuccess()
                } else {
                    if (h.InvalidFields.length > 0 && h.onFieldFailure) {
                        h.onFieldFailure()
                    }
                }
            }, (b.data) ? b.data.delay : 0)
        }, _onSubmitEvent: function() {
            var a = f(this);
            var h = a.data("jqv");
            if (a.data("jqv_submitButton")) {
                var c = f("#" + a.data("jqv_submitButton"));
                if (c) {
                    if (c.length > 0) {
                        if (c.hasClass("validate-skip") || c.attr("data-validation-engine-skip") == "true") {
                            return true
                        }
                    }
                }
            }
            h.eventTrigger = "submit";
            var b = d._validateFields(a);
            if (b && h.ajaxFormValidation) {
                d._validateFormWithAjax(a, h);
                return false
            }
            if (h.onValidationComplete) {
                return !!h.onValidationComplete(a, b)
            }
            return b
        }, _checkAjaxStatus: function(a) {
            var b = true;
            f.each(a.ajaxValidCache, function(h, c) {
                if (!c) {
                    b = false;
                    return false
                }
            });
            return b
        }, _checkAjaxFieldStatus: function(b, a) {
            return a.ajaxValidCache[b] == true
        }, _validateFields: function(y) {
            var b = y.data("jqv");
            var x = false;
            y.trigger("jqv.form.validating");
            var a = null;
            y.find("[" + b.validateAttribute + "*=validate]").not(":disabled").each(function() {
                var g = f(this);
                var h = [];
                if (f.inArray(g.attr("name"), h) < 0) {
                    x |= d._validateField(g, b);
                    if (x && a == null) {
                        if (g.is(":hidden") && b.prettySelect) {
                            a = g = y.find("#" + b.usePrefix + d._jqSelector(g.attr("id")) + b.useSuffix)
                        } else {
                            if (g.data("jqv-prompt-at") instanceof jQuery) {
                                g = g.data("jqv-prompt-at")
                            } else {
                                if (g.data("jqv-prompt-at")) {
                                    g = f(g.data("jqv-prompt-at"))
                                }
                            }
                            a = g
                        }
                    }
                    if (b.doNotShowAllErrosOnSubmit) {
                        return false
                    }
                    h.push(g.attr("name"));
                    if (b.showOneMessage == true && x) {
                        return false
                    }
                }
            });
            y.trigger("jqv.form.result", [x]);
            if (x) {
                if (b.scroll) {
                    var c = a.offset().top;
                    var v = a.offset().left;
                    var s = b.promptPosition;
                    if (typeof (s) == "string" && s.indexOf(":") != -1) {
                        s = s.substring(0, s.indexOf(":"))
                    }
                    if (s != "bottomRight" && s != "bottomLeft") {
                        var u = d._getPrompt(a);
                        if (u) {
                            c = u.offset().top
                        }
                    }
                    if (b.scrollOffset) {
                        c -= b.scrollOffset
                    }
                    if (b.isOverflown) {
                        var B = f(b.overflownDIV);
                        if (!B.length) {
                            return false
                        }
                        var A = B.scrollTop();
                        var w = -parseInt(B.offset().top);
                        c += A + w - 5;
                        var r = f(b.overflownDIV + ":not(:animated)");
                        r.animate({scrollTop: c}, 1100, function() {
                            if (b.focusFirstField) {
                                a.focus()
                            }
                        })
                    } else {
                        f("html, body").animate({scrollTop: c}, 1100, function() {
                            if (b.focusFirstField) {
                                a.focus()
                            }
                        });
                        f("html, body").animate({scrollLeft: v}, 1100)
                    }
                } else {
                    if (b.focusFirstField) {
                        a.focus()
                    }
                }
                return false
            }
            return true
        }, _validateFormWithAjax: function(b, l) {
            var a = b.serialize();
            var c = (l.ajaxFormValidationMethod) ? l.ajaxFormValidationMethod : "GET";
            var m = (l.ajaxFormValidationURL) ? l.ajaxFormValidationURL : b.attr("action");
            var n = (l.dataType) ? l.dataType : "json";
            f.ajax({type: c, url: m, cache: false, dataType: n, data: a, form: b, methods: d, options: l, beforeSend: function() {
                    return l.onBeforeAjaxFormValidation(b, l)
                }, error: function(h, g) {
                    d._ajaxError(h, g)
                }, success: function(w) {
                    if ((n == "json") && (w !== true)) {
                        var y = false;
                        for (var x = 0; x < w.length; x++) {
                            var v = w[x];
                            var k = v[0];
                            var g = f(f("#" + k)[0]);
                            if (g.length == 1) {
                                var u = v[2];
                                if (v[1] == true) {
                                    if (u == "" || !u) {
                                        d._closePrompt(g)
                                    } else {
                                        if (l.allrules[u]) {
                                            var h = l.allrules[u].alertTextOk;
                                            if (h) {
                                                u = h
                                            }
                                        }
                                        if (l.showPrompts) {
                                            d._showPrompt(g, u, "pass", false, l, true)
                                        }
                                    }
                                } else {
                                    y |= true;
                                    if (l.allrules[u]) {
                                        var h = l.allrules[u].alertText;
                                        if (h) {
                                            u = h
                                        }
                                    }
                                    if (l.showPrompts) {
                                        d._showPrompt(g, u, "", false, l, true)
                                    }
                                }
                            }
                        }
                        l.onAjaxFormComplete(!y, b, w, l)
                    } else {
                        l.onAjaxFormComplete(true, b, w, l)
                    }
                }})
        }, _validateField: function(Y, R, F) {
            if (!Y.attr("id")) {
                Y.attr("id", "form-validation-field-" + f.validationEngine.fieldIdCounter);
                ++f.validationEngine.fieldIdCounter
            }
            if (!R.validateNonVisibleFields && (Y.is(":hidden") && !R.prettySelect || Y.parent().is(":hidden"))) {
                return false
            }
            var b = Y.attr(R.validateAttribute);
            var J = /validate\[(.*)\]/.exec(b);
            if (!J) {
                return false
            }
            var a = J[1];
            var G = a.split(/\[|,|\]/);
            var N = false;
            var T = Y.attr("name");
            var U = "";
            var L = "";
            var c = false;
            var H = false;
            R.isError = false;
            R.showArrow = true;
            if (R.maxErrorsPerField > 0) {
                H = true
            }
            var X = f(Y.closest("form, .validationEngineContainer"));
            for (var M = 0; M < G.length; M++) {
                G[M] = G[M].replace(" ", "");
                if (G[M] === "") {
                    delete G[M]
                }
            }
            for (var M = 0, P = 0; M < G.length; M++) {
                if (H && P >= R.maxErrorsPerField) {
                    if (!c) {
                        var S = f.inArray("required", G);
                        c = (S != -1 && S >= M)
                    }
                    break
                }
                var V = undefined;
                switch (G[M]) {
                    case"required":
                        c = true;
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._required);
                        break;
                    case"custom":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._custom);
                        break;
                    case"groupRequired":
                        var O = "[" + R.validateAttribute + "*=" + G[M + 1] + "]";
                        var W = X.find(O).eq(0);
                        if (W[0] != Y[0]) {
                            d._validateField(W, R, F);
                            R.showArrow = true
                        }
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._groupRequired);
                        if (V) {
                            c = true
                        }
                        R.showArrow = false;
                        break;
                    case"ajax":
                        V = d._ajax(Y, G, M, R);
                        if (V) {
                            L = "load"
                        }
                        break;
                    case"minSize":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._minSize);
                        break;
                    case"maxSize":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._maxSize);
                        break;
                    case"min":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._min);
                        break;
                    case"max":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._max);
                        break;
                    case"past":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._past);
                        break;
                    case"future":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._future);
                        break;
                    case"dateRange":
                        var O = "[" + R.validateAttribute + "*=" + G[M + 1] + "]";
                        R.firstOfGroup = X.find(O).eq(0);
                        R.secondOfGroup = X.find(O).eq(1);
                        if (R.firstOfGroup[0].value || R.secondOfGroup[0].value) {
                            V = d._getErrorMessage(X, Y, G[M], G, M, R, d._dateRange)
                        }
                        if (V) {
                            c = true
                        }
                        R.showArrow = false;
                        break;
                    case"dateTimeRange":
                        var O = "[" + R.validateAttribute + "*=" + G[M + 1] + "]";
                        R.firstOfGroup = X.find(O).eq(0);
                        R.secondOfGroup = X.find(O).eq(1);
                        if (R.firstOfGroup[0].value || R.secondOfGroup[0].value) {
                            V = d._getErrorMessage(X, Y, G[M], G, M, R, d._dateTimeRange)
                        }
                        if (V) {
                            c = true
                        }
                        R.showArrow = false;
                        break;
                    case"maxCheckbox":
                        Y = f(X.find("input[name='" + T + "']"));
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._maxCheckbox);
                        break;
                    case"minCheckbox":
                        Y = f(X.find("input[name='" + T + "']"));
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._minCheckbox);
                        break;
                    case"equals":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._equals);
                        break;
                    case"funcCall":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._funcCall);
                        break;
                    case"creditCard":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._creditCard);
                        break;
                    case"condRequired":
                        V = d._getErrorMessage(X, Y, G[M], G, M, R, d._condRequired);
                        if (V !== undefined) {
                            c = true
                        }
                        break;
                    default:
                }
                var Q = false;
                if (typeof V == "object") {
                    switch (V.status) {
                        case"_break":
                            Q = true;
                            break;
                        case"_error":
                            V = V.message;
                            break;
                        case"_error_no_prompt":
                            return true;
                            break;
                        default:
                            break
                        }
                }
                if (Q) {
                    break
                }
                if (typeof V == "string") {
                    U += V + "<br/>";
                    R.isError = true;
                    P++
                }
            }
            if (!c && !(Y.val()) && Y.val().length < 1) {
                R.isError = false
            }
            var K = Y.prop("type");
            var Z = Y.data("promptPosition") || R.promptPosition;
            if ((K == "radio" || K == "checkbox") && X.find("input[name='" + T + "']").size() > 1) {
                if (Z === "inline") {
                    Y = f(X.find("input[name='" + T + "'][type!=hidden]:last"))
                } else {
                    Y = f(X.find("input[name='" + T + "'][type!=hidden]:first"))
                }
                R.showArrow = false
            }
            if (Y.is(":hidden") && R.prettySelect) {
                Y = X.find("#" + R.usePrefix + d._jqSelector(Y.attr("id")) + R.useSuffix)
            }
            if (R.isError && R.showPrompts) {
                d._showPrompt(Y, U, L, false, R)
            } else {
                if (!N) {
                    d._closePrompt(Y)
                }
            }
            if (!N) {
                Y.trigger("jqv.field.result", [Y, R.isError, U])
            }
            var I = f.inArray(Y[0], R.InvalidFields);
            if (I == -1) {
                if (R.isError) {
                    R.InvalidFields.push(Y[0])
                }
            } else {
                if (!R.isError) {
                    R.InvalidFields.splice(I, 1)
                }
            }
            d._handleStatusCssClasses(Y, R);
            if (R.isError && R.onFieldFailure) {
                R.onFieldFailure(Y)
            }
            if (!R.isError && R.onFieldSuccess) {
                R.onFieldSuccess(Y)
            }
            return R.isError
        }, _handleStatusCssClasses: function(a, b) {
            if (b.addSuccessCssClassToField) {
                a.removeClass(b.addSuccessCssClassToField)
            }
            if (b.addFailureCssClassToField) {
                a.removeClass(b.addFailureCssClassToField)
            }
            if (b.addSuccessCssClassToField && !b.isError) {
                a.addClass(b.addSuccessCssClassToField)
            }
            if (b.addFailureCssClassToField && b.isError) {
                a.addClass(b.addFailureCssClassToField)
            }
        }, _getErrorMessage: function(E, c, v, a, A, F, u) {
            var x = jQuery.inArray(v, a);
            if (v === "custom" || v === "funcCall") {
                var b = a[x + 1];
                v = v + "[" + b + "]";
                delete (a[x])
            }
            var D = v;
            var C = (c.attr("data-validation-engine")) ? c.attr("data-validation-engine") : c.attr("class");
            var y = C.split(" ");
            var w;
            if (v == "future" || v == "past" || v == "maxCheckbox" || v == "minCheckbox") {
                w = u(E, c, a, A, F)
            } else {
                w = u(c, a, A, F)
            }
            if (w != undefined) {
                var B = d._getCustomErrorMessage(f(c), y, D, F);
                if (B) {
                    w = B
                }
            }
            return w
        }, _getCustomErrorMessage: function(c, r, o, a) {
            var q = false;
            var s = /^custom\[.*\]$/.test(o) ? d._validityProp.custom : d._validityProp[o];
            if (s != undefined) {
                q = c.attr("data-errormessage-" + s);
                if (q != undefined) {
                    return q
                }
            }
            q = c.attr("data-errormessage");
            if (q != undefined) {
                return q
            }
            var u = "#" + c.attr("id");
            if (typeof a.custom_error_messages[u] != "undefined" && typeof a.custom_error_messages[u][o] != "undefined") {
                q = a.custom_error_messages[u][o]["message"]
            } else {
                if (r.length > 0) {
                    for (var p = 0; p < r.length && r.length > 0; p++) {
                        var b = "." + r[p];
                        if (typeof a.custom_error_messages[b] != "undefined" && typeof a.custom_error_messages[b][o] != "undefined") {
                            q = a.custom_error_messages[b][o]["message"];
                            break
                        }
                    }
                }
            }
            if (!q && typeof a.custom_error_messages[o] != "undefined" && typeof a.custom_error_messages[o]["message"] != "undefined") {
                q = a.custom_error_messages[o]["message"]
            }
            return q
        }, _validityProp: {required: "value-missing", custom: "custom-error", groupRequired: "value-missing", ajax: "custom-error", minSize: "range-underflow", maxSize: "range-overflow", min: "range-underflow", max: "range-overflow", past: "type-mismatch", future: "type-mismatch", dateRange: "type-mismatch", dateTimeRange: "type-mismatch", maxCheckbox: "range-overflow", minCheckbox: "range-underflow", equals: "pattern-mismatch", funcCall: "custom-error", creditCard: "pattern-mismatch", condRequired: "value-missing"}, _required: function(o, c, q, a, p) {
            switch (o.prop("type")) {
                case"text":
                case"password":
                case"textarea":
                case"file":
                case"select-one":
                case"select-multiple":
                default:
                    var b = f.trim(o.val());
                    var r = f.trim(o.attr("data-validation-placeholder"));
                    if ((!b) || (r && b == r)) {
                        return a.allrules[c[q]].alertText
                    }
                    break;
                case"radio":
                case"checkbox":
                    if (p) {
                        if (!o.attr("checked")) {
                            return a.allrules[c[q]].alertTextCheckboxMultiple
                        }
                        break
                    }
                    var s = o.closest("form, .validationEngineContainer");
                    var u = o.attr("name");
                    if (s.find("input[name='" + u + "']:checked").size() == 0) {
                        if (s.find("input[name='" + u + "']:visible").size() == 1) {
                            return a.allrules[c[q]].alertTextCheckboxe
                        } else {
                            return a.allrules[c[q]].alertTextCheckboxMultiple
                        }
                    }
                    break
                }
        }, _groupRequired: function(c, a, m, n) {
            var b = "[" + n.validateAttribute + "*=" + a[m + 1] + "]";
            var l = false;
            c.closest("form, .validationEngineContainer").find(b).each(function() {
                if (!d._required(f(this), a, m, n)) {
                    l = true;
                    return false
                }
            });
            if (!l) {
                return n.allrules[a[m]].alertText
            }
        }, _custom: function(c, b, s, a) {
            var u = b[s + 1];
            var p = a.allrules[u];
            var o;
            if (!p) {
                alert("jqv:custom rule not found - " + u);
                return
            }
            if (p.regex) {
                var q = p.regex;
                if (!q) {
                    alert("jqv:custom regex not found - " + u);
                    return
                }
                var r = new RegExp(q);
                if (!r.test(c.val())) {
                    return a.allrules[u].alertText
                }
            } else {
                if (p.func) {
                    o = p.func;
                    if (typeof (o) !== "function") {
                        alert("jqv:custom parameter 'function' is no function - " + u);
                        return
                    }
                    if (!o(c, b, s, a)) {
                        return a.allrules[u].alertText
                    }
                } else {
                    alert("jqv:custom type not allowed " + u);
                    return
                }
            }
        }, _funcCall: function(b, a, q, r) {
            var c = a[q + 1];
            var o;
            if (c.indexOf(".") > -1) {
                var n = c.split(".");
                var p = window;
                while (n.length) {
                    p = p[n.shift()]
                }
                o = p
            } else {
                o = window[c] || r.customFunctions[c]
            }
            if (typeof (o) == "function") {
                return o(b, a, q, r)
            }
        }, _equals: function(b, a, c, k) {
            var l = a[c + 1];
            if (b.val() != f("#" + l).val()) {
                return k.allrules.equals.alertText
            }
        }, _maxSize: function(b, a, m, n) {
            var o = a[m + 1];
            var p = b.val().length;
            if (p > o) {
                var c = n.allrules.maxSize;
                if (typeof c.alertText2 == "string") {
                    return c.alertText + min + c.alertText2
                } else {
                    return c.alertText
                }
            }
        }, _minSize: function(b, a, m, o) {
            var n = a[m + 1];
            var p = b.val().length;
            if (p < n) {
                var c = o.allrules.minSize;
                if (typeof c.alertText2 == "string") {
                    return c.alertText + n + c.alertText2
                } else {
                    return c.alertText
                }
            }
        }, _min: function(b, a, m, o) {
            var n = parseFloat(a[m + 1]);
            var p = parseFloat(b.val());
            if (p < n) {
                var c = o.allrules.min;
                if (c.alertText2) {
                    return c.alertText + n + c.alertText2
                }
                return c.alertText + n
            }
        }, _max: function(b, a, m, n) {
            var o = parseFloat(a[m + 1]);
            var p = parseFloat(b.val());
            if (p > o) {
                var c = n.allrules.max;
                if (c.alertText2) {
                    return c.alertText + o + c.alertText2
                }
                return c.alertText + o
            }
        }, _past: function(v, p, c, u, a) {
            var w = c[u + 1];
            var r = f(v.find("input[name='" + w.replace(/^#+/, "") + "']"));
            var s;
            if (w.toLowerCase() == "now") {
                s = new Date()
            } else {
                if (undefined != r.val()) {
                    if (r.is(":disabled")) {
                        return
                    }
                    s = d._parseDate(r.val())
                } else {
                    s = d._parseDate(w)
                }
            }
            var b = d._parseDate(p.val());
            if (b > s) {
                var q = a.allrules.past;
                if (q.alertText2) {
                    return q.alertText + d._dateToString(s) + q.alertText2
                }
                return q.alertText + d._dateToString(s)
            }
        }, _future: function(v, p, c, u, a) {
            var w = c[u + 1];
            var r = f(v.find("input[name='" + w.replace(/^#+/, "") + "']"));
            var s;
            if (w.toLowerCase() == "now") {
                s = new Date()
            } else {
                if (undefined != r.val()) {
                    if (r.is(":disabled")) {
                        return
                    }
                    s = d._parseDate(r.val())
                } else {
                    s = d._parseDate(w)
                }
            }
            var b = d._parseDate(p.val());
            if (b < s) {
                var q = a.allrules.future;
                if (q.alertText2) {
                    return q.alertText + d._dateToString(s) + q.alertText2
                }
                return q.alertText + d._dateToString(s)
            }
        }, _isDate: function(a) {
            var b = new RegExp(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/);
            return b.test(a)
        }, _isDateTime: function(a) {
            var b = new RegExp(/^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/);
            return b.test(a)
        }, _dateCompare: function(a, b) {
            return(new Date(a.toString()) < new Date(b.toString()))
        }, _dateRange: function(b, a, c, h) {
            if ((!h.firstOfGroup[0].value && h.secondOfGroup[0].value) || (h.firstOfGroup[0].value && !h.secondOfGroup[0].value)) {
                return h.allrules[a[c]].alertText + h.allrules[a[c]].alertText2
            }
            if (!d._isDate(h.firstOfGroup[0].value) || !d._isDate(h.secondOfGroup[0].value)) {
                return h.allrules[a[c]].alertText + h.allrules[a[c]].alertText2
            }
            if (!d._dateCompare(h.firstOfGroup[0].value, h.secondOfGroup[0].value)) {
                return h.allrules[a[c]].alertText + h.allrules[a[c]].alertText2
            }
        }, _dateTimeRange: function(b, a, c, h) {
            if ((!h.firstOfGroup[0].value && h.secondOfGroup[0].value) || (h.firstOfGroup[0].value && !h.secondOfGroup[0].value)) {
                return h.allrules[a[c]].alertText + h.allrules[a[c]].alertText2
            }
            if (!d._isDateTime(h.firstOfGroup[0].value) || !d._isDateTime(h.secondOfGroup[0].value)) {
                return h.allrules[a[c]].alertText + h.allrules[a[c]].alertText2
            }
            if (!d._dateCompare(h.firstOfGroup[0].value, h.secondOfGroup[0].value)) {
                return h.allrules[a[c]].alertText + h.allrules[a[c]].alertText2
            }
        }, _maxCheckbox: function(c, b, a, n, o) {
            var q = a[n + 1];
            var p = b.attr("name");
            var r = c.find("input[name='" + p + "']:checked").size();
            if (r > q) {
                o.showArrow = false;
                if (o.allrules.maxCheckbox.alertText2) {
                    return o.allrules.maxCheckbox.alertText + " " + q + " " + o.allrules.maxCheckbox.alertText2
                }
                return o.allrules.maxCheckbox.alertText
            }
        }, _minCheckbox: function(c, b, a, n, o) {
            var q = a[n + 1];
            var p = b.attr("name");
            var r = c.find("input[name='" + p + "']:checked").size();
            if (r < q) {
                o.showArrow = false;
                return o.allrules.minCheckbox.alertText + " " + q + " " + o.allrules.minCheckbox.alertText2
            }
        }, _creditCard: function(q, c, v, a) {
            var x = false, b = q.val().replace(/ +/g, "").replace(/-+/g, "");
            var y = b.length;
            if (y >= 14 && y <= 16 && parseInt(b) > 0) {
                var u = 0, v = y - 1, r = 1, s, w = new String();
                do {
                    s = parseInt(b.charAt(v));
                    w += (r++ % 2 == 0) ? s * 2 : s
                } while (--v >= 0);
                for (v = 0; v < w.length; v++) {
                    u += parseInt(w.charAt(v))
                }
                x = u % 10 == 0
            }
            if (!x) {
                return a.allrules.creditCard.alertText
            }
        }, _ajax: function(b, I, A, H) {
            var J = I[A + 1];
            var c = H.allrules[J];
            var E = c.extraData;
            var x = c.extraDataDynamic;
            var B = {fieldId: b.attr("id"), fieldValue: b.val()};
            if (typeof E === "object") {
                f.extend(B, E)
            } else {
                if (typeof E === "string") {
                    var y = E.split("&");
                    for (var A = 0; A < y.length; A++) {
                        var a = y[A].split("=");
                        if (a[0] && a[0]) {
                            B[a[0]] = a[1]
                        }
                    }
                }
            }
            if (x) {
                var C = [];
                var w = String(x).split(",");
                for (var A = 0; A < w.length; A++) {
                    var G = w[A];
                    if (f(G).length) {
                        var F = b.closest("form, .validationEngineContainer").find(G).val();
                        var D = G.replace("#", "") + "=" + escape(F);
                        B[G.replace("#", "")] = F
                    }
                }
            }
            if (H.eventTrigger == "field") {
                delete (H.ajaxValidCache[b.attr("id")])
            }
            if (!H.isError && !d._checkAjaxFieldStatus(b.attr("id"), H)) {
                f.ajax({type: H.ajaxFormValidationMethod, url: c.url, cache: false, dataType: "json", data: B, field: b, rule: c, methods: d, options: H, beforeSend: function() {
                    }, error: function(h, g) {
                        d._ajaxError(h, g)
                    }, success: function(h) {
                        var l = h[0];
                        var n = f("#" + l).eq(0);
                        if (n.length == 1) {
                            var g = h[1];
                            var m = h[2];
                            if (!g) {
                                H.ajaxValidCache[l] = false;
                                H.isError = true;
                                if (m) {
                                    if (H.allrules[m]) {
                                        var k = H.allrules[m].alertText;
                                        if (k) {
                                            m = k
                                        }
                                    }
                                } else {
                                    m = c.alertText
                                }
                                if (H.showPrompts) {
                                    d._showPrompt(n, m, "", true, H)
                                }
                            } else {
                                H.ajaxValidCache[l] = true;
                                if (m) {
                                    if (H.allrules[m]) {
                                        var k = H.allrules[m].alertTextOk;
                                        if (k) {
                                            m = k
                                        }
                                    }
                                } else {
                                    m = c.alertTextOk
                                }
                                if (H.showPrompts) {
                                    if (m) {
                                        d._showPrompt(n, m, "pass", true, H)
                                    } else {
                                        d._closePrompt(n)
                                    }
                                }
                                if (H.eventTrigger == "submit") {
                                    b.closest("form").submit()
                                }
                            }
                        }
                        n.trigger("jqv.field.result", [n, H.isError, m])
                    }});
                return c.alertTextLoad
            }
        }, _ajaxError: function(b, a) {
            if (b.status == 0 && a == null) {
                alert("The page is not served from a server! ajax call failed")
            } else {
                if (typeof console != "undefined") {
                    console.log("Ajax error: " + b.status + " " + a)
                }
            }
        }, _dateToString: function(a) {
            return a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate()
        }, _parseDate: function(a) {
            var b = a.split("-");
            if (b == a) {
                b = a.split("/")
            }
            if (b == a) {
                b = a.split(".");
                return new Date(b[2], (b[1] - 1), b[0])
            }
            return new Date(b[0], (b[1] - 1), b[2])
        }, _showPrompt: function(a, c, b, m, n, o) {
            if (a.data("jqv-prompt-at") instanceof jQuery) {
                a = a.data("jqv-prompt-at")
            } else {
                if (a.data("jqv-prompt-at")) {
                    a = f(a.data("jqv-prompt-at"))
                }
            }
            var p = d._getPrompt(a);
            if (o) {
                p = false
            }
            if (f.trim(c)) {
                if (p) {
                    d._updatePrompt(a, p, c, b, m, n)
                } else {
                    d._buildPrompt(a, c, b, m, n)
                }
            }
        }, _buildPrompt: function(u, B, w, r, b) {
            var A = f("<div>");
            A.addClass(d._getClassName(u.attr("id")) + "formError");
            A.addClass("parentForm" + d._getClassName(u.closest("form, .validationEngineContainer").attr("id")));
            A.addClass("formError");
            switch (w) {
                case"pass":
                    A.addClass("greenPopup");
                    break;
                case"load":
                    A.addClass("blackPopup");
                    break;
                default:
            }
            if (r) {
                A.addClass("ajaxed")
            }
            var a = f("<div>").addClass("formErrorContent").html(B).appendTo(A);
            var x = u.data("promptPosition") || b.promptPosition;
            if (b.showArrow) {
                var s = f("<div>").addClass("formErrorArrow");
                if (typeof (x) == "string") {
                    var v = x.indexOf(":");
                    if (v != -1) {
                        x = x.substring(0, v)
                    }
                }
                switch (x) {
                    case"bottomLeft":
                    case"bottomRight":
                        A.find(".formErrorContent").before(s);
                        s.addClass("formErrorArrowBottom").html('<div class="line1"><!-- --></div><div class="line2"><!-- --></div><div class="line3"><!-- --></div><div class="line4"><!-- --></div><div class="line5"><!-- --></div><div class="line6"><!-- --></div><div class="line7"><!-- --></div><div class="line8"><!-- --></div><div class="line9"><!-- --></div><div class="line10"><!-- --></div>');
                        break;
                    case"topLeft":
                    case"topRight":
                        s.html('<div class="line10"><!-- --></div><div class="line9"><!-- --></div><div class="line8"><!-- --></div><div class="line7"><!-- --></div><div class="line6"><!-- --></div><div class="line5"><!-- --></div><div class="line4"><!-- --></div><div class="line3"><!-- --></div><div class="line2"><!-- --></div><div class="line1"><!-- --></div>');
                        A.append(s);
                        break
                    }
            }
            if (b.addPromptClass) {
                A.addClass(b.addPromptClass)
            }
            var c = u.attr("data-required-class");
            if (c !== undefined) {
                A.addClass(c)
            } else {
                if (b.prettySelect) {
                    if (f("#" + u.attr("id")).next().is("select")) {
                        var y = f("#" + u.attr("id").substr(b.usePrefix.length).substring(b.useSuffix.length)).attr("data-required-class");
                        if (y !== undefined) {
                            A.addClass(y)
                        }
                    }
                }
            }
            A.css({opacity: 0});
            if (x === "inline") {
                A.addClass("inline");
                if (typeof u.attr("data-prompt-target") !== "undefined" && f("#" + u.attr("data-prompt-target")).length > 0) {
                    A.appendTo(f("#" + u.attr("data-prompt-target")))
                } else {
                    u.after(A)
                }
            } else {
                u.before(A)
            }
            var v = d._calculatePosition(u, A, b);
            A.css({position: x === "inline" ? "relative" : "absolute", top: v.callerTopPosition, left: v.callerleftPosition, marginTop: v.marginTopSize, opacity: 0}).data("callerField", u);
            if (b.autoHidePrompt) {
                setTimeout(function() {
                    A.animate({opacity: 0}, function() {
                        A.closest(".formErrorOuter").remove();
                        A.remove()
                    })
                }, b.autoHideDelay)
            }
            return A.animate({opacity: 0.87})
        }, _updatePrompt: function(c, s, u, p, b, a, r) {
            if (s) {
                if (typeof p !== "undefined") {
                    if (p == "pass") {
                        s.addClass("greenPopup")
                    } else {
                        s.removeClass("greenPopup")
                    }
                    if (p == "load") {
                        s.addClass("blackPopup")
                    } else {
                        s.removeClass("blackPopup")
                    }
                }
                if (b) {
                    s.addClass("ajaxed")
                } else {
                    s.removeClass("ajaxed")
                }
                s.find(".formErrorContent").html(u);
                var o = d._calculatePosition(c, s, a);
                var q = {top: o.callerTopPosition, left: o.callerleftPosition, marginTop: o.marginTopSize};
                if (r) {
                    s.css(q)
                } else {
                    s.animate(q)
                }
            }
        }, _closePrompt: function(a) {
            var b = d._getPrompt(a);
            if (b) {
                b.fadeTo("fast", 0, function() {
                    b.parent(".formErrorOuter").remove();
                    b.remove()
                })
            }
        }, closePrompt: function(a) {
            return d._closePrompt(a)
        }, _getPrompt: function(b) {
            var a = f(b).closest("form, .validationEngineContainer").attr("id");
            var c = d._getClassName(b.attr("id")) + "formError";
            var h = f("." + d._escapeExpression(c) + ".parentForm" + d._getClassName(a))[0];
            if (h) {
                return f(h)
            }
        }, _escapeExpression: function(a) {
            return a.replace(/([#;&,\.\+\*\~':"\!\^$\[\]\(\)=>\|])/g, "\\$1")
        }, isRTL: function(b) {
            var a = f(document);
            var h = f("body");
            var c = (b && b.hasClass("rtl")) || (b && (b.attr("dir") || "").toLowerCase() === "rtl") || a.hasClass("rtl") || (a.attr("dir") || "").toLowerCase() === "rtl" || h.hasClass("rtl") || (h.attr("dir") || "").toLowerCase() === "rtl";
            return Boolean(c)
        }, _calculatePosition: function(c, D, H) {
            var E, b, x;
            var C = c.width();
            var G = c.position().left;
            var J = c.position().top;
            var F = c.height();
            var I = D.height();
            E = b = 0;
            x = -I;
            var y = c.data("promptPosition") || H.promptPosition;
            var A = "";
            var B = "";
            var a = 0;
            var w = 0;
            if (typeof (y) == "string") {
                if (y.indexOf(":") != -1) {
                    A = y.substring(y.indexOf(":") + 1);
                    y = y.substring(0, y.indexOf(":"));
                    if (A.indexOf(",") != -1) {
                        B = A.substring(A.indexOf(",") + 1);
                        A = A.substring(0, A.indexOf(","));
                        w = parseInt(B);
                        if (isNaN(w)) {
                            w = 0
                        }
                    }
                    a = parseInt(A);
                    if (isNaN(A)) {
                        A = 0
                    }
                }
            }
            switch (y) {
                default:
                case"topRight":
                    b += G + C - 30;
                    E += J;
                    break;
                case"topLeft":
                    E += J;
                    b += G;
                    break;
                case"centerRight":
                    E = J + 4;
                    x = 0;
                    b = G + c.outerWidth(true) + 5;
                    break;
                case"centerLeft":
                    b = G - (D.width() + 2);
                    E = J + 4;
                    x = 0;
                    break;
                case"bottomLeft":
                    E = J + c.height() + 5;
                    x = 0;
                    b = G;
                    break;
                case"bottomRight":
                    b = G + C - 30;
                    E = J + c.height() + 5;
                    x = 0;
                    break;
                case"inline":
                    b = 0;
                    E = 0;
                    x = 0
            }
            b += a;
            E += w;
            return{callerTopPosition: E + "px", callerleftPosition: b + "px", marginTopSize: x + "px"}
        }, _saveOptions: function(b, c) {
            if (f.validationEngineLanguage) {
                var h = f.validationEngineLanguage.allRules
            } else {
                f.error("jQuery.validationEngine rules are not loaded, plz add localization files to the page")
            }
            f.validationEngine.defaults.allrules = h;
            var a = f.extend(true, {}, f.validationEngine.defaults, c);
            b.data("jqv", a);
            return a
        }, _getClassName: function(a) {
            if (a) {
                return a.replace(/:/g, "_").replace(/\./g, "_")
            }
        }, _jqSelector: function(a) {
            return a.replace(/([;&,\.\+\*\~':"\!\^#$%@\[\]\(\)=>\|])/g, "\\$1")
        }, _condRequired: function(b, a, l, m) {
            var n, c;
            for (n = (l + 1); n < a.length; n++) {
                c = jQuery("#" + a[n]).first();
                if (c.length && d._required(c, ["required"], 0, m, true) == undefined) {
                    return d._required(b, ["required"], 0, m)
                }
            }
        }, _submitButtonClick: function(a) {
            var c = f(this);
            var b = c.closest("form, .validationEngineContainer");
            b.data("jqv_submitButton", c.attr("id"))
        }};
    f.fn.validationEngine = function(a) {
        var b = f(this);
        if (!b[0]) {
            return b
        }
        if (typeof (a) == "string" && a.charAt(0) != "_" && d[a]) {
            if (a != "showPrompt" && a != "hide" && a != "hideAll") {
                d.init.apply(b)
            }
            return d[a].apply(b, Array.prototype.slice.call(arguments, 1))
        } else {
            if (typeof a == "object" || !a) {
                d.init.apply(b, arguments);
                return d.attach.apply(b)
            } else {
                f.error("Method " + a + " does not exist in jQuery.validationEngine")
            }
        }
    };
    f.validationEngine = {fieldIdCounter: 0, defaults: {validationEventTrigger: "blur", scroll: true, focusFirstField: true, showPrompts: true, validateNonVisibleFields: false, promptPosition: "topRight", bindMethod: "bind", inlineAjax: false, ajaxFormValidation: false, ajaxFormValidationURL: false, ajaxFormValidationMethod: "get", onAjaxFormComplete: f.noop, onBeforeAjaxFormValidation: f.noop, onValidationComplete: false, doNotShowAllErrosOnSubmit: false, custom_error_messages: {}, binded: true, showArrow: true, isError: false, maxErrorsPerField: false, ajaxValidCache: {}, autoPositionUpdate: false, InvalidFields: [], onFieldSuccess: false, onFieldFailure: false, onSuccess: false, onFailure: false, validateAttribute: "class", addSuccessCssClassToField: "", addFailureCssClassToField: "", autoHidePrompt: false, autoHideDelay: 10000, fadeDuration: 0.3, prettySelect: false, addPromptClass: "", usePrefix: "", useSuffix: "", showOneMessage: false}};
    var e = {hook: "rightmiddle", hideOn: false, skin: "cloud", hideOthers: false};
    d._buildPrompt = function(a, c, b, k, l) {
        a.data("promptText", c);
        Tipped.create(a[0], c, e);
        Tipped.show(a[0])
    };
    d._closePrompt = function(a) {
        a.data("promptText", "");
        Tipped.remove(a[0])
    };
    d._updatePrompt = function(a, p, c, b, m, n, o) {
        if (a.data("promptText") != c) {
            d._closePrompt(a);
            d._buildPrompt(a, c)
        }
    };
    d._getPrompt = function(a) {
        return Tipped.get(a[0])
    };
    f(function() {
        f.validationEngine.defaults.promptPosition = d.isRTL() ? "topLeft" : "topRight"
    })
})(jQuery);
(function(b) {
    b.fn.wipetouch = function(d) {
        var a = {moveX: 40, moveY: 40, tapToClick: false, preventDefault: true, allowDiagonal: false, preventDefaultWhenTriggering: true, wipeLeft: false, wipeRight: false, wipeUp: false, wipeDown: false, wipeUpLeft: false, wipeDownLeft: false, wipeUpRight: false, wipeDownRight: false, wipeMove: false, wipeTopLeft: false, wipeBottomLeft: false, wipeTopRight: false, wipeBottomRight: false};
        if (d) {
            b.extend(a, d)
        }
        this.each(function() {
            var B;
            var C;
            var E = false;
            var F;
            var G;
            var x = false;
            var I = false;
            var J = false;
            var c = false;
            function D(f) {
                A();
                var e = J || (f.originalEvent.touches && f.originalEvent.touches.length > 0);
                if (!x && e) {
                    if (a.preventDefault) {
                        f.preventDefault()
                    }
                    if (a.allowDiagonal) {
                        if (!a.wipeDownLeft) {
                            a.wipeDownLeft = a.wipeBottomLeft
                        }
                        if (!a.wipeDownRight) {
                            a.wipeDownRight = a.wipeBottomRight
                        }
                        if (!a.wipeUpLeft) {
                            a.wipeUpLeft = a.wipeTopLeft
                        }
                        if (!a.wipeUpRight) {
                            a.wipeUpRight = a.wipeTopRight
                        }
                    }
                    if (J) {
                        B = f.pageX;
                        C = f.pageY;
                        b(this).bind("mousemove", H);
                        b(this).one("mouseup", v)
                    } else {
                        B = f.originalEvent.touches[0].pageX;
                        C = f.originalEvent.touches[0].pageY;
                        b(this).bind("touchmove", H)
                    }
                    E = new Date().getTime();
                    F = B;
                    G = C;
                    x = true;
                    I = b(f.target)
                }
            }
            function v(e) {
                if (a.preventDefault) {
                    e.preventDefault()
                }
                if (J) {
                    b(this).unbind("mousemove", H)
                } else {
                    b(this).unbind("touchmove", H)
                }
                if (x) {
                    y(e)
                } else {
                    A()
                }
            }
            function H(e) {
                if (a.preventDefault) {
                    e.preventDefault()
                }
                if (J && !x) {
                    D(e)
                }
                if (x) {
                    if (J) {
                        F = e.pageX;
                        G = e.pageY
                    } else {
                        F = e.originalEvent.touches[0].pageX;
                        G = e.originalEvent.touches[0].pageY
                    }
                    if (a.wipeMove) {
                        w(a.wipeMove, {curX: F, curY: G})
                    }
                }
            }
            function y(f) {
                var g = new Date().getTime();
                var p = E - g;
                var N = F;
                var e = G;
                var k = N - B;
                var o = e - C;
                var r = Math.abs(k);
                var l = Math.abs(o);
                if (r < 15 && l < 15 && p < 100) {
                    c = false;
                    if (a.preventDefault) {
                        A();
                        I.trigger("click");
                        return
                    }
                } else {
                    if (J) {
                        var q = I.data("events");
                        if (q) {
                            var s = q.click;
                            if (s && s.length > 0) {
                                b.each(s, function(K, L) {
                                    c = L;
                                    return
                                });
                                I.unbind("click")
                            }
                        }
                    }
                }
                var u = k > 0;
                var h = o > 0;
                var m = ((r + l) * 60) / ((p) / 6 * (p));
                if (m < 1) {
                    m = 1
                }
                if (m > 5) {
                    m = 5
                }
                var n = {speed: parseInt(m), x: r, y: l, source: I};
                if (r >= a.moveX) {
                    if (a.allowDiagonal && l >= a.moveY) {
                        if (u && h) {
                            w(a.wipeDownRight, n, f)
                        } else {
                            if (u && !h) {
                                w(a.wipeUpRight, n, f)
                            } else {
                                if (!u && h) {
                                    w(a.wipeDownLeft, n, f)
                                } else {
                                    w(a.wipeUpLeft, n, f)
                                }
                            }
                        }
                    } else {
                        if (r >= l) {
                            if (u) {
                                w(a.wipeRight, n, f)
                            } else {
                                w(a.wipeLeft, n, f)
                            }
                        }
                    }
                } else {
                    if (l >= a.moveY && l > r) {
                        if (h) {
                            w(a.wipeDown, n, f)
                        } else {
                            w(a.wipeUp, n, f)
                        }
                    }
                }
                A()
            }
            function A() {
                B = false;
                C = false;
                E = false;
                x = false;
                if (c) {
                    window.setTimeout(function() {
                        I.bind("click", c);
                        c = false
                    }, 50)
                }
            }
            function w(e, g, f) {
                if (e) {
                    if (a.preventDefaultWhenTriggering) {
                        f.preventDefault()
                    }
                    e(g)
                }
            }
            if ("ontouchstart" in document.documentElement) {
                b(this).bind("touchstart", D);
                b(this).bind("touchend", v)
            } else {
                J = true;
                b(this).bind("mousedown", D);
                b(this).bind("mouseout mouseup", v)
            }
        });
        return this
    }
})(jQuery);

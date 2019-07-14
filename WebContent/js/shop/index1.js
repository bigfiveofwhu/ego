! function (e, t, n) {
    t.MGTOOL = {}, e.extend(MGTOOL, {
        byteLength: function (e) {
            var t = e.match(/[^\x00-\x80]/g);
            return e.length + (t ? t.length : 0)
        }, jsMbSubstr: function (e, t) {
            if (!e || !t) return "";
            var n = 0,
                o = 0,
                r = "",
                i = e.length;
            for (o = 0; i > o; o++) {
                if (n = e.charCodeAt(o) > 255 ? n += 2 : ++n, n > 2 * t) return r;
                r += e.charAt(o)
            }
            return e
        }, formatMoney: function (e, t, n) {
            if (t = MGTOOL.empty(e) ? "2" : t, MGTOOL.empty(n)) return e.toFixed(t);
            var o = 0 > e ? "-" : "",
                r = parseInt(e = Math.abs(+e || 0).toFixed(t), 10) + "",
                i = (i = r.length) > 3 ? i % 3 : 0;
            return o + (i ? r.substr(0, i) + n : "") + r.substr(i).replace(/(\d{3})(?=\d)/g, "$1" + n) + (t ? "." + Math.abs(e - r).toFixed(t).slice(2) : "")
        }
    }), e.extend(MGTOOL, {
        emptyObj: function (e) {
            for (var t in e) return !1;
            return !0
        }, empty: function (e) {
            return null == e || 0 === e.length
        }, objToJson: function (e) {
            return JSON.stringify(e)
        }
    }), e.extend(MGTOOL, {
        setCookie: function (e, t, n) {
            n = n || {}, null === t && (t = "", n.expires = -1);
            var o = "";
            if (n.expires && ("number" == typeof n.expires || n.expires.toUTCString)) {
                var r;
                "number" == typeof n.expires ? (r = new Date, r.setTime(r.getTime() + 864e5 * n.expires)) : r = n.expires, o = "; expires=" + r.toUTCString()
            }
            var i = n.path ? "; path=" + n.path : "",
                u = n.secure ? "; secure" : "",
                a = "";
            n.domain ? a = "; domain=" + n.domain : (a = document.domain.toString().split("."), a = "; domain=." + a[1] + "." + a[2]), document.cookie = [e, "=", encodeURIComponent(t), o, i, a, u].join("")
        }, getCookie: function (e) {
            var t = document.cookie.match(new RegExp("(^| )" + e + "=([^;]*)(;|$)"));
            return null !== t ? decodeURIComponent(t[2]) : ""
        }, removeCookie: function (e) {
            MGTOOL.setCookie(e, null, {
                expires: -1
            })
        }, setCacheCookie: function (t, n, o, r) {
            o = o || {}, null === n && (n = "");
            var i = "undefined" == typeof r ? MGTOOL.getCookie("__mgjuuid") : r;
            e.ajax({
                url: "/collect/uedcookie",
                type: "POST",
                timeout: 6e4,
                data: {
                    cookiename: t,
                    uuid: i,
                    type: "set",
                    value: n,
                    lifetime: 86400 * o.expires
                },
                dataType: "json",
                success: function (e) {
                    "" === e && alert(MGLANG.msgTimeout)
                }
            })
        }, getCacheCookie: function (t, n) {
            var o = "undefined" == typeof n ? MGTOOL.getCookie("__mgjuuid") : n,
                r = "";
            return e.ajax({
                url: "/collect/uedcookie",
                type: "POST",
                timeout: 6e4,
                async: !1,
                data: {
                    cookiename: t,
                    uuid: o,
                    type: "get"
                },
                dataType: "json",
                success: function (e) {
                    var t = e.status.code;
                    e.status.msg;
                    if (1001 == t) {
                        var n = e.result.data.value;
                        r = n
                    } else alert(MGLANG.msgTimeout)
                }
            }), r
        }
    }), e.extend(MGTOOL, {
        getQueryString: function (e, t) {
            t = "undefined" != typeof t ? t : location.href;
            var n = new RegExp("(^|\\?|&)" + e + "=([^&]*)(\\s|&|$)", "i");
            return n.test(t) ? RegExp.$2.replace(/\+/g, " ") : ""
        }, getPicExtension: function (e) {
            return /(.+)\.(.+)/.exec(e) ? RegExp.$2 : ""
        }, filterDomain: function (e) {
            var t = /http:\/\/[^\/]+/;
            return e.replace(t, "")
        }
    }), e.extend(MGTOOL, {
        throttleM: {
            isLoading: !1,
            throttoleXhr: function (e, t) {
                var n = this;
                if (!n.isLoading) {
                    t = t || 500, n.isLoading = !0;
                    var o = e();
                    o.complete = function () {
                        setTimeout(function () {
                            n.isLoading = !1
                        }, t)
                    }
                }
            }
        }
    }), e.extend(MGTOOL, {
        getMsgLength: function (e) {
            var t = e.length;
            if (t > 0) {
                for (var n = 41, o = 140, r = 24, i = e, u = e.match(/http[s]?:\/\/[a-zA-Z0-9-]+(\.[a-zA-Z0-9]+)+([-A-Z0-9a-z_\$\.\+\!\*\(\)\/\/,:;@&=\?\~\#\%]*)*/gi) || [], a = 0, s = 0, c = u.length; c > s; s++) {
                    var l = MGTOOL.byteLength(u[s]);
                    /^(http:\/\/meilishuo.cn)/.test(u[s]) || (a += /^(http:\/\/)+(meilishuo.cn|meilishuo.com)/.test(u[s]) && n >= l ? l : o >= l ? r : l - o + r, i = i.replace(u[s], ""))
                }
                return Math.ceil((a + MGTOOL.byteLength(i)) / 2)
            }
            return 0
        }, getAbsoluteLocation: function (n) {
            if (1 !== arguments.length || null === n) return null;
            var o = e(n),
                r = o.offset(),
                i = r.top,
                u = r.left,
                a = o.height(),
                s = e(t).height(),
                c = e(document).scrollTop(),
                l = i >= c && c + s >= i,
                g = i + a + 200 >= c && c + s >= i - 400;
            return {
                absoluteTop: i,
                absoluteLeft: u,
                isInView: l,
                isLoad: g
            }
        }, distance2Bottom: function (n) {
            var o = e(document),
                r = e(t),
                i = o.scrollTop(),
                u = r.height(),
                a = o.height();
            return i + u + n >= a
        }, isParent: function (e, t) {
            for (; e !== n && null !== e && "BODY" != e.tagName.toUpperCase();) {
                if (e == t) return !0;
                e = e.parentNode
            }
            return !1
        }, template: function (e, t) {
            return doT.template(e)(t)
        }, log: function (e) {
            t.console !== n && console.log(e)
        }, dataFormat: function (e, t) {
            var n = {
                "M+": e.getMonth() + 1,
                "d+": e.getDate(),
                "h+": e.getHours(),
                "m+": e.getMinutes(),
                "s+": e.getSeconds(),
                "q+": Math.floor((e.getMonth() + 3) / 3),
                S: e.getMilliseconds()
            };
            /(y+)/.test(t) && (t = t.replace(RegExp.$1, (e.getFullYear() + "").substr(4 - RegExp.$1.length)));
            for (var o in n) new RegExp("(" + o + ")").test(t) && (t = t.replace(RegExp.$1, 1 == RegExp.$1.length ? n[o] : ("00" + n[o]).substr(("" + n[o]).length)));
            return t
        }
    }), e.extend(MGTOOL, {
        trim: function (t) {
            return e.trim(t)
        }, getRequest: function (e, t) {
            return this.getQueryString(e, t)
        }
    })
}(jQuery, window);
window.MOGU = window.MOGU || {},
    function (t, n) {
        var e = {};
        e.Util = {
            mask: function () {
                var n = t(".light_box_fullbg");
                n.length <= 0 && (n = t(['<div class="light_box_fullbg"></div>'].join("")), t("body").append(n))
            }, show: function (n, e) {
                var l, i, o, a = t("#vp_wrap"),
                    c = t(".light_box_fullbg").eq(0);
                a.length <= 0 && (a = t(['<div class="vp_wrap" id="vp_wrap">', '<h5 class="vp_t"></h5>', '<a href="javascript:;" class="vp_cls">×</a>', '<div class="v_pop_box"></div>', "</div>"].join("")), t("body").append(a), c.off("click").on("click", function () {
                    clearTimeout(o), a.addClass("vp_shake"), o = setTimeout(function () {
                        a.removeClass("vp_shake")
                    }, 500)
                })), e.isShowCloser ? a.find(".vp_cls").show() : a.find(".vp_cls").hide(), a.find(".vp_t").html(e.title), i = {
                    alert: function (n) {
                        return l = t(".vp_alert"), l.length <= 0 ? l = t(['<div class="vp_alert vp_inner">', '<p class="vp_cnt"></p>', '<a href="javascript:;" class="vp_btn vp_btn_' + n.btn.theme + ' vp_ok">' + n.btn.text + "</a>", "</div>"].join("")) : l.find(".vp_btn").removeClass("vp_btn_red").removeClass("vp_btn_normal").addClass("vp_btn_" + n.btn.theme).html(n.btn.text), l.show().find(".vp_cnt").html(n.content), l
                    }, confirm: function (n) {
                        if (l = t(".vp_cfm"), l.length <= 0) l = t(['<div class="vp_cfm vp_inner">', '<p class="vp_cnt"></p>', '<a href="javascript:;" class="vp_btn vp_btn_' + n.btn1.theme + ' vp_ok">' + n.btn1.text + "</a>", '<a href="javascript:;" class="vp_btn vp_btn_' + n.btn2.theme + ' vp_cancel">' + n.btn2.text + "</a>", "</div>"].join(""));
                        else {
                            var e = l.find(".vp_btn");
                            e.removeClass("vp_btn_red").removeClass("vp_btn_normal"), e.eq(0).addClass("vp_btn_" + n.btn1.theme).html(n.btn1.text), e.eq(1).addClass("vp_btn_" + n.btn2.theme).html(n.btn2.text)
                        }
                        return l.show().find(".vp_cnt").html(n.content), l
                    }
                }, a.find(".v_pop_box").append(i[n](e)), a.css({
                    display: "block",
                    opacity: 0
                }).css({
                    "margin-left": -a.width() / 2 - 1,
                    "margin-top": -a.height() / 2 - 1,
                    opacity: 1
                }), c.show()
            }, close: function (n, e) {
                t(".light_box_fullbg").eq(0).hide(), t("#vp_wrap").find(".vp_inner").hide().end().hide(), void 0 !== e && "function" == typeof e && e(n)
            }
        }, t.alert = function (n, l, i) {
            var o = t.extend(!0, {
                    title: "提示",
                    content: n,
                    btn: {
                        text: "确定",
                        theme: "red",
                        val: void 0
                    },
                    isShowCloser: !0,
                    close_val: void 0
                }, i),
                a = function () {
                    t("#vp_wrap").off("click").on("click", ".vp_ok", function (t) {
                        t.preventDefault(), e.Util.close(o.btn.val, l)
                    }).on("click", ".vp_cls", function (t) {
                        t.preventDefault(), e.Util.close(o.close_val, l)
                    })
                };
            ! function () {
                e.Util.mask(), e.Util.show("alert", o), a()
            }()
        }, t.confirm = function (n, l, i) {
            var o = t.extend(!0, {
                    title: "提示",
                    content: n,
                    btn1: {
                        text: "确定",
                        theme: "red",
                        val: !0
                    },
                    btn2: {
                        text: "取消",
                        theme: "normal",
                        val: !1
                    },
                    isShowCloser: !0,
                    close_val: !1
                }, i),
                a = function () {
                    t("#vp_wrap").off("click").on("click", ".vp_ok", function (t) {
                        t.preventDefault(), e.Util.close(o.btn1.val, l)
                    }).on("click", ".vp_cancel", function (t) {
                        t.preventDefault(), e.Util.close(o.btn2.val, l)
                    }).on("click", ".vp_cls", function (t) {
                        t.preventDefault(), e.Util.close(o.close_val, l)
                    })
                };
            ! function () {
                e.Util.mask(), e.Util.show("confirm", o), a()
            }()
        }, n.MOGU.alert = t.alert, n.MOGU.confirm = t.confirm
    }(jQuery, window);
var MOGU = MOGU || {};
! function (t) {
    MOGU.Globe_Textarea_Auto_Height = function (e) {
        var o = e.height(),
            i = function () {
                0 > o && (o = e.height()), (t.browser.mozilla || t.browser.safari) && e.height(o);
                var i = e[0].scrollHeight,
                    n = o > i ? o : i;
                n = 1.5 * o > n ? o : i, e.height(n)
            };
        e.bind("keyup", i).bind("input", i).bind("propertychange", i).bind("focus", i)
    }, MOGU.Globe_Goods_URL_Support = function (t) {
        var e = /item(.[\w]+)?.taobao.com\/(.?)[item.htm|item_num_id|item_detail|itemID|item_id|default_item_id]/i,
            o = /detail.tmall/i,
            i = /auction\d?.paipai.com/i,
            n = /buy.caomeipai.com\/goods/i,
            a = /www.360buy.com\/product/i,
            c = /product.dangdang.com\/Product.aspx\?product_id=/i,
            r = /book.360buy.com/i,
            s = /www.vancl.com\/StyleDetail/i,
            u = /www.vancl.com\/Product/i,
            l = /vt.vancl.com\/item/i,
            d = /item.vancl.com\/\d+/i,
            m = /item.vt.vancl.com\/\d+/i,
            w = /(mbaobao.com\/pshow)|(mbaobao.com\/item)/i,
            f = /item.buy.qq.com\/item/i,
            _ = /[www|us].topshop.com\/webapp\/wcs\/stores\/servlet\/ProductDisplay/i,
            p = /quwan.com\/goods/i,
            b = /nala.com.cn\/product/i,
            h = /maymay.cn\/pitem/i,
            v = /asos.com/i,
            g = /www.100f1.com\/ProductInfo_/i,
            y = /www.gaojie.com\/product/i,
            G = /a.m.taobao.com\/i/i,
            O = /www.51yugou.com\//i,
            M = /www.1mall.com\//i,
            U = /www.yihaodian.com\//i,
            k = /www.xipin.me\//i,
            j = /www.nuandao.com\//i,
            x = /www.rosebeauty.com.cn\//i,
            C = /www.hmeili.com\//i,
            T = /www.yueji.com\//i,
            L = /www.yougou.com\//i,
            S = /cn.shopbop.com\//i,
            I = /item.jd.com\//i,
            P = /[www|shop].meilishuo.com(.*)\/detail/i;
        return e.test(t) || o.test(t) || r.test(t) || a.test(t) || i.test(t) || n.test(t) || c.test(t) || s.test(t) || u.test(t) || l.test(t) || d.test(t) || m.test(t) || w.test(t) || _.test(t) || p.test(t) || b.test(t) || h.test(t) || v.test(t) || g.test(t) || y.test(t) || f.test(t) || G.test(t) || O.test(t) || U.test(t) || k.test(t) || j.test(t) || x.test(t) || C.test(t) || T.test(t) || L.test(t) || M.test(t) || S.test(t) || I.test(t) || P.test(t)
    }, MOGU.Globe_Input_Text = function (e, o) {
        o = o || e.val(), e.focus(function () {
            var e = t(this);
            t.trim(e.val()) == o && e.val(""), e.css("color", "#000")
        }), e.blur(function () {
            var e = t(this);
            "" == t.trim(e.val()) && (e.val(o), e.css("color", "#ccc"))
        })
    }, MOGU.Globe_Input_Text_Hide = function (e) {
        e.focus(function () {
            var e = t(this);
            t.trim(e.val()) == t.trim(e.attr("def-v")) && e.val(""), e.css("color", "#000")
        }), e.blur(function () {
            var e = t(this);
            "" == t.trim(e.val()) && (e.val(e.attr("def-v")), e.css("color", "#ccc"))
        })
    }, MOGU.WB_Word_Count = function (e, o, i) {
        var n = i ? i : 140;
        if (t("#" + e)[0]) {
            var a = function () {
                var i = 0;
                i = o ? MGTOOL.getMsgLength(t("#" + o).val()) : MGTOOL.getMsgLength(t("#" + e).find(".pub_txt").val());
                var a = n - i;
                0 == i ? t("#" + e).find(".word_count").html(n) : i > n ? (t("#" + e).find(".word_count_wrap").html('您已超过<em class="word_count"></em>个字').find(".word_count").html(Math.abs(a)), t("#" + e).find(".word_count_wrap").show(), t("#" + e).find(".word_count").addClass("out")) : (t("#" + e).find(".word_count_wrap").html('还可以输入<em class="word_count"></em>个字').find(".word_count").html(a), t("#" + e).find(".word_count").removeClass("out"))
            };
            o ? t("#" + o).bind("keyup", a).bind("input", a).bind("propertychange", a) : t("#" + e).find(".pub_txt").bind("keyup", a).bind("input", a).bind("propertychange", a)
        }
    }, MOGU.Globe_Range_Input = function (t) {
        if (t[0].createTextRange) {
            var e = t[0].createTextRange();
            e.moveEnd("character", t.val().length), e.moveStart("character", t.val().length), e.select()
        } else t[0].setSelectionRange(t.val().length, t.val().length), t.focus()
    }, MOGU.Globe_Check_Login = function () {
        return "" == MOGUPROFILE.userid ? (MOGU.user_handsome_login_init(), MOGU.user_handsome_login(), !1) : !0
    }, MOGU.Globe_Short_Link_From = function () {
        t(".mg_slink").live("click", function () {
            var e = window.location.toString();
            if (!(e.indexOf("is_qzone=1") >= 0)) {
                var o = this,
                    i = o.href,
                    n = t(o).attr("s"),
                    a = t(o).attr("c");
                "" == a && (a = MOGUPROFILE.userid);
                var c = i,
                    r = "";
                r = -1 == i.indexOf("?") ? "?c=" + a + "&s=" + n : "&c=" + a + "&s=" + n, c += r, o.href = c, setTimeout(function () {
                    o.href = i
                }, 500)
            }
        })
    }, MOGU.Globe_Short_Link_From(), MOGU.Globe_Bind_Keybord_Submit = function (e, o, i) {
        i = i || "need_focus", "need_focus" == i && (e.focus(function () {
            t("body").unbind("keydown"), t("body").bind("keydown", function (t) {
                t.ctrlKey && 13 == t.keyCode && o.click()
            })
        }), e.blur(function () {
            t("body").unbind("keydown")
        })), "not_need_focus" == i && t(document).bind("keydown", function (e) {
            e.ctrlKey && 13 == e.keyCode && (o.click(), t("body").unbind("keydown"))
        })
    }, MOGU.GLobe_GetObj_Length = function (t) {
        var e, o = 0;
        for (e in t) t.hasOwnProperty(e) && o++;
        return o
    }, MOGU.Empty_Message_Tip = function (t) {
        var e = t ? t : {},
            o = e.pub_obj,
            i = null,
            n = 0;
        i = setInterval(function () {
            n++, 6 == n ? (clearInterval(i), o.focus()) : n % 2 == 0 ? o.addClass("empty_tip") : o.removeClass("empty_tip")
        }, 120)
    }, MOGU.Defult_Post_data = function (e) {
        if (e instanceof jQuery || (e = t(e)), e.hasClass("disable")) return !1;
        e.addClass("disable");
        var o = e.data(),
            i = o.url || "";
        if ("" !== i) {
            var n = function (t) {
                1001 === t.status.code ? window.location.reload() : alert(t.status.msg)
            };
            jQuery.ajax({
                url: i,
                type: "POST",
                dataType: "json",
                data: o,
                complete: function () {
                    e.removeClass("disable")
                }, success: function (t) {
                    n(t)
                }
            })
        }
    }, MOGU.Globe_Trace_Log = function (e) {
        var o = log_stat_url_tmp + "&rerefer=" + encodeURIComponent(window.location.href) + "&tracename=" + e;
        t.ajax({
            url: o,
            type: "post",
            dataType: "jsonp",
            jsonpCallback: "logCallBack",
            success: function () {}
        })
    }, t.fn.serializeObject = function () {
        var e = {},
            o = this.serializeArray();
        return t.each(o, function () {
            void 0 !== e[this.name] ? (e[this.name].push || (e[this.name] = [e[this.name]]), e[this.name].push(this.value || "")) : e[this.name] = this.value || ""
        }), e
    }, MOGU.SerializeFormObject = function (t) {
        t.serializeObject()
    }
}(jQuery), $(function () {
        $(document).off("click", ".__trace__").on("click", ".__trace__", function (t) {
            var e = $(this).attr("data-trace");
            e && MOGU.Globe_Trace_Log(e)
        })
    }),
    function () {
        for (var t, e = function () {}, o = ["assert", "clear", "count", "debug", "dir", "dirxml", "error", "exception", "group", "groupCollapsed", "groupEnd", "info", "log", "markTimeline", "profile", "profileEnd", "table", "time", "timeEnd", "timeStamp", "trace", "warn"], i = o.length, n = window.console = window.console || {}; i--;) t = o[i], n[t] || (n[t] = e)
    }();
! function (e, t) {
    "object" == typeof exports && "object" == typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define("pages/pctest/index", [], t) : "object" == typeof exports ? exports["pages/pctest/index"] = t() : e["pages/pctest/index"] = t()
}(this, function () {
    return function (e) {
        function t(r) {
            if (n[r]) return n[r].exports;
            var i = n[r] = {
                exports: {},
                id: r,
                loaded: !1
            };
            return e[r].call(i.exports, i, i.exports, t), i.loaded = !0, i.exports
        }
        var n = {};
        return t.m = e, t.c = n, t.p = "",
            function () {
                if ("undefined" != typeof window) {
                    var e = "webpack-livereload-plugin-script";
                    if (!document.getElementById(e)) {
                        var t = document.createElement("script");
                        t.id = e, t.async = !0, t.src = "js/livereload.js", document.head.appendChild(t)
                    }
                }
            }(), t(0)
    }([
        function (e, t, n) {
            "use strict";

            function r(e) {
                return e && e.__esModule ? e : {
                    "default": e
                }
            }
            var i = n(1),
                o = r(i),
                s = function () {
                    $(document).on("click", ".mlstalk_widget_btn", function (e) {
                        if (window.MoGu && !window.MoGu.data.userData) return location.href = "http://account.meilishuo.com/user/login?redirect=" + encodeURIComponent(location.href), !1;
                        e.preventDefault();
                        var t = e.currentTarget,
                            n = $(t).data("toid") || "",
                            r = $(t).data("tid") || "";
                        (0, o["default"])(n, r)
                    })
                };
            s()
        },
        function (e, t, n) {
            "use strict";

            function r(e) {
                return e && e.__esModule ? e : {
                    "default": e
                }
            }
            t.__esModule = !0;
            var i = n(2),
                o = r(i);
            n(5);
            var s = function (e, t) {
                (0, o["default"])(e, t);
                var n = $("#J-imContainer");
                n.show(), n.contents().focus()
            };
            window._openIm = s, t["default"] = s, e.exports = t["default"]
        },
        function (e, t, n) {
            "use strict";

            function r(e) {
                return e && e.__esModule ? e : {
                    "default": e
                }
            }
            t.__esModule = !0;
            var i = n(3),
                o = r(i),
                s = null,
                a = {
                    getPos: function () {
                        function e() {
                            var e = void 0;
                            return s ? s : window.localStorage && (e = window.localStorage.getItem("IM_POSITION")) ? JSON.parse(e) : {
                                x: $(window).width() - 590,
                                y: $(window).height() - 440
                            }
                        }
                        return e
                    }(),
                    setPos: function () {
                        function e(e, t) {
                            return s = {
                                x: e,
                                y: t
                            }, window.localStorage && window.localStorage.setItem("IM_POSITION", JSON.stringify(s)), !0
                        }
                        return e
                    }()
                },
                u = null;
            t["default"] = function (e, t) {
                var n = "http://webim.meilishuo.com/pc";
                $("#J-imContainer").length || ! function () {
                    var e = "left:" + a.getPos().x + "px; top:" + a.getPos().y + "px",
                        t = '<div id="J-imContainer" class="im-frame-container" style="' + e + '">\n        <div id="J-closeImFrameBtn" class="im-frame-btn"></div>\n        <div id="J-dragImHandle" class="im-frame-drag"></div>\n        <iframe id="J-openImFrame" class="im-frame-box" frameborder="no" allowtransparency="true">\n        </iframe>\n      </div>';
                    $("body").append(t), $("#J-closeImFrameBtn").on("click", function () {
                        $("#J-imContainer").hide()
                    });
                    var n = (0, o["default"])("#J-imContainer").handle("#J-dragImHandle").setMax({
                        x: $(window).width(),
                        y: $(window).height()
                    }).start();
                    n.on("end", function (e) {
                        a.setPos(e.pos.x, e.pos.y)
                    }), $(window).resize(function () {
                        u && window.clearTimeout(u), u = setTimeout(function () {
                            var e = $(window).width(),
                                t = $(window).height();
                            console.log(e, t);
                            var r = a.getPos();
                            r.x + 620 > e && (r.x = e - 620), r.x < 40 && (r.x = 40), r.y < 0 && (r.y = 40), r.y + 470 > t && (r.y = t - 470), a.setPos(r.x, r.y), n.setMax({
                                x: e,
                                y: t
                            }), $("#J-imContainer").css({
                                left: r.x,
                                top: r.y
                            })
                        }, 100)
                    })
                }(), $("#J-openImFrame").attr("src", n + "#userId=" + e + "&gid=" + t)
            }, e.exports = t["default"]
        },
        function (e, t, n) {
            "use strict";

            function r(e) {
                return e && e.__esModule ? e : {
                    "default": e
                }
            }

            function i(e, t) {
                if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }

            function o(e, t) {
                if (!e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
                return !t || "object" != typeof t && "function" != typeof t ? e : t
            }

            function s(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }), t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            t.__esModule = !0;
            var a = n(4),
                u = r(a),
                c = null,
                l = !!("ontouchstart" in document.documentElement),
                f = function (e, t) {
                    return window.getComputedStyle ? window.getComputedStyle(e, null).getPropertyValue(t) : e.currentStyle[t].getPropertyValue(t)
                },
                d = function (e, t, n) {
                    if (t instanceof Array, !n) {
                        var r = f(e, t);
                        return parseFloat(r)
                    }
                    e.style[t] = n
                },
                p = function (e) {
                    return e && "string" == typeof e ? $ ? $(e)[0] : document.querySelectorAll ? document.querySelectorAll(e)[0] : /^#/.test(e) ? document.getElementById(e.replace(/^#/, "")) : /^./.test(e) ? document.getElementsByClassName(e.replace(/^./, "")) : document.getElementsByName(e) : e
                },
                h = {
                    start: "touchstart",
                    move: "touchmove",
                    end: "touchend"
                },
                v = {
                    start: "mousedown",
                    move: "mousemove",
                    end: "mouseup"
                },
                m = l ? h : v,
                y = function (e, t, n) {
                    return e.addEventListener ? e.addEventListener(t, n, !1) : e.attachEvent && e.attachEvent("on" + t, function () {
                        var t = window.event;
                        t.target = t.srcElement, t.currentTarget = e, n.call(e, t)
                    }), e
                },
                g = function (e, t, n) {
                    return e.removeEventListener ? e.removeEventListener(t, n, !1) : e.detachEvent && e.detachEvent("on" + t, n), e
                },
                x = function (e) {
                    function t(n) {
                        i(this, t);
                        var r = o(this, e.call(this));
                        return r.start = function () {
                            return r.unbind(), r._client = {
                                x: window.innerWidth,
                                y: window.innerHeight
                            }, r._eventHandler = function (e) {
                                var t = r.current("left") || 0,
                                    n = r.current("top") || 0,
                                    i = function () {
                                        function i(i) {
                                            var o = void 0,
                                                s = void 0,
                                                a = void 0,
                                                u = void 0;
                                            l ? 1 === e.touches.length && (o = i.touches[0].clientX - e.touches[0].clientX, s = i.touches[0].clientY - e.touches[0].clientY) : (o = i.clientX - e.clientX, s = i.clientY - e.clientY), a = t + o, u = n + s, r.pos.dX = a - r.current("left"), r.pos.dY = u - r.current("top"), r.maxX && (0 > a ? a = 0 : a >= 0 && a > r.maxX && (a = r.maxX)), r.maxY && (0 > u ? u = 0 : u >= 0 && u > r.maxY && (u = r.maxY)), "x" === r._axis ? d(r.el, "left", a + "px") : "y" === r._axis ? d(r.el, "top", u + "px") : (d(r.el, "left", a + "px"), d(r.el, "top", u + "px")), r.getPos(), r.emit("dragging", r), i.preventDefault ? (i.preventDefault(), i.stopPropagation()) : (i.returnValue = !1, i.cancelBubble = !0)
                                        }
                                        return i
                                    }(),
                                    o = function () {
                                        function e() {
                                            r.emit("end", r), a()
                                        }
                                        return e
                                    }(),
                                    s = function () {
                                        function e(e) {
                                            e.preventDefault ? (e.preventDefault(), e.stopPropagation()) : (e.returnValue = !1, e.cancelBubble = !0)
                                        }
                                        return e
                                    }(),
                                    a = function () {
                                        function e() {
                                            g(document, m.move, i), g(document, m.end, o), g(document, "selectstart", s), g(r._handle, "dragstart", s)
                                        }
                                        return e
                                    }();
                                r.emit("start", r), document.body.focus(), y(document, "selectstart", s), y(r._handle, "dragstart", s), y(document, m.move, i), y(document, m.end, o)
                            }, r.getPos(), r._handle || (r._handle = r.el), y(r._handle, m.start, r._eventHandler), r
                        }, r.el = p(n), r._axis = "both", r.pos = {}, r
                    }
                    return s(t, e), t.prototype.current = function () {
                        function e(e, t) {
                            return d(this.el, e, t)
                        }
                        return e
                    }(), t.prototype.setMax = function () {
                        function e(e) {
                            if (e.x && e.x > 0) {
                                var t = d(this.el, "width");
                                this.maxX = e.x - t
                            }
                            if (e.y && e.y > 0) {
                                var n = d(this.el, "height");
                                this.maxY = e.y - n
                            }
                            return this
                        }
                        return e
                    }(), t.prototype.axis = function () {
                        function e(e) {
                            return -1 !== ["x", "y", "both"].indexOf(e) && (this._axis = e), this
                        }
                        return e
                    }(), t.prototype.handle = function () {
                        function e(e) {
                            return this._handle = p(e), this
                        }
                        return e
                    }(), t.prototype.getPos = function () {
                        function e(e) {
                            return this.pos.x = this.current("left"), this.pos.y = this.current("top"), e && "function" == typeof e && e.apply(this, this.pos), this
                        }
                        return e
                    }(), t.prototype.unbind = function () {
                        function e() {
                            return this._eventHandler ? (g(this.el, m.start, this._eventHandler), g(this._handle, m.start, this._eventHandler), this) : this
                        }
                        return e
                    }(), t
                }(u["default"]);
            t["default"] = function (e) {
                return c || (c = new x(e)), c
            }, e.exports = t["default"]
        },
        function (e, t) {
            function n() {
                this._events = this._events || {}, this._maxListeners = this._maxListeners || void 0
            }

            function r(e) {
                return "function" == typeof e
            }

            function i(e) {
                return "number" == typeof e
            }

            function o(e) {
                return "object" == typeof e && null !== e
            }

            function s(e) {
                return void 0 === e
            }
            e.exports = n, n.EventEmitter = n, n.prototype._events = void 0, n.prototype._maxListeners = void 0, n.defaultMaxListeners = 10, n.prototype.setMaxListeners = function (e) {
                if (!i(e) || 0 > e || isNaN(e)) throw TypeError("n must be a positive number");
                return this._maxListeners = e, this
            }, n.prototype.emit = function (e) {
                var t, n, i, a, u, c;
                if (this._events || (this._events = {}), "error" === e && (!this._events.error || o(this._events.error) && !this._events.error.length)) {
                    if (t = arguments[1], t instanceof Error) throw t;
                    var l = new Error('Uncaught, unspecified "error" event. (' + t + ")");
                    throw l.context = t, l
                }
                if (n = this._events[e], s(n)) return !1;
                if (r(n)) switch (arguments.length) {
                case 1:
                    n.call(this);
                    break;
                case 2:
                    n.call(this, arguments[1]);
                    break;
                case 3:
                    n.call(this, arguments[1], arguments[2]);
                    break;
                default:
                    a = Array.prototype.slice.call(arguments, 1), n.apply(this, a)
                } else if (o(n))
                    for (a = Array.prototype.slice.call(arguments, 1), c = n.slice(), i = c.length, u = 0; i > u; u++) c[u].apply(this, a);
                return !0
            }, n.prototype.addListener = function (e, t) {
                var i;
                if (!r(t)) throw TypeError("listener must be a function");
                return this._events || (this._events = {}), this._events.newListener && this.emit("newListener", e, r(t.listener) ? t.listener : t), this._events[e] ? o(this._events[e]) ? this._events[e].push(t) : this._events[e] = [this._events[e], t] : this._events[e] = t, o(this._events[e]) && !this._events[e].warned && (i = s(this._maxListeners) ? n.defaultMaxListeners : this._maxListeners, i && i > 0 && this._events[e].length > i && (this._events[e].warned = !0, console.error("(node) warning: possible EventEmitter memory leak detected. %d listeners added. Use emitter.setMaxListeners() to increase limit.", this._events[e].length), "function" == typeof console.trace && console.trace())), this
            }, n.prototype.on = n.prototype.addListener, n.prototype.once = function (e, t) {
                function n() {
                    this.removeListener(e, n), i || (i = !0, t.apply(this, arguments))
                }
                if (!r(t)) throw TypeError("listener must be a function");
                var i = !1;
                return n.listener = t, this.on(e, n), this
            }, n.prototype.removeListener = function (e, t) {
                var n, i, s, a;
                if (!r(t)) throw TypeError("listener must be a function");
                if (!this._events || !this._events[e]) return this;
                if (n = this._events[e], s = n.length, i = -1, n === t || r(n.listener) && n.listener === t) delete this._events[e], this._events.removeListener && this.emit("removeListener", e, t);
                else if (o(n)) {
                    for (a = s; a-- > 0;)
                        if (n[a] === t || n[a].listener && n[a].listener === t) {
                            i = a;
                            break
                        }
                    if (0 > i) return this;
                    1 === n.length ? (n.length = 0, delete this._events[e]) : n.splice(i, 1), this._events.removeListener && this.emit("removeListener", e, t)
                }
                return this
            }, n.prototype.removeAllListeners = function (e) {
                var t, n;
                if (!this._events) return this;
                if (!this._events.removeListener) return 0 === arguments.length ? this._events = {} : this._events[e] && delete this._events[e], this;
                if (0 === arguments.length) {
                    for (t in this._events) "removeListener" !== t && this.removeAllListeners(t);
                    return this.removeAllListeners("removeListener"), this._events = {}, this
                }
                if (n = this._events[e], r(n)) this.removeListener(e, n);
                else if (n)
                    for (; n.length;) this.removeListener(e, n[n.length - 1]);
                return delete this._events[e], this
            }, n.prototype.listeners = function (e) {
                var t;
                return t = this._events && this._events[e] ? r(this._events[e]) ? [this._events[e]] : this._events[e].slice() : []
            }, n.prototype.listenerCount = function (e) {
                if (this._events) {
                    var t = this._events[e];
                    if (r(t)) return 1;
                    if (t) return t.length
                }
                return 0
            }, n.listenerCount = function (e, t) {
                return e.listenerCount(t)
            }
        },
        function (e, t, n) {
            var r = n(6);
            "string" == typeof r && (r = [
                [e.id, r, ""]
            ]);
            n(8)(r, {});
            r.locals && (e.exports = r.locals)
        },
        function (e, t, n) {
            t = e.exports = n(7)(), t.push([e.id, ".im-frame-container {\n  width: 580px;\n  height: 430px;\n  position: fixed;\n  z-index: 1000;\n  display: none;\n  left: 10px;\n  top: 10px;\n}\n.im-frame-container .im-frame-box {\n  width: 100%;\n  height: 100%;\n  border: none;\n}\n.im-frame-container .im-frame-drag {\n  width: 470px;\n  height: 32px;\n  position: absolute;\n  z-index: 3;\n  left: 75px;\n  top: 24px;\n}\n.im-frame-container .im-frame-btn {\n  width: 32px;\n  height: 32px;\n  position: absolute;\n  right: 0;\n  top: 24px;\n  z-index: 2;\n  cursor: pointer;\n  opacity: 0;\n  background-color: rgba(255, 102, 153, 0);\n}\n", ""])
        },
        function (e, t) {
            e.exports = function () {
                var e = [];
                return e.toString = function () {
                    for (var e = [], t = 0; t < this.length; t++) {
                        var n = this[t];
                        n[2] ? e.push("@media " + n[2] + "{" + n[1] + "}") : e.push(n[1])
                    }
                    return e.join("")
                }, e.i = function (t, n) {
                    "string" == typeof t && (t = [
                        [null, t, ""]
                    ]);
                    for (var r = {}, i = 0; i < this.length; i++) {
                        var o = this[i][0];
                        "number" == typeof o && (r[o] = !0)
                    }
                    for (i = 0; i < t.length; i++) {
                        var s = t[i];
                        "number" == typeof s[0] && r[s[0]] || (n && !s[2] ? s[2] = n : n && (s[2] = "(" + s[2] + ") and (" + n + ")"), e.push(s))
                    }
                }, e
            }
        },
        function (e, t, n) {
            function r(e, t) {
                for (var n = 0; n < e.length; n++) {
                    var r = e[n],
                        i = p[r.id];
                    if (i) {
                        i.refs++;
                        for (var o = 0; o < i.parts.length; o++) i.parts[o](r.parts[o]);
                        for (; o < r.parts.length; o++) i.parts.push(c(r.parts[o], t))
                    } else {
                        for (var s = [], o = 0; o < r.parts.length; o++) s.push(c(r.parts[o], t));
                        p[r.id] = {
                            id: r.id,
                            refs: 1,
                            parts: s
                        }
                    }
                }
            }

            function i(e) {
                for (var t = [], n = {}, r = 0; r < e.length; r++) {
                    var i = e[r],
                        o = i[0],
                        s = i[1],
                        a = i[2],
                        u = i[3],
                        c = {
                            css: s,
                            media: a,
                            sourceMap: u
                        };
                    n[o] ? n[o].parts.push(c) : t.push(n[o] = {
                        id: o,
                        parts: [c]
                    })
                }
                return t
            }

            function o(e, t) {
                var n = m(),
                    r = x[x.length - 1];
                if ("top" === e.insertAt) r ? r.nextSibling ? n.insertBefore(t, r.nextSibling) : n.appendChild(t) : n.insertBefore(t, n.firstChild), x.push(t);
                else {
                    if ("bottom" !== e.insertAt) throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
                    n.appendChild(t)
                }
            }

            function s(e) {
                e.parentNode.removeChild(e);
                var t = x.indexOf(e);
                t >= 0 && x.splice(t, 1)
            }

            function a(e) {
                var t = document.createElement("style");
                return t.type = "text/css", o(e, t), t
            }

            function u(e) {
                var t = document.createElement("link");
                return t.rel = "stylesheet", o(e, t), t
            }

            function c(e, t) {
                var n, r, i;
                if (t.singleton) {
                    var o = g++;
                    n = y || (y = a(t)), r = l.bind(null, n, o, !1), i = l.bind(null, n, o, !0)
                } else e.sourceMap && "function" == typeof URL && "function" == typeof URL.createObjectURL && "function" == typeof URL.revokeObjectURL && "function" == typeof Blob && "function" == typeof btoa ? (n = u(t), r = d.bind(null, n), i = function () {
                    s(n), n.href && URL.revokeObjectURL(n.href)
                }) : (n = a(t), r = f.bind(null, n), i = function () {
                    s(n)
                });
                return r(e),
                    function (t) {
                        if (t) {
                            if (t.css === e.css && t.media === e.media && t.sourceMap === e.sourceMap) return;
                            r(e = t)
                        } else i()
                    }
            }

            function l(e, t, n, r) {
                var i = n ? "" : r.css;
                if (e.styleSheet) e.styleSheet.cssText = _(t, i);
                else {
                    var o = document.createTextNode(i),
                        s = e.childNodes;
                    s[t] && e.removeChild(s[t]), s.length ? e.insertBefore(o, s[t]) : e.appendChild(o)
                }
            }

            function f(e, t) {
                var n = t.css,
                    r = t.media;
                if (r && e.setAttribute("media", r), e.styleSheet) e.styleSheet.cssText = n;
                else {
                    for (; e.firstChild;) e.removeChild(e.firstChild);
                    e.appendChild(document.createTextNode(n))
                }
            }

            function d(e, t) {
                var n = t.css,
                    r = t.sourceMap;
                r && (n += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(r)))) + " */");
                var i = new Blob([n], {
                        type: "text/css"
                    }),
                    o = e.href;
                e.href = URL.createObjectURL(i), o && URL.revokeObjectURL(o)
            }
            var p = {},
                h = function (e) {
                    var t;
                    return function () {
                        return "undefined" == typeof t && (t = e.apply(this, arguments)), t
                    }
                },
                v = h(function () {
                    return /msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase())
                }),
                m = h(function () {
                    return document.head || document.getElementsByTagName("head")[0]
                }),
                y = null,
                g = 0,
                x = [];
            e.exports = function (e, t) {
                t = t || {}, "undefined" == typeof t.singleton && (t.singleton = v()), "undefined" == typeof t.insertAt && (t.insertAt = "bottom");
                var n = i(e);
                return r(n, t),
                    function (e) {
                        for (var o = [], s = 0; s < n.length; s++) {
                            var a = n[s],
                                u = p[a.id];
                            u.refs--, o.push(u)
                        }
                        if (e) {
                            var c = i(e);
                            r(c, t)
                        }
                        for (var s = 0; s < o.length; s++) {
                            var u = o[s];
                            if (0 === u.refs) {
                                for (var l = 0; l < u.parts.length; l++) u.parts[l]();
                                delete p[u.id]
                            }
                        }
                    }
            };
            var _ = function () {
                var e = [];
                return function (t, n) {
                    return e[t] = n, e.filter(Boolean).join("\n")
                }
            }()
        }
    ])
}), "function" == typeof define && define.amd && require(["pages/pctest/index"]);
var swfobject = function () {
    function e() {
        if (!G) {
            try {
                var e = M.getElementsByTagName("body")[0].appendChild(h("span"));
                e.parentNode.removeChild(e)
            } catch (t) {
                return
            }
            G = !0;
            for (var n = R.length, a = 0; n > a; a++) R[a]()
        }
    }

    function t(e) {
        G ? e() : R[R.length] = e
    }

    function n(e) {
        if (typeof x.addEventListener != L) x.addEventListener("load", e, !1);
        else if (typeof M.addEventListener != L) M.addEventListener("load", e, !1);
        else if (typeof x.attachEvent != L) m(x, "onload", e);
        else if ("function" == typeof x.onload) {
            var t = x.onload;
            x.onload = function () {
                t(), e()
            }
        } else x.onload = e
    }

    function a() {
        P ? i() : r()
    }

    function i() {
        var e = M.getElementsByTagName("body")[0],
            t = h(k);
        t.setAttribute("type", O);
        var n = e.appendChild(t);
        if (n) {
            var a = 0;
            ! function () {
                if (typeof n.GetVariable != L) {
                    var i = n.GetVariable("$version");
                    i && (i = i.split(" ")[1].split(","), X.pv = [parseInt(i[0], 10), parseInt(i[1], 10), parseInt(i[2], 10)])
                } else if (10 > a) return a++, void setTimeout(arguments.callee, 10);
                e.removeChild(t), n = null, r()
            }()
        } else r()
    }

    function r() {
        var e = D.length;
        if (e > 0)
            for (var t = 0; e > t; t++) {
                var n = D[t].id,
                    a = D[t].callbackFn,
                    i = {
                        success: !1,
                        id: n
                    };
                if (X.pv[0] > 0) {
                    var r = y(n);
                    if (r)
                        if (!w(D[t].swfVersion) || X.wk && X.wk < 312)
                            if (D[t].expressInstall && l()) {
                                var f = {};
                                f.data = D[t].expressInstall, f.width = r.getAttribute("width") || "0", f.height = r.getAttribute("height") || "0", r.getAttribute("class") && (f.styleclass = r.getAttribute("class")), r.getAttribute("align") && (f.align = r.getAttribute("align"));
                                for (var d = {}, u = r.getElementsByTagName("param"), p = u.length, v = 0; p > v; v++) "movie" != u[v].getAttribute("name").toLowerCase() && (d[u[v].getAttribute("name")] = u[v].getAttribute("value"));
                                s(f, d, n, a)
                            } else c(r), a && a(i);
                    else b(n, !0), a && (i.success = !0, i.ref = o(n), a(i))
                } else if (b(n, !0), a) {
                    var h = o(n);
                    h && typeof h.SetVariable != L && (i.success = !0, i.ref = h), a(i)
                }
            }
    }

    function o(e) {
        var t = null,
            n = y(e);
        if (n && "OBJECT" == n.nodeName)
            if (typeof n.SetVariable != L) t = n;
            else {
                var a = n.getElementsByTagName(k)[0];
                a && (t = a)
            }
        return t
    }

    function l() {
        return !J && w("6.0.65") && (X.win || X.mac) && !(X.wk && X.wk < 312)
    }

    function s(e, t, n, a) {
        J = !0, A = a || null, N = {
            success: !1,
            id: n
        };
        var i = y(n);
        if (i) {
            "OBJECT" == i.nodeName ? (E = f(i), S = null) : (E = i, S = n), e.id = F, (typeof e.width == L || !/%$/.test(e.width) && parseInt(e.width, 10) < 310) && (e.width = "310"), (typeof e.height == L || !/%$/.test(e.height) && parseInt(e.height, 10) < 137) && (e.height = "137"), M.title = M.title.slice(0, 47) + " - Flash Player Installation";
            var r = X.ie && X.win ? "ActiveX" : "PlugIn",
                o = "MMredirectURL=" + x.location.toString().replace(/&/g, "%26") + "&MMplayerType=" + r + "&MMdoctitle=" + M.title;
            if (typeof t.flashvars != L ? t.flashvars += "&" + o : t.flashvars = o, X.ie && X.win && 4 != i.readyState) {
                var l = h("div");
                n += "SWFObjectNew", l.setAttribute("id", n), i.parentNode.insertBefore(l, i), i.style.display = "none",
                    function () {
                        4 == i.readyState ? i.parentNode.removeChild(i) : setTimeout(arguments.callee, 10)
                    }()
            }
            d(e, t, n)
        }
    }

    function c(e) {
        if (X.ie && X.win && 4 != e.readyState) {
            var t = h("div");
            e.parentNode.insertBefore(t, e), t.parentNode.replaceChild(f(e), t), e.style.display = "none",
                function () {
                    4 == e.readyState ? e.parentNode.removeChild(e) : setTimeout(arguments.callee, 10)
                }()
        } else e.parentNode.replaceChild(f(e), e)
    }

    function f(e) {
        var t = h("div");
        if (X.win && X.ie) t.innerHTML = e.innerHTML;
        else {
            var n = e.getElementsByTagName(k)[0];
            if (n) {
                var a = n.childNodes;
                if (a)
                    for (var i = a.length, r = 0; i > r; r++) 1 == a[r].nodeType && "PARAM" == a[r].nodeName || 8 == a[r].nodeType || t.appendChild(a[r].cloneNode(!0))
            }
        }
        return t
    }

    function d(e, t, n) {
        var a, i = y(n);
        if (X.wk && X.wk < 312) return a;
        if (i)
            if (typeof e.id == L && (e.id = n), X.ie && X.win) {
                var r = "";
                for (var o in e) e[o] != Object.prototype[o] && ("data" == o.toLowerCase() ? t.movie = e[o] : "styleclass" == o.toLowerCase() ? r += ' class="' + e[o] + '"' : "classid" != o.toLowerCase() && (r += " " + o + '="' + e[o] + '"'));
                var l = "";
                for (var s in t) t[s] != Object.prototype[s] && (l += '<param name="' + s + '" value="' + t[s] + '" />');
                i.outerHTML = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"' + r + ">" + l + "</object>", W[W.length] = e.id, a = y(e.id)
            } else {
                var c = h(k);
                c.setAttribute("type", O);
                for (var f in e) e[f] != Object.prototype[f] && ("styleclass" == f.toLowerCase() ? c.setAttribute("class", e[f]) : "classid" != f.toLowerCase() && c.setAttribute(f, e[f]));
                for (var d in t) t[d] != Object.prototype[d] && "movie" != d.toLowerCase() && u(c, d, t[d]);
                i.parentNode.replaceChild(c, i), a = c
            }
        return a
    }

    function u(e, t, n) {
        var a = h("param");
        a.setAttribute("name", t), a.setAttribute("value", n), e.appendChild(a)
    }

    function p(e) {
        var t = y(e);
        t && "OBJECT" == t.nodeName && (X.ie && X.win ? (t.style.display = "none", function () {
            4 == t.readyState ? v(e) : setTimeout(arguments.callee, 10)
        }()) : t.parentNode.removeChild(t))
    }

    function v(e) {
        var t = y(e);
        if (t) {
            for (var n in t) "function" == typeof t[n] && (t[n] = null);
            t.parentNode.removeChild(t)
        }
    }

    function y(e) {
        var t = null;
        try {
            t = M.getElementById(e)
        } catch (n) {}
        return t
    }

    function h(e) {
        return M.createElement(e)
    }

    function m(e, t, n) {
        e.attachEvent(t, n), H[H.length] = [e, t, n]
    }

    function w(e) {
        var t = X.pv,
            n = e.split(".");
        return n[0] = parseInt(n[0], 10), n[1] = parseInt(n[1], 10) || 0, n[2] = parseInt(n[2], 10) || 0, t[0] > n[0] || t[0] == n[0] && t[1] > n[1] || t[0] == n[0] && t[1] == n[1] && t[2] >= n[2]
    }

    function g(e, t, n, a) {
        if (!X.ie || !X.mac) {
            var i = M.getElementsByTagName("head")[0];
            if (i) {
                var r = n && "string" == typeof n ? n : "screen";
                if (a && (T = null, I = null), !T || I != r) {
                    var o = h("style");
                    o.setAttribute("type", "text/css"), o.setAttribute("media", r), T = i.appendChild(o), X.ie && X.win && typeof M.styleSheets != L && M.styleSheets.length > 0 && (T = M.styleSheets[M.styleSheets.length - 1]), I = r
                }
                X.ie && X.win ? T && typeof T.addRule == k && T.addRule(e, t) : T && typeof M.createTextNode != L && T.appendChild(M.createTextNode(e + " {" + t + "}"))
            }
        }
    }

    function b(e, t) {
        if (U) {
            var n = t ? "visible" : "hidden";
            G && y(e) ? y(e).style.visibility = n : g("#" + e, "visibility:" + n)
        }
    }

    function C(e) {
        var t = /[\\\"<>\.;]/,
            n = null != t.exec(e);
        return n && typeof encodeURIComponent != L ? encodeURIComponent(e) : e
    }
    var E, S, A, N, T, I, L = "undefined",
        k = "object",
        j = "Shockwave Flash",
        B = "ShockwaveFlash.ShockwaveFlash",
        O = "application/x-shockwave-flash",
        F = "SWFObjectExprInst",
        $ = "onreadystatechange",
        x = window,
        M = document,
        V = navigator,
        P = !1,
        R = [a],
        D = [],
        W = [],
        H = [],
        G = !1,
        J = !1,
        U = !0,
        X = function () {
            var e = typeof M.getElementById != L && typeof M.getElementsByTagName != L && typeof M.createElement != L,
                t = V.userAgent.toLowerCase(),
                n = V.platform.toLowerCase(),
                a = n ? /win/.test(n) : /win/.test(t),
                i = n ? /mac/.test(n) : /mac/.test(t),
                r = /webkit/.test(t) ? parseFloat(t.replace(/^.*webkit\/(\d+(\.\d+)?).*$/, "$1")) : !1,
                o = !1,
                l = [0, 0, 0],
                s = null;
            if (typeof V.plugins != L && typeof V.plugins[j] == k) s = V.plugins[j].description, !s || typeof V.mimeTypes != L && V.mimeTypes[O] && !V.mimeTypes[O].enabledPlugin || (P = !0, o = !1, s = s.replace(/^.*\s+(\S+\s+\S+$)/, "$1"), l[0] = parseInt(s.replace(/^(.*)\..*$/, "$1"), 10), l[1] = parseInt(s.replace(/^.*\.(.*)\s.*$/, "$1"), 10), l[2] = /[a-zA-Z]/.test(s) ? parseInt(s.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0);
            else if (typeof x.ActiveXObject != L) try {
                var c = new ActiveXObject(B);
                c && (s = c.GetVariable("$version"), s && (o = !0, s = s.split(" ")[1].split(","), l = [parseInt(s[0], 10), parseInt(s[1], 10), parseInt(s[2], 10)]))
            } catch (f) {}
            return {
                w3: e,
                pv: l,
                wk: r,
                ie: o,
                win: a,
                mac: i
            }
        }();
    (function () {
        X.w3 && ((typeof M.readyState != L && "complete" == M.readyState || typeof M.readyState == L && (M.getElementsByTagName("body")[0] || M.body)) && e(), G || (typeof M.addEventListener != L && M.addEventListener("DOMContentLoaded", e, !1), X.ie && X.win && (M.attachEvent($, function () {
            "complete" == M.readyState && (M.detachEvent($, arguments.callee), e())
        }), x == top && ! function () {
            if (!G) {
                try {
                    M.documentElement.doScroll("left")
                } catch (t) {
                    return void setTimeout(arguments.callee, 0)
                }
                e()
            }
        }()), X.wk && ! function () {
            return G ? void 0 : /loaded|complete/.test(M.readyState) ? void e() : void setTimeout(arguments.callee, 0)
        }(), n(e)))
    })(),
    function () {
        X.ie && X.win && window.attachEvent("onunload", function () {
            for (var e = H.length, t = 0; e > t; t++) H[t][0].detachEvent(H[t][1], H[t][2]);
            for (var n = W.length, a = 0; n > a; a++) p(W[a]);
            for (var i in X) X[i] = null;
            X = null;
            for (var r in swfobject) swfobject[r] = null;
            swfobject = null
        })
    }();
    return {
        registerObject: function (e, t, n, a) {
            if (X.w3 && e && t) {
                var i = {};
                i.id = e, i.swfVersion = t, i.expressInstall = n, i.callbackFn = a, D[D.length] = i, b(e, !1)
            } else a && a({
                success: !1,
                id: e
            })
        }, getObjectById: function (e) {
            return X.w3 ? o(e) : void 0
        }, embedSWF: function (e, n, a, i, r, o, c, f, u, p) {
            var v = {
                success: !1,
                id: n
            };
            X.w3 && !(X.wk && X.wk < 312) && e && n && a && i && r ? (b(n, !1), t(function () {
                a += "", i += "";
                var t = {};
                if (u && typeof u === k)
                    for (var y in u) t[y] = u[y];
                t.data = e, t.width = a, t.height = i;
                var h = {};
                if (f && typeof f === k)
                    for (var m in f) h[m] = f[m];
                if (c && typeof c === k)
                    for (var g in c) typeof h.flashvars != L ? h.flashvars += "&" + g + "=" + c[g] : h.flashvars = g + "=" + c[g];
                if (w(r)) {
                    var C = d(t, h, n);
                    t.id == n && b(n, !0), v.success = !0, v.ref = C
                } else {
                    if (o && l()) return t.data = o, void s(t, h, n, p);
                    b(n, !0)
                }
                p && p(v)
            })) : p && p(v)
        }, switchOffAutoHideShow: function () {
            U = !1
        }, ua: X,
        getFlashPlayerVersion: function () {
            return {
                major: X.pv[0],
                minor: X.pv[1],
                release: X.pv[2]
            }
        }, hasFlashPlayerVersion: w,
        createSWF: function (e, t, n) {
            return X.w3 ? d(e, t, n) : void 0
        }, showExpressInstall: function (e, t, n, a) {
            X.w3 && l() && s(e, t, n, a)
        }, removeSWF: function (e) {
            X.w3 && p(e)
        }, createCSS: function (e, t, n, a) {
            X.w3 && g(e, t, n, a)
        }, addDomLoadEvent: t,
        addLoadEvent: n,
        getQueryParamValue: function (e) {
            var t = M.location.search || M.location.hash;
            if (t) {
                if (/\?/.test(t) && (t = t.split("?")[1]), null == e) return C(t);
                for (var n = t.split("&"), a = 0; a < n.length; a++)
                    if (n[a].substring(0, n[a].indexOf("=")) == e) return C(n[a].substring(n[a].indexOf("=") + 1))
            }
            return ""
        }, expressInstallCallback: function () {
            if (J) {
                var e = y(F);
                e && E && (e.parentNode.replaceChild(E, e), S && (b(S, !0), X.ie && X.win && (E.style.display = "block")), A && A(N)), J = !1
            }
        }
    }
}();
var imio = function (t, o, e, n, i) {
    function a(t) {
        this.e_pre = "imio:", this.data = {
            connectionStatus: !1,
            connectionType: null,
            service: ""
        }, this.config = e.extend({
            connectMethod: ["serviceHost", "ajaxServiceHost", "ajaxServiceBakHost"],
            socketSwf: "http://s8.mogucdn.com/new1/v1/bmisc/30694b9ecac3d336876dc21db9a04dd0/161101909382.swf",
            serviceHost: "122.225.67.108:101.68.210.108:8808",
            ajaxServiceHost: "http://122.225.67.108:80",
            ajaxServiceBakHost: "http://101.68.210.108:80",
            timestamp: +new Date
        }, t)
    }
    var c = function (t) {
        if ("object" != typeof t) return null;
        var o, e = parseInt(100 * Math.random(), 10) + 100,
            n = "",
            i = 0;
        for (var a in t) n += t[a];
        o = n.split("");
        for (var c = 0, s = o.length; s > c; c++) i += o[c].charCodeAt();
        return t._n = e, t._p = i % e, t
    };
    return a.prototype.emit = function (t) {
        this.uinfo = e.extend({
            uid: "",
            uuid: "",
            token: ""
        }, t), this.uinfo.uid && this.connectSvr()
    }, a.prototype.on = function (t, n) {
        e(o).on(this.e_pre + t, function (t, o) {
            n && n(o)
        })
    }, a.prototype.trigger = function (t, n) {
        e(o).trigger(this.e_pre + t, [n])
    }, a.prototype.connectSvr = function () {
        var t = this,
            o = t.config.connectMethod,
            e = {
                serviceHost: "flash",
                ajaxServiceHost: "ajax",
                ajaxServiceBakHost: "ajax"
            },
            i = n.getFlashPlayerVersion();
        if (void 0 === i || 0 === i.major)
            for (var a = 0, c = o.length; c > a; a++)
                if ("serviceHost" === o[a]) {
                    o.splice(a, 1);
                    break
                }
        var s = 0;
        ! function r(n) {
            var i = t.data.connectionStatus;
            if (!i && n) t.data.service = t.config[n], t.data.connectionType = e[n], t.start(e[n]);
            else if (!i && void 0 === n) return t.trigger("loading:status", "timeout"), void clearTimeout(s);
            s = setTimeout(function () {
                var e = o.shift();
                t.data.connectionStatus || (r(e), e && t.trigger("loading:status", "reconnect"))
            }, 1e4)
        }(o.shift())
    }, a.prototype.httpConnect = function () {
        e("#imioflashobj").remove();
        var t = this,
            o = {
                uid: t.uinfo.uid,
                token: t.uinfo.token,
                status: 1
            };
        o = c(o), e.ajax({
            url: t.data.service + "/push/login",
            data: o,
            dataType: "jsonp",
            timeout: 9e3,
            success: function (o) {
                if (o && 1001 === o.status.code) {
                    if (t.data.connectionStatus) return;
                    t.uinfo.uuid = o.result.uuid, t.call(encodeURIComponent('{"code":1001,"type":"_imioLoginCB"}')), t.startPoll(), t.autoToken(), t.send("getUnReadCounter")
                }
            }
        })
    }, a.prototype.flashConnect = function () {
        var t = this,
            o = e("#imioflashobj");
        o.length <= 0 && (o = e('<span id="imioflashobj"></span>'), e("body").append(o));
        var i = t.config,
            a = e.extend({
                serverList: i.serviceHost
            }, t.uinfo),
            c = {
                wmode: "transplate",
                allowscriptaccess: "always"
            },
            s = {
                id: "imioflashobj",
                name: "imioflashobj"
            };
        window._imioSocket = {
            call: function (o) {
                t.connectionStatus || t.autoToken(), t.call(o)
            }
        }, n.embedSWF(t.config.socketSwf, "imioflashobj", "0", "0", "9.0.0", "", a, c, s)
    }, a.prototype.start = function (t) {
        "flash" === t ? this.flashConnect() : "ajax" === t && this.httpConnect()
    }, a.prototype.startPoll = function () {
        var t = this,
            o = (t.config, t.uinfo);
        ! function n() {
            e.ajax({
                url: t.data.service + "/push/poll",
                data: {
                    uid: o.uid,
                    uuid: o.uuid,
                    token: o.token,
                    type: "poll"
                },
                type: "GET",
                dataType: "jsonp",
                timeout: 5e4,
                success: function (o) {
                    return null === o || (t.call(encodeURIComponent(i.stringify(o))), "errorCode" !== o.type || 4011 !== o.data && 4002 !== o.data && 4005 !== o.data && 4444 !== o.data) ? void n() : void t.showNotice(o.data)
                }, error: function () {
                    t.showNotice(6002)
                }
            })
        }()
    }, a.prototype.autoToken = function () {
        var t = this;
        t.startAutoToken || (! function o() {
            setTimeout(function () {
                e.ajax({
                    url: "http://www.meilishuo.com/mtalk/iauth",
                    type: "GET",
                    data: null,
                    dataType: "jsonp",
                    success: function (e) {
                        e && e.status && 1001 === e.status.code && (t.uinfo.token = e.result.token, o())
                    }
                })
            }, 36e5)
        }(), t.startAutoToken = !0)
    }, a.prototype.showNotice = function (t) {
        t += "";
        var o = {
            4004: "消息发送超时",
            6000: "网络连接出错",
            6001: "您不能和对方对话",
            10001: "抱歉！没有客服在线",
            4002: "参数错误，请重新登录",
            4003: "您已断开连接，请重新登录",
            4005: "用户校验失败，请重新登陆",
            4011: "您已在其他地方上线，请重新打开",
            4444: "您已经离线，请重新打开",
            6002: "连接失败，请重新打开"
        };
        this.trigger("notice:show", {
            code: +t,
            msg: void 0 === o[t] ? "未知错误[" + t + "]" : o[t]
        })
    }, a.prototype.call = function (t) {
        t = i.parse(decodeURIComponent(t));
        var o = this;
        if (t && 1001 === t.code) switch (t.type) {
        case "_imioLoginCB":
            o.data.connectionStatus = !0;
            break;
        case "_imioSocket":
            o.trigger("data:update", t.data)
        }
    }, a.prototype.send = function (t, o) {
        o = encodeURIComponent(i.stringify(o));
        var n = this;
        if ("flash" === n.data.connectionType) {
            var a = e("#imioflashobj")[0];
            if (!a) return;
            return void
            function c(t, o) {
                n.data.connectionStatus ? a[t](o) : "flash" === n.data.connectionType && setTimeout(function () {
                    c(t, o)
                }, 100)
            }(t, o)
        }
        return "ajax" === n.data.connectionType ? void
        function (t, o) {
            var a = {
                uid: n.uinfo.uid,
                uuid: n.uinfo.uuid,
                token: n.uinfo.token,
                type: t
            };
            void 0 !== o && (a.data = decodeURIComponent(o)), e.ajax({
                url: n.data.service + "/push/request",
                data: a,
                type: "GET",
                dataType: "jsonp",
                success: function (t) {
                    t && t.data ? n.call(encodeURIComponent(i.stringify(t))) : t && 4003 === t.code && n.showNotice(4003)
                }, error: function () {
                    n.showNotice(6002)
                }
            })
        }(t, o): void 0
    }, {
        connect: function (t) {
            return new a(t)
        }
    }
}(window, document, jQuery, swfobject, JSON);
! function (e, t, i, o) {
    var a = "undefined" != typeof e.MOGU ? e.MOGU : {},
        n = "undefined" != typeof e.MGTOOL ? e.MGTOOL : {},
        d = i("head").find("link"),
        s = d.eq(d.length - 1).attr("href"),
        u = +new Date;
    "string" == typeof s && s.indexOf("$") > 0 && (!window.ActiveXObject || window.XMLHttpRequest) && (u = s.split("$")[1].split(".")[0]),
        function () {
            var e;
            i.ajax({
                url: "load",
                data: null,
                dataType: "json",
                success: function (t) {
                    if (t && t.status && 1001 === t.status.code) {
                        var d = t.result;
                        e = o.connect({
                            serviceHost: d.serviceHost,
                            ajaxServiceHost: d.ajaxServiceHost,
                            ajaxServiceBakHost: d.ajaxServiceBakHost,
                            timestamp: u
                        }), e.on("data:update", function (e) {
                            a.cinfo = e, i("body").trigger("cinfodatarecieve", [e])
                        }), e.emit({
                            uid: d.userId,
                            token: d.token,
                            uuid: n.getCookie("__mgjuuid"),
                            mgj: n.getCookie("__ud_"),
                            fromsite: n.getCookie("from_site")
                        })
                    }
                }
            })
        }()
}(window, document, jQuery, window.imio);
! function (t) {
    MOGU.imgCodeCheck = function () {
        var a = !1,
            i = t(".img_code_spin");
        if (0 == i.length) return a = !0;
        for (var c = 0; c < i.length; c++) {
            var e = t(i[c]);
            if (0 != e.val()) {
                a = !0;
                break
            }
        }
        return a
    }, MOGU.imgCaptchaInit = function () {
        var a = t(".imgcheck_image_div"),
            i = t("#imgcheck_code_change"),
            c = function (t, a) {
                var i = -75 * ((a + 1) % 4),
                    c = t[0].style.backgroundPosition.split(" ");
                t[0].style.backgroundPosition = c[0] + " " + i + "px"
            };
        a.click(function () {
            var a = t(this).attr("f"),
                i = t("#img_code_spin_" + a),
                e = parseInt(i.val());
            c(t(this), e), i.val(e + 1)
        }), i.click(function () {
            MOGU.imgCaptchaRecaptcha()
        })
    }, MOGU.imgCaptchaRecaptcha = function (a) {
        var i = function (a) {
            for (var i = t(".imgcheck_image_div"), c = i.length, e = 0; c > e; e++) {
                var n = i[e],
                    o = n.getAttribute("f"),
                    r = t("#img_code_spin_" + o);
                r.val(0);
                var u = t(n);
                u.css("background-image", "url(/captchaimg/" + a + ")"), u.css({
                    "background-position": -75 * e + "px 0"
                })
            }
        };
        void 0 === a ? t.ajax({
            url: "/reimgcaptcha",
            type: "POST",
            timeout: 6e4,
            data: {},
            dataType: "json",
            cache: !1,
            success: function (t) {
                var a = t.status.code;
                t.status.msg;
                if (1001 == a) {
                    var c = t.result.data.captchaId;
                    i(c)
                }
            }, error: function (t, a, i) {
                "timeout" == a && alert(MGLANG.msgTimeout)
            }
        }) : setTimeout(function () {
            i(a)
        }, 1)
    }, MOGU.imgCaptchaInit()
}(jQuery);
! function (t, e, n) {
    e.MOGU = e.MOGU || {};
    var i = {
        init: function () {
            t(document).off(".mga").on("click.mga", '[data-mga="event"]', function (e) {
                return function (n) {
                    var i, a, o, r, c;
                    return i = t(n.currentTarget), o = i.data("category") || i[0].tagName, a = i.data("action") || n.type, r = i.data("label") || i[0].className, c = i.data("value") || i.html(), e.triggerEvent(o, a, r, c)
                }
            }(this))
        }, triggerEvent: function (t, e, n, i) {
            var a = this;
            clearTimeout(o);
            var o = setTimeout(function () {
                a.event(t, e, n, i)
            }, 500)
        }, event: function (e, n, i, a) {
            var o = {
                action: n,
                page: e,
                pos: i
            };
            t.ajax({
                type: "POST",
                url: "http://www.meilishuo.com/itemsactionlog",
                data: o,
                success: function (t, e, n) {}, error: function (t, e, n) {}
            })
        }, isInScope: function (n) {
            return n.length > 0 && t(e).scrollTop() < n.offset().top + n.outerHeight() && t(e).scrollTop() + t(e).height() > n.offset().top
        }, pageview: function (t, e, n) {
            var i = this;
            clearTimeout(a);
            var a = setTimeout(function () {
                i.isInScope(n) && i.event(t, "view", e, null)
            }, 500)
        }
    };
    i.init(), MOGU.mga = i, "function" == typeof define && define.amd && define.amd.jQuery && define("mga", [], function () {
        return i
    })
}(jQuery, window);
! function (t, e) {
    "object" == typeof exports && "object" == typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define("mls-pc/common/nav/index", [], e) : "object" == typeof exports ? exports["mls-pc/common/nav/index"] = e() : t["mls-pc/common/nav/index"] = e()
}(this, function () {
    return function (t) {
        function e(o) {
            if (i[o]) return i[o].exports;
            var a = i[o] = {
                exports: {},
                id: o,
                loaded: !1
            };
            return t[o].call(a.exports, a, a.exports, e), a.loaded = !0, a.exports
        }
        var i = {};
        return e.m = t, e.c = i, e.p = "", e(0)
    }([
        function (t, e, i) {
            "use strict";
            i(1), i(2), i(3)
        },
        function (t, e, i) {
            var o, a;
            o = [], a = function () {
                function t(t, e, i) {
                    function o() {
                        var e = a.shift();
                        e && t.apply(e.context, e.arguments), 0 === a.length && (clearInterval(s), s = null)
                    }
                    var a = [],
                        s = null;
                    return function () {
                        a.push({
                            context: i || this,
                            arguments: [].slice.call(arguments)
                        }), s || (o(), s = setInterval(o, e))
                    }
                }

                function e(t, e, i) {
                    return parseInt(t + "", 0 | e).toString(0 | i)
                }

                function i() {
                    var t = $(".J_sitenav .wrap"),
                        e = (l.find(".mgj-my-cart"), l.find(".mgj-my-avatar"), ['<a href="index.html" rel="nofollow" class="home fl">美丽说首页</a>', '<ul class="header_top">', "{{? it.name}}", '<li class="s1 has_icon user_meta">', '<a rel="nofollow" href="javascript:;">', "{{=it.name}}", "</a>", '<a rel="nofollow" href="http://order.meilishuo.com/pcenter" target="_blank">', "{{?it.userLevel}}", '<span class="level level', "{{=it.userLevel - 1}}", '">&nbsp;</span>', "{{?}}", "</a>", '<i class="icon_delta"></i>', '<ol class="ext_mode" id="menu_personal">', '<li class="s2">', '<a target="_blank" rel="nofollow" href="setPersonal.html">个人设置</a>', "</li>", '<li class="s2">', '<a rel="nofollow" href="#">退出</a>', "</li>", "</ol>", "</li>", '<li class="s1 has_icon has_line user_fav">', '<a rel="nofollow" href="javascript:;">我的收藏</a>', '<i class="icon_delta"></i>', '<ul class="ext_mode">', '<li class="s2">', '<a target="_blank" rel="nofollow" href="mylike.html">收藏宝贝</a>', "</li>", '<li class="s2">', '<a target="_blank" rel="nofollow" href="mylikestore.html">收藏店铺</a>', "</li>", "</ul>", "</li>", "{{??}}", '<li class="s1 show-nologin">', '<a rel="nofollow" href="#?redirect=https%3a%2f%2faccount.meilishuo.com%2fuser%2fregister">注册</a>', "</li>", '<li class="s1 show-nologin">', '<a rel="nofollow" href="#?redirect=https%3a%2f%2faccount.meilishuo.com%2fuser%2flogin">登录</a>', "</li>", "{{?}}", '<li class="s1 myorder has_line">', '<a href="orderlist.html" target="_blank" class="text display_u" ref="nofollow">我的订单</a>', "</li>", '<li class="s1 has_line shopping_cart_v2">', '<a class="cart_info_wrap" href="mycart.html" target="_blank" ref="nofollow">', '<span class="cart_info">购物车</span>', "</a>", '<i class="icon_delta"></i>', '<span class="shopping_cart_loading"></span>', "</li>", '<li class="s1 has_line has_icon custom_item">', '<a rel="nofollow" href="http://www.meilishuo.com/helpcenter" ref="nofollow" target="_blank">帮助中心</a>', '<i class="icon_delta"></i>', '<ol class="ext_mode">', '<li class="s2"><a target="_blank" rel="nofollow" href="buyerService.html">买家服务</a></li>', '<li class="s2"><a target="_blank" rel="nofollow" href="#/help#/index">商家服务</a></li>', '<li class="s2"><a target="_blank" rel="nofollow" href="ruleCenter.html">规则中心</a></li>', "</ol>", "</li>", '<li class="s1 has_line has_icon">', '<a href="#" ref="nofollow" target="_blank" class="text display_u">商家后台</a>', "</li>", "</ul>"].join(""));
                    s.fn.getUserData(function (i, o) {
                        i || (t.html(s.ui.getTemplate(e, o)), $("body").trigger("userdatarecieve", [o]))
                    })
                }

                function o(t) {
                    $("#header .header_top"), $(".mgj_rightbar .mgj-my-cart"), $(".mgj_rightbar .mgj-my-avatar");
                    t.uname && t.uname.length > 0 && t.shopFaved && $(".J-shop-follow").addClass("shop-followed").html("已收藏"), t.jumpUrl && t.jumpUrl.length > 0 && (location.href = t.jumpUrl)
                }

                function a() {
                    function t(t) {
                        var e = new RegExp("(^|&)" + t + "=([^&]*)(&|$)", "i"),
                            i = window.location.search.substr(1).match(e);
                        return null != i ? unescape(i[2]) : null
                    }

                    function e(t, e) {
                        var i = new Date;
                        i.setTime(i.getTime() + 31536e6), document.cookie = t + "=" + escape(e) + ";expires=" + i.toGMTString()
                    }

                    function i(t) {
                        var e, i = new RegExp("(^| )" + t + "=([^;]*)(;|$)");
                        return (e = document.cookie.match(i)) ? unescape(e[2]) : null
                    }
                    var o = $("#menu_personal"),
                        a = $(".dapei_tip", o),
                        s = $(".dapei_btn", o);
                    s.click(function () {
                        e("dapei_tip_hidden", !0), a.hide(), setTimeout(function () {
                            o.mouseleave(function () {
                                $(this).removeClass("ext_mode_show")
                            })
                        }, 1e3)
                    }), null != t("isDaPeiShi") ? o.addClass("ext_mode_show") : "true" == $("#isDaPeiShi").val() && null == i("dapei_tip_hidden") && o.addClass("ext_mode_show")
                }
                var s = window.MoGu || {};
                s.fn = s.fn || {}, $.extend(s.fn, {
                    greyTest: function (t, e) {
                        $.ajax({
                            url: "http://www.meilishuo.com/trade/abtest/service/getBucket",
                            data: {
                                biz: t
                            },
                            dataType: "jsonp",
                            type: "get",
                            success: function (t) {
                                $.isFunction(e) && e(null, t)
                            }, fail: function (t) {
                                $.isFunction(e) && e(t)
                            }
                        })
                    }, getUserData: t(function (t) {
                        if (s.data = s.data || {}, s.data.userData) $.isFunction(t) && t(null, s.data.userData);
                        else {
                            var e = location.protocol + "//portal.meilishuo.com/api/profile/baseinfo";
                            "cashier.meilishuo.com" == location.hostname && (e = location.protocol + "//" + location.hostname + "/api/profile/baseinfo"), $.ajax({
                                url: e,
                                dataType: "jsonp",
                                type: "get",
                                success: function (e) {
                                    if (1001 == e.status.code) {
                                        var i = e.result;
                                        s.data.userData = i, $.isFunction(t) && t(null, i)
                                    } else {
                                        var i = {};
                                        s.data.userData = i, $.isFunction(t) && t(null, i)
                                    }
                                }, fail: function (e) {
                                    $.isFunction(t) && t(e)
                                }
                            })
                        }
                    }, 100)
                }), s.fn.id2url = function (t, i) {
                    var o = "",
                        a = i || 1;
                    if (t = "" + t, 24 == t.length) return t;
                    switch (a) {
                    case 1:
                        o = a + e(2 * t + 56, 10, 36);
                        break;
                    default:
                        o = !1
                    }
                    return o
                }, s.fn.url2id = function (t, e) {
                    if (e || (e = !1), 24 == t.length && t.match(/^[0-9a-f]+$/)) return t;
                    if (t instanceof Array) {
                        for (var i = 0; i < t.length; i++) {
                            var o = t[i];
                            t[i] = urltoid(o)
                        }
                        return t
                    }
                    if (t.indexOf(",") > 0) {
                        t = t.split(",");
                        for (var i = 0; i < t.length; i++) {
                            var o = t[i];
                            o ? t[i] = this.urltoid(o) : delete t[i]
                        }
                        return t.join(",")
                    }
                    if (e && t.match(/^(null|undefined)$/i)) return !1;
                    switch (version = parseInt(t.substr(0, 1)), version) {
                    case 1:
                        id = (parseInt(parseInt(t.substr(1) + "", 36).toString(10)) - 56) / 2;
                        break;
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                        id = 0;
                        break;
                    default:
                        id = t
                    }
                    return 0 < id ? parseInt(id) : 0
                };
                var n = $(".header_2015"),
                    l = $(".mgj_rightbar");
                i(), window.ESIMOGUPROFILE && o(MOGUPROFILE), a();
                var r = (s.ui.getdoT(), {});
                r.Tpl = {
                    headerMsgTpl: []
                }, r.View = {
                    init: function () {
                        this.addEvent()
                    }, addEvent: function () {
                        var t = this;
                        $("body").on("cinfodatarecieve", function (e, i) {
                            if (i) {
                                var o = i,
                                    a = {};
                                a.twitterNew = parseInt(o.cmessageNew), a.catmeNew = parseInt(o.a), a.cfavedNew = parseInt(o.b), a.cmsgNew = parseInt(o.c), a.fansNew = parseInt(o.d), a.csysmsgNew = parseInt(o.e), a.cactiveNew = parseInt(o.f), a.intelligent = parseInt(o.g), a.ccartNew = parseInt(o.h), a.chatNew = parseInt(o.i), a.ccouponShop = parseInt(o.q), a.ccouponPlatform = parseInt(o.j), $.each(t.renders, function (t, e) {
                                    $.isFunction(e) && e(a)
                                })
                            }
                        })
                    }, renders: {
                        renderNavCart: function (t) {
                            var e = n.find(".shopping_cart_v2");
                            if (e.length)
                                if (t.ccartNew > 0) {
                                    var i = t.ccartNew > 99 ? "99+" : t.ccartNew,
                                        o = '<span class="cart_info">购物车<b class="num">' + i + "</b>件</span>";
                                    e.find(".cart_info_wrap").html(o).show()
                                } else e.find(".cart_info_wrap").html('<span class="cart_info">购物车</span>')
                        }, renderSideBarCart: function (t) {
                            var e = l.find(".mgj-my-cart");
                            e.length && (t.ccartNew > 0 ? e.find(".num").html(t.ccartNew > 99 ? "99+" : t.ccartNew).show() : e.find(".num").hide())
                        }, renderSideBarCoupon: function (t) {
                            var e = l.find(".mgj-my-coupon");
                            if (e.length) {
                                var i = parseInt(t.ccouponShop + t.ccouponPlatform, 10);
                                i ? e.find(".num").html(i > 99 ? "99+" : i).show() : e.find(".num").hide()
                            }
                        }, renderNavMsg: function (t) {
                            var e = n.find(".mogutalk_btn");
                            e.length && (t.chatNew ? e.find(".num").html(t.chatNew > 99 ? "99+" : t.chatNew).show() : e.find(".num").hide())
                        }
                    }
                }, r.View.init();
                var c = function () {
                    this.highClassName = "s1_on"
                };
                c.prototype = {
                    add2Collection: function (t) {
                        $.browser.msie && 6 == $.browser.version && $.isPlainObject(t) && t.wrap.length && t.target && this._registerEvent(t)
                    }, _registerEvent: function (t) {
                        var e = this;
                        t.wrap.on("mouseenter", t.target, function (t) {
                            $(this).addClass(e.highClassName).siblings().removeClass(e.highClassName)
                        }), t.wrap.on("mouseleave", t.target, function (t) {
                            $(this).removeClass(e.highClassName)
                        })
                    }
                }, (new c).add2Collection({
                    wrap: $(".header_top"),
                    target: ".s1"
                })
            }.apply(e, o), !(void 0 !== a && (t.exports = a))
        },
        function (t, e, i) {
            var o, a;
            o = [], a = function () {
                var t = {},
                    e = ['<div class="shop_cart_info" style="display: none;">', '<ul class="max_height_ie6">', "{{~ it.list:item:index}}", "{{?index < it.topNum}}", "<li>", '<a rel="nofollow" href="shopdetail.html#?{{=item.itemIdEsc}}" target="_blank" class="imgbox">', "{{?item.imgUrl}}", '<img src="{{=item.imgUrl}}" alt="{{=item.title}}" width="45">', "{{?}}", "</a>", '<a rel="nofollow" href="shopdetail.html#?{{=item.itemIdEsc}}" target="_blank" class="title">{{=item.title}}</a>', "{{?item.skuAttributes}}", '<span class="info">{{~ item.skuAttributes:sku:key }}{{=sku.key}}: {{=sku.value}}  {{~}}</span>', "{{?}}", '<span class="price">¥{{=(item.nowprice/100)}}</span>', '<span data-stockid="{{=item.stockIdEsc}}" class="del">删除</span>', "</li>", "{{?}}", "{{~}}", "</ul>", '<div class="subbox">', "{{?it.total-it.topNum>0}}", '<p class="sub_info">购物车里还有<b class="num">{{=it.total - it.topNum}}</b>件商品</p>', "{{?}}", '<div class="fr">', '<a rel="nofollow" href="mycart.html" target="_blank" class="goel">查看购物车</a>', "</div>", "</div>", "</div>"].join("");
                t.Model = {
                    goodsList: "",
                    offlineCartCookies: "",
                    offlineCartCookiesOld: "",
                    goodsNum: 0,
                    getGoodsList: function (t) {
                        var e = this;
                        if (e.goodsList) return void($.isFunction(t) && t(this.goodsList));
                        var i = [];
                        if (MoGu.util.getCookie("trade_cart_meilishuo") && (e.offlineCartCookies = MoGu.util.getCookie("trade_cart_meilishuo")), e.offlineCartCookies) {
                            var o = JSON.parse(e.offlineCartCookies);
                            for (var a in o) {
                                var s = {};
                                s.stockId = a;
                                for (var n in o[a]) s[n] = o[a][n];
                                i.push(s)
                            }
                        }
                        if (e.offlineCartCookiesOld)
                            for (var o = e.offlineCartCookiesOld.split(","), s = {}, n = 0; n < o.length; n++)
                                if (o[n].indexOf("#") > -1) {
                                    var l = o[n].split("#");
                                    s.number = l[0], s.lastAddCartTime = l[1], i.push(s), s = {}
                                } else s.stockId = MoGu.fn.id2url(o[n]);
                        var r = {
                            marketType: "market_meilishuo",
                            topNum: e.maxShowNum,
                            offlineCartItems: JSON.stringify(i)
                        };
                        $.ajax({
                            url: "http://cart.meilishuo.com/api/cart/miniCartList",
                            data: r,
                            dataType: "jsonp",
                            type: "get",
                            success: function (i) {
                                1001 == i.status.code ? (e.goodsList = i.result.cartItems ? i.result.cartItems : [], e.goodsNum = i.result.totalItemNum || 0, $.isFunction(t) && t(e.goodsList)) : $.isFunction(t) && t([])
                            }
                        })
                    }, delCookie: function (t, e) {
                        var i = {};
                        if (this.offlineCartCookies) {
                            var o = JSON.parse(this.offlineCartCookies);
                            for (var a in o) a != t && (i[a] = o[a]);
                            MoGu.util.setCookie("trade_cart_meilishuo", JSON.stringify(i), {
                                expires: 15,
                                path: "/",
                                domain: ".meilishuo.com"
                            })
                        }
                    }, delGood: function (t, e) {
                        var i = this;
                        $.post("/api/cart/deleteCart", {
                            marketType: "market_meilishuo",
                            stockId: t
                        }, function (o) {
                            if (1001 == o.status.code) {
                                var a = o.status.isLogin;
                                a || i.delCookie(t), $.isFunction(e) && e()
                            } else alert(o.status.msg)
                        }, "json")
                    }
                }, t.View = {
                    wrap: $(".header_2015"),
                    init: function () {
                        this.wrap.length && (this.extendInfo = null, this.loading = this.wrap.find(".shopping_cart_loading"), this.maxShowNum = 5, this.addEvent())
                    }, addEvent: function () {
                        var i = this;
                        this.wrap.find(".cart_info_wrap").attr("href", "mycart.html"), $(".mgj_rightbar .mgj-my-cart a").attr("href", "mycart.html"), i.wrap.off("mouseenter").on("mouseenter", ".shopping_cart_v2", function (o) {
                            var a = $(this);
                            a.addClass("sc_on"), i.loading.show(), i.extendInfo && i.extendInfo.length ? (i.loading.hide(), i.extendInfo.show()) : t.Model.getGoodsList(function (o) {
                                var s = {
                                    list: o,
                                    topNum: i.maxShowNum,
                                    total: t.Model.goodsNum
                                };
                                if (o.length) {
                                    var n = MoGu.ui.getTemplate(e, s);
                                    i.extendInfo = $(n)
                                } else {
                                    var n = '<div class="shop_cart_info"></div>';
                                    i.extendInfo = $(n), i.extendInfo.addClass("empty_cart").text("购物车里没有商品！")
                                }
                                a.append(i.extendInfo), i.loading.hide(), i.extendInfo.show()
                            })
                        }), i.wrap.off("mouseleave").on("mouseleave", ".shopping_cart_v2", function (t) {
                            i.extendInfo && i.extendInfo.hide() && $(this).removeClass("sc_on")
                        }), i.wrap.off("click").on("click", ".shopping_cart_v2 .del", function () {
                            var e = $(this),
                                o = e.data("stockid"),
                                a = (i.wrap.find(".num"), e.parent()),
                                s = t.Model.goodsNum;
                            e.hasClass("disabled") || (e.addClass("disabled"), t.Model.delGood(o, function () {
                                s--, a.fadeOut("slow", function () {
                                    e.removeClass("disabled"), s ? (a.remove(), t.Model.goodsNum = s) : (i.extendInfo = $(".shop_cart_info"), i.extendInfo.addClass("empty_cart").text("购物车里没有商品！"))
                                })
                            }))
                        })
                    }
                }, t.View.init()
            }.apply(e, o), !(void 0 !== a && (t.exports = a))
        },
        function (t, e, i) {
            var o;
            o = function () {
                var t = {
                    wrap: $(".back2top_wrap"),
                    init: function () {
                        this.wrap.length && (this.offsetEl = $(".wrap").length ? $(".wrap").eq(0) : $("#body"), this.offsetEl.length && (this.win = $(window), this.goTop = this.wrap.find(".go_top"), this.setPos(), this.wrap.show(), this.addEvent()))
                    }, addEvent: function () {
                        var t = this;
                        this.win.on("resize", function (e) {
                            t.setPos()
                        }), this.win.on("scroll", function (e) {
                            $(this).scrollTop() ? t.goTop.addClass("show") : t.goTop.removeClass("show")
                        }), this.goTop.on("click", function (e) {
                            return t.win.scrollTop(0), !1
                        })
                    }, setPos: function () {
                        var t = this.offsetEl.offset(),
                            e = this.offsetEl.outerWidth(),
                            i = this.win.width(),
                            o = this.wrap.width(),
                            a = 15,
                            s = t.left + e + 20;
                        o + s + a > i ? this.wrap.css({
                            left: "auto",
                            right: a
                        }) : this.wrap.css({
                            left: s,
                            right: "auto"
                        })
                    }
                };
                t.init()
            }.call(e, i, e, t), !(void 0 !== o && (t.exports = o))
        }
    ])
}), "function" == typeof define && define.amd && require(["mls-pc/common/nav/index"]);
! function () {
    window.PTP_PARAMS = window.PTP_PARAMS || {}, $.extend(window.PTP_PARAMS, {
        EnableLogMoGuJs: !1,
        uuid: ["__mgjuuid"],
        uid: ["__ud_"],
        platform: function () {
            var i = navigator.userAgent;
            return -1 != i.indexOf("meilishuo4android") || -1 != i.indexOf("meilishuo android") ? "24" : -1 != i.indexOf("meilishuo4ios") || -1 != i.indexOf("Meilishuo iPhone") ? "23" : /MicroMessenger/i.test(i) ? "47" : /QQ/i.test(i) ? "48" : /iphone|android|ipad/i.test(i) ? "34" : "33"
        }, hrefRe: /http[s]?:\/\/\w+\.(meilishuo)\.com([\/]|\/.*|)$/,
        mgjRe: /(meilishuo|mls):\/\//,
        isNativeRe: /(meilishuo|mls|mogujie)/i,
        nativeLog: {}
    })
}(), console.log("");
! function (e) {
    "use strict";

    function t() {
        this.arr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", this.arrLen = this.arr.length
    }

    function n() {
        var e = p.getPtpInfoAndExtra(),
            t = c.getValue(g.pEventId);
        s.logData("p", t, e), g.EnableLogMoGuJs && s.sendLog(g.LogMoGuJsUrl, e, !0)
    }

    function r() {
        if (o.info.isNative) {
            var e = p.getPtpCnt();
            s.logAppPevent(e)
        } else l ? n() : c.listenTo("LoggerReady", function () {
            n()
        })
    }
    var o = e.logger = {};
    o.version = "0.1.8", "undefined" == typeof console && (window.console = {
        log: function () {}
    });
    var i = "**logger.js---打点出错:";
    ! function () {
        var e = window.jQuery || window.Zepto,
            t = function (e, t) {
                for (var n = 0, r = e.length; r > n; n++)
                    if (e[n] == t) return n + 1;
                return -1
            },
            n = {
                getA: function (e) {
                    var t = e;
                    if ("A" == t.tagName) return e;
                    for (; t.parentNode;)
                        if (t = t.parentNode, "A" == t.tagName) return t
                }, getParentByClass: function (t, n) {
                    if (t) {
                        if (e) return $(t).parents("." + n);
                        for (var r, o = t; o.parentNode;)
                            if (o = o.parentNode, r = o.className && -1 != o.className.indexOf(n)) return o
                    }
                }, getParents: function (t, n) {
                    if (t) {
                        if (n = n || "", e) return n = "[" + n + "]", $(t).parents(n)[0];
                        for (var r, o = t; o.parentNode;)
                            if (o = o.parentNode, r = o.getAttribute && o.getAttribute(n)) return o
                    }
                }, getIndex: function (n, r, o) {
                    if (!n || !r || !o) return 0;
                    if (e) return $("[" + n + '="' + r + '"]').index($(o)) + 1;
                    if (document.querySelectorAll) {
                        var i = document.querySelectorAll("[" + n + '="' + r + '"]');
                        return t(i, o)
                    }
                    return 1
                }, getElemIndex: function (n, r, o) {
                    if (!n || !r || !o) return 0;
                    if (e) return $(n).find(r).index($(o)) + 1;
                    if (n.querySelectorAll) {
                        var i = n.querySelectorAll(r);
                        return t(i, o)
                    }
                    return 1
                }, is: function (e, t) {
                    return e && t ? (e.length && (e = e[0]), e.nodeName.toLowerCase() === t.toLowerCase() ? !0 : void 0) : !1
                }
            };
        o.jq = n
    }();
    var a = 1001,
        u = {},
        c = {
            getIEVersion: function () {
                var e, t = -1,
                    n = navigator.userAgent;
                return "Microsoft Internet Explorer" == navigator.appName ? (e = new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})"), null !== e.exec(n) && (t = parseFloat(RegExp.$1))) : "Netscape" == navigator.appName && (e = new RegExp("Trident/.*rv:([0-9]{1,}[.0-9]{0,})"), null !== e.exec(n) && (t = parseFloat(RegExp.$1))), t
            }, stringify: function (e) {
                if ("undefined" != typeof JSON) return JSON.stringify(e);
                var t = typeof e;
                if ("object" != t || null === e) return "string" == t && (e = '"' + e + '"'), String(e);
                var n, r, o = [],
                    i = e && e.constructor == Array;
                for (n in e) r = e[n], t = typeof r, e.hasOwnProperty(n) && ("string" == t ? r = '"' + r + '"' : "object" == t && null !== r && (r = c.stringify(r)), o.push((i ? "" : '"' + n + '":') + String(r)));
                return (i ? "[" : "{") + String(o) + (i ? "]" : "}")
            }, isArray: function (e) {
                return "[object Array]" == Object.prototype.toString.call(e)
            }, getCookieInArray: function (e) {
                for (var t = 0, n = e.length; n > t; t++) {
                    var r = c.getCookie(e[t]);
                    if (r) return r
                }
                return ""
            }, getCookieOrFunc: function (e) {
                return "function" == typeof e ? c.getValue(e) : c.getCookie(e)
            }, getCookie: function (e) {
                if (c.isArray(e)) return c.getCookieInArray(e);
                var t = document.cookie.match(new RegExp("(^| )" + e + "=([^;]*)(;|$)"));
                return null !== t ? decodeURIComponent(t[2]) : ""
            }, getQuery: function (e, t) {
                void 0 === t && (t = location.search), t = t.split("#")[0];
                var n = "(^|&|\\?)" + e + "=([^&]*)(&|$)",
                    r = new RegExp(n, "i"),
                    o = t.substr(1).match(r);
                return null !== o ? decodeURIComponent(o[2]) : ""
            }, setQuery: function (e, t, n) {
                var r = new RegExp("([?&])" + t + "=.*?(&|$)", "i"),
                    o = -1 !== e.indexOf("?") ? "&" : "?";
                return e.match(r) ? e.replace(r, "$1" + t + "=" + n + "$2") : e + o + t + "=" + n
            }, getTime: function () {
                return parseInt((new Date).getTime() / 1e3)
            }, registerEvent: function (e, t, n) {
                window.attachEvent ? e.attachEvent("on" + t, n) : e.addEventListener(t, n, !1)
            }, extend: function () {
                for (var e = arguments, t = arguments[0], n = 1; n < e.length; n++) {
                    var r = e[n];
                    for (var o in r) r.hasOwnProperty(o) && (t[o] = r[o])
                }
                return t
            }, getValue: function (e) {
                if (e) {
                    if ("function" == typeof e) try {
                        var t = Array.prototype.slice.call(arguments, 1);
                        return e.apply(null, t)
                    } catch (n) {
                        return console.log(i + n), ""
                    }
                    return e
                }
            }, loadScript: function (e, t) {
                var n = document.createElement("script");
                n.src = e + "?callback=callback_" + a, window["callback_" + a] = function (e) {
                    t && t(e)
                }, a += 1;
                var r = document.getElementsByTagName("head")[0];
                r.appendChild(n)
            }, listenTo: function (e, t) {
                u[e] || (u[e] = []), u[e].push(t)
            }, fire: function (e) {
                var t = u[e];
                if (t.length) {
                    for (var n = 0, r = t.length; r > n; n++) t[n].call();
                    u[e] = []
                }
            }
        };
    o.util = c;
    var d = "https:" === location.protocol ? "https:" : "http:",
        f = "mogujie"; - 1 != location.host.indexOf("meilishuo") && (f = "meilishuo"), o.config = {
            EnableLogMoGuJs: !0,
            LogUrl: d + "//log.juangua.com/log.php",
            LogMoGuJsUrl: d + "//log.juangua.com/mogu.js",
            CookieUrl: d + "//portal." + f + ".com/api/util/getUuid",
            shouldRequestCookie: function () {
                if (-1 != location.protocol.indexOf("file:")) return !1;
                var e = o.util.getCookieOrFunc(o.config.uuid);
                return !e
            }, uuid: ["__mgjuuid", "__xduuid"],
            uid: "__ud_",
            sfrom: "from_site",
            cpsinfo: "__cpsinfo",
            ptp_cnt_a: "",
            ptp_cnt_b: "",
            ptp_cnt_c_d: "",
            platform: function () {
                var e = navigator.userAgent;
                return /qq\/([\d\.]+)/.test(e) ? 48 : void 0
            }, pEventId: "1001",
            isMobileRe: /iphone|android|ipad/i,
            ptpRe: /[a-z0-9]+\.[a-z0-9]+\.[a-z0-9]+\.[a-z0-9]+\.[a-z0-9]+/i,
            hrefRe: /http[s]?:\/\/\w+\.(mogujie|xiaodian|uniny)\.com([\/]|\/.*|)$/,
            mgjRe: /mgj:\/\//,
            mtRe: /\?.*[&]?mt=([^\.]+)\.([^\.]+)\.([^\.&#]+)/,
            chasing: ["f", "f2"],
            urlExtend: ["acm"],
            extra: {},
            isNativeRe: /mogujie(?!nonative)/i,
            nativeLog: {}
        }, window.PTP_PARAMS && c.extend(o.config, PTP_PARAMS), t.prototype = {
            rand: function (e) {
                var t, n = "";
                for (t = 0; e > t; t++) n += this.arr.charAt(Math.random() * this.arrLen);
                return n
            }, pageHash: function (e) {
                var t = 5381,
                    n = e.length - 1;
                if ("string" == typeof e)
                    for (; n > -1; n--) t += (t << 5) + e.charCodeAt(n);
                else
                    for (; n > -1; n--) t += (t << 5) + e[n];
                var r = 2147483647 & t,
                    o = "";
                do o += this.arr.charAt(61 & r); while (r >>= 6);
                return o
            }
        },
        function () {
            var e = o.config,
                t = navigator.userAgent.toLocaleLowerCase();
            o.info = {
                isApp: e.isNativeRe.test(t),
                isNative: e.isNativeRe.test(t),
                isMobile: e.isMobileRe.test(t),
                isIos: t.indexOf("iphone") > -1,
                isAndroid: t.indexOf("android") > -1,
                isXd: location.href.indexOf(".xiaodian.") > -1
            }
        }(),
        function () {
            function e(e, t) {
                for (var n, r = 0; r < e.length; r++)
                    if (n = new RegExp(e[r]), n.test(t)) return !0;
                return !1
            }
            o.needReferFix = !1;
            var t = navigator.userAgent.toLocaleLowerCase(),
                n = o.info.isApp && o.info.isAndroid,
                r = -1 != t.indexOf("meilishuo"),
                i = -1 != t.indexOf("mogujie"),
                a = -1 != t.indexOf("referfix=1"),
                u = ["^http://(m|www).mogujie.com/x6/wall/book/([a-z]+)/?(\\S*)$", "^http://(m|www).mogujie.com/x6/marketchannel\\?(\\S*)$", "^http://(m|www).mogujie.com/x6/detail/(\\w*)[\\?]?(\\S*)$", "^http://(m|www).mogujie.com/x6/shop/(.*?)/goodsall[\\?]?(\\S*)$", "^http://(m|www).mogujie.com/x6/account/getprofile[\\?].*?uid=(\\w*).*?$", "^http://(m|www).mogujie.com/x6/attention/lifestyle[\\?].*?id=(\\w*).*?((ptp|url_ptp)=([\\w.]+))?$", "^http://(m|www).mogujie.com/x6/shop/(\\w+)/?(\\?(.*))?$", "^http://(m|www).mogujie.com/x6/book/([a-z]+)/?(\\S*)$", "^http://(m|www).mogujie.com/x6/search/?\\?keywords=([^&]+)(\\S*)$"],
                c = ["^https?://sgitem.meilishuo.com/sgdetail/(\\w+)/?\\??(.*?)$", "^https?://item.meilishuo.com/h5/detail/(\\w+)/?\\??(.*?)$", "^https?://www.mogujie.com/trade/order/detail4buyer\\?.*?orderId=(\\w+).*?$", "^https?://www.mogujie.com/trade/refund/detail\\?.*?itemOrderId=(\\w+).*?$", "^(http|https)://sgitemapp.meilishuo.com/sgdetail/(\\w+).*?$", "^https?://act.meilishuo.com/keyword/?\\??(.*?)?$", "^https?://weixin.meilishuo.com/wx/shop/(\\w+)/?\\??(.*?)$"];
            o.matchNativeLink = e;
            var d = function (t) {
                    return -1 != t.indexOf("mls://") ? !0 : e(c, t)
                },
                f = function (t) {
                    return -1 != t.indexOf("mgj://") ? !0 : -1 == t.indexOf("/x6/") ? !1 : e(u, t)
                };
            o.isMgjNativeLink = f;
            var p = function () {
                    var e = "";
                    if (n) {
                        if (a) return !0;
                        var o = t.match(/\/(\d{3})\//);
                        if (o && o[1]) {
                            if (e = parseInt(o[1]), r && 832 >= e) return !0;
                            if (i && 806 >= e) return !0
                        }
                    }
                    return !1
                },
                g = function (e) {
                    return o.util.setQuery(e, "_isfilter", "1")
                };
            o.needReferFix = p(), o.fixReferUrl = function (e) {
                return r && d(e) ? e : i && f(e) ? e : g(e)
            }
        }(),
        function () {
            function e() {
                var e = "1";
                return s.isMobile && (e = "m1"), s.isIos && s.isNative ? e = "am0" : s.isAndroid && s.isNative && (e = "am1"), e
            }

            function n() {
                var e = c.getValue(g.ptp_cnt_b);
                if (e) return e;
                var t = "",
                    n = location.href.split("?")[0];
                return t = m.pageHash(n)
            }

            function r() {
                var e = c.getCookieOrFunc(g.cpsinfo);
                return e ? e = e.replace("-", ",") : ""
            }

            function i() {
                var e = c.getValue(g.platform);
                return e ? e : s.isMobile ? 32 : 31
            }

            function a(e) {
                if (e) {
                    var t = c.getValue(g.ptp_cnt_c_d, e);
                    if (t) return t;
                    var n = e.getAttribute("data-ptp-customc");
                    if (n) return {
                        c: n,
                        d: l.getIndex("data-ptp-customc", n, e)
                    };
                    if (e = l.getParents(e, "data-ptp-customc")) return n = e.getAttribute("data-ptp-customc"), n ? {
                        c: n,
                        d: l.getIndex("data-ptp-customc", n, e)
                    } : void 0
                }
            }

            function u() {
                -1 != location.protocol.indexOf("file:") && document.addEventListener("deviceready", function () {
                    window.hybrid && hybrid.bundle && hybrid.bundle.getUrl && hybrid.bundle.getUrl(function (e) {
                        v && (v.refer = e)
                    })
                }, !1)
            }

            function d() {
                return u(), {
                    time: c.getTime(),
                    sfrom: c.getCookieOrFunc(g.sfrom),
                    uuid: c.getCookieOrFunc(g.uuid),
                    uid: c.getCookieOrFunc(g.uid),
                    cpsinfo: r(),
                    refer: location.href,
                    rerefer: document.referrer,
                    ptp_url: c.getQuery("ptp", location.search),
                    ptp_ref: c.getQuery("ptp", document.referrer)
                }
            }

            function f() {
                return {
                    a: e(),
                    b: n(),
                    c: 0,
                    d: 0,
                    e: m.rand(5)
                }
            }
            var p, g = o.config,
                s = o.info,
                l = o.jq,
                m = new t,
                v = d(),
                h = f();
            o.ptp = p = {
                getPtpByType: function (e, t) {
                    var n = i(),
                        r = [v.time, 0, "p/e", n, o.version, "1001", v.uuid, v.uid, v.refer, v.rerefer];
                    return "p" == e ? (t = t || "1001", r[2] = "p", r[5] = t, r) : "e" == e ? (t = t || "50001", r[2] = "e", r[5] = t, r) : void 0
                }, getPtpCnt: function (e, t) {
                    return e || (e = h.c), t || (t = h.d), [h.a, h.b, e, t, h.e].join(".")
                }, getPtpInfo: function () {
                    var e = {};
                    return c.extend(e, v, {
                        ptp_cnt: p.getPtpCnt()
                    })
                }, getPtpInfoAndExtra: function () {
                    var e = p.getPtpInfo(),
                        t = {};
                    if (g.extra)
                        for (var n in g.extra) g.extra.hasOwnProperty(n) && (t[n] = c.getValue(g.extra[n]));
                    return c.extend(e, t)
                }, createPtpCnt: function (e) {
                    var t = a(e),
                        n = 0,
                        r = 0;
                    if (t) return p.getPtpCnt(t.c, t.d);
                    var o = l.getParents(e, "data-ptp"),
                        i = l.getParentByClass(e, "data-ptp-item");
                    return o && (n = o.getAttribute("data-ptp"), r = i ? l.getElemIndex(o, ".data-ptp-item", i) : l.getElemIndex(o, "a", e)), r || (r = 0), p.getPtpCnt(n, r)
                }, makeUrl: function (e, t, n) {
                    var r = e.match(/(#.+)$/);
                    return e = e.replace(/(#.+)$/, ""), e = c.setQuery(e, "ptp", t), e = p.getChasingParams(e), e = p.getExtendParams(n, e), o.needReferFix && (e = o.fixReferUrl(e)), r && (e += r[1]), e
                }, getChasingParams: function (e) {
                    void 0 === e && (e = "");
                    var t = e;
                    if (!g.chasing) return t;
                    g.chasing.length || (g.chasing = [g.chasing]);
                    for (var n, r, o = 0, i = g.chasing.length; i > o; o++) n = g.chasing[o], r = c.getQuery(n), r && (t = c.setQuery(t, n, r));
                    return t
                }, getExtendParams: function (e, t) {
                    var n = t;
                    if (!e || !l.is(e, "a")) return n;
                    e.length && (e = e[0]);
                    for (var r = g.urlExtend || [], o = 0, i = r.length; i > o; o++) {
                        var a = r[o],
                            u = e.getAttribute("data-ext-" + a);
                        u && (n = c.setQuery(n, a, u))
                    }
                    return n
                }, refreshPtp: function () {
                    v = d(), h = f()
                }, refreshCookie: function () {
                    v && (v.sfrom = c.getCookieOrFunc(g.sfrom), v.uuid = c.getCookieOrFunc(g.uuid), v.uid = c.getCookieOrFunc(g.uid), v.cpsinfo = r())
                }
            }
        }(),
        function () {
            var e = o.info,
                t = o.ptp,
                n = o.config,
                r = 0,
                a = function (e, t) {
                    t = t || {};
                    var n = [];
                    for (var r in t) {
                        var o = t[r];
                        o || (o = ""), o = encodeURIComponent(o), n.push(r + "=" + o)
                    }
                    n = n.join("&"), e = e.indexOf("?") > -1 ? e + "&" + n : e + "?" + n;
                    var i = new Image;
                    i.src = e
                },
                u = function (e, t) {
                    t = t || {};
                    var n, o = r++;
                    try {
                        n = document.createElement('<iframe name="' + o + '">')
                    } catch (a) {
                        n = document.createElement("iframe"), n.setAttribute("name", o)
                    }
                    try {
                        n.style.display = "none", document.body.appendChild(n), n.contentWindow.name = o;
                        var u = document.createElement("form");
                        u.setAttribute("method", "POST"), u.setAttribute("action", e), u.setAttribute("target", o);
                        for (var d in t)
                            if (t.hasOwnProperty(d)) {
                                var f = document.createElement("input");
                                f.setAttribute("type", "hidden"), f.setAttribute("name", d), f.setAttribute("value", t[d]), u.appendChild(f)
                            }
                        document.body.appendChild(u), u.submit(), c.registerEvent(n, "load", function () {
                            try {
                                document.body.removeChild(u), document.body.removeChild(n)
                            } catch (e) {}
                        })
                    } catch (a) {
                        console.log(i + a)
                    }
                },
                d = {
                    sendLog: function (e, t, n) {
                        var r = c.getIEVersion(),
                            o = -1 != r && 8 >= r;
                        o && !n ? u(e, t) : a(e, t)
                    }, sendAppLog: function (e, t) {
                        return e += "", n.nativeLog && n.nativeLog.logE ? n.nativeLog.logE(e, t) : void(window.hdp && window.hdp["do"] ? hdp["do"]("mgj.tracker.sendEvent", e, t) : document.addEventListener("deviceready", function () {
                            window.mgj && mgj.tracker && mgj.tracker.sendEvent && mgj.tracker.sendEvent(e, t)
                        }, !1))
                    }, logAppPevent: function (e) {
                        return n.nativeLog && n.nativeLog.logP ? n.nativeLog.logP(e) : void(window.hdp && window.hdp["do"] ? hdp["do"]("mgj.pevent", e).then(function () {}, function (e) {
                            console.log("pevent:" + e)
                        }) : document.addEventListener("deviceready", function () {
                            window.mgj && mgj.pevent && mgj.pevent(function () {}, null, e)
                        }, !1))
                    }, logData: function (r, o, i) {
                        var a = t.getPtpByType(r, o);
                        a.push(c.stringify(i)), e.isNative ? d.sendAppLog(o, i) : d.sendLog(n.LogUrl, {
                            v: 1,
                            data: a.join("	")
                        })
                    }
                };
            o.send = d
        }(),
        function () {
            function e(e) {
                var t = e.href;
                if (!(t.indexOf("mogujie.com/mtalk/") > -1) && (n.hrefRe.test(t) || n.mgjRe.test(t))) {
                    var o = e.getAttribute("data-ptp-cache-id");
                    t = e.getAttribute("href"), o && n.ptpRe.test(o) || (o = r.createPtpCnt(e), e.setAttribute("data-ptp-cache-id", o)), e.href = r.makeUrl(t, o, e)
                }
            }

            function t(t) {
                var n = t || window.event,
                    r = n.target || n.srcElement,
                    o = i.getA(r),
                    a = "AREA" === r.nodeName ? r : null;
                a && (o = a), o && (o.href && o.href.indexOf("javascript:") > -1 || e(o))
            }
            var n = o.config,
                r = o.ptp,
                i = o.jq,
                a = "tap" in document.createElement("div") ? "tap" : "mousedown";
            c.registerEvent(document, a, t), c.registerEvent(document, "touchstart", t)
        }();
    var p = o.ptp,
        g = o.config,
        s = o.send,
        l = !g.shouldRequestCookie();
    if (l || c.loadScript(g.CookieUrl, function () {
        l = !0, o.ptp.refreshCookie(), c.fire("LoggerReady")
    }), r(), o.refreshPevent = function () {
        o.ptp.refreshPtp(), r()
    }, o.log = function (e, t) {
        if (void 0 !== e) {
            t = t || {};
            var n = p.getPtpInfoAndExtra();
            l ? o.send.logData("e", e, c.extend({}, n, t)) : c.listenTo("LoggerReady", function () {
                var n = p.getPtpInfoAndExtra();
                o.send.logData("e", e, c.extend({}, n, t))
            }), window.MtaH5 && MtaH5.clickStat && MtaH5.clickStat(e, t)
        }
    }, o.generatePtpParams = function (e, t) {
        if (void 0 !== e) {
            var n = "";
            return n = t ? p.createPtpCnt(t) : p.getPtpCnt(), p.makeUrl(e, n, t)
        }
    }, o.needReferFix && document.referrer) {
        var m = p.getPtpInfoAndExtra();
        o.log("016000616", {
            ptp_cnt2: m.ptp_cnt,
            ptp_url2: m.ptp_url,
            ptp_ref2: m.ptp_ref
        })
    }
    "undefined" != typeof module && "object" == typeof exports ? module.exports = o : "function" == typeof define && (define.amd || define.cmd) && define("logger", function () {
        return o
    })
}(window);
! function (e) {
    function t(r) {
        if (n[r]) return n[r].exports;
        var i = n[r] = {
            exports: {},
            id: r,
            loaded: !1
        };
        return e[r].call(i.exports, i, i.exports, t), i.loaded = !0, i.exports
    }
    var n = {};
    return t.m = e, t.c = n, t.p = "", t(0)
}([
    function (e, t, n) {
        function r(e) {
            return e = e || {}, e.extra = e.extra || {}, "e" === e.type ? p.constructTraceData(e) : "n" === e.type ? p.constructNetworkData(e) : e
        }
        var i = n(1),
            o = n(3),
            a = n(5),
            s = n(10),
            d = n(6),
            u = (n(9), n(2)),
            c = n(4),
            p = n(8),
            f = n(7);
        try {
            f.init(), d.init(), a.init(), s.init(), u.addEventListener(window, "load", function () {
                d.send(p.constructNetworkData({
                    type: "n",
                    url: u.formatUrl(location.href),
                    responseCode: 200,
                    responseSize: c.BLANK_VALUE,
                    responseTime: o.getResponseTime(),
                    bizCode: c.BLANK_VALUE,
                    extra: {}
                })), d.send(p.constructTraceData({
                    type: "e",
                    extra: u.extend({
                        performanceEvent: !0,
                        eventid: c.eventidMap[i.getPlatform()]
                    }, i.getAll(), o.getOnload())
                }))
            })
        } catch (g) {}
        var l = {
            send: function (e) {
                d.send(r(e))
            }, sendImmediately: function () {
                d.sendImmediately(r(data))
            }
        };
        window._trace || (window._trace = l), window.Mogu && window.Mogu.util && (window.Mogu.util.trace = l)
    },
    function (e, t, n) {
        function r() {
            var e = navigator.appVersion;
            return /Mobile|mini|Fennec|Android|iP(ad|od|hone)/.test(e) ? "h5" : "pc"
        }

        function i() {
            var e, t, n = (navigator.appVersion, navigator.userAgent),
                r = "其它",
                i = r,
                o = "",
                a = "";
            return -1 != (e = n.indexOf("Opera")) && (i = "Opera", o = n.substring(e + 6), -1 != (e = n.indexOf("Version")) && (o = n.substring(e + 8))), -1 != (e = n.indexOf("OPR")) ? (i = "Opera", o = n.substring(e + 4)) : -1 != (e = n.indexOf("MSIE")) ? (i = "IE", o = n.substring(e + 5)) : -1 != (e = n.indexOf("Chrome")) ? (i = "Chrome", o = n.substring(e + 7)) : -1 != (e = n.indexOf("Safari")) ? (i = "Safari", o = n.substring(e + 7), -1 != (e = n.indexOf("Version")) && (o = n.substring(e + 8))) : -1 != (e = n.indexOf("Firefox")) ? (i = "Firefox", o = n.substring(e + 8)) : -1 != n.indexOf("Trident/") ? (i = "IE", o = n.substring(n.indexOf("rv:") + 3)) : -1 != n.toLowerCase().indexOf("meilishuo") ? i = "Meilishuo" : -1 != n.indexOf("MicroMessenger") ? i = "Wechat" : -1 != n.indexOf("QQ") ? i = "QQ" : -1 != n.indexOf("Weibo") ? i = "Weibo" : -1 != n.indexOf("baiduboxapp") && (i = "Baidu"), -1 != (t = o.indexOf(";")) && (o = o.substring(0, t)), -1 != (t = o.indexOf(" ")) && (o = o.substring(0, t)), -1 != (t = o.indexOf(")")) && (o = o.substring(0, t)), o && (a = parseInt("" + o, 10), isNaN(a) && (o = "" + parseFloat(navigator.appVersion), a = parseInt(navigator.appVersion, 10))), a ? i + "_" + a : i
        }

        function o() {
            var e = "其它",
                t = e,
                n = navigator.userAgent,
                r = navigator.appVersion,
                i = [{
                    s: "Windows 10",
                    r: /(Windows 10.0|Windows NT 10.0)/
                }, {
                    s: "Windows 8.1",
                    r: /(Windows 8.1|Windows NT 6.3)/
                }, {
                    s: "Windows 8",
                    r: /(Windows 8|Windows NT 6.2)/
                }, {
                    s: "Windows 7",
                    r: /(Windows 7|Windows NT 6.1)/
                }, {
                    s: "Windows Vista",
                    r: /Windows NT 6.0/
                }, {
                    s: "Windows Server 2003",
                    r: /Windows NT 5.2/
                }, {
                    s: "Windows XP",
                    r: /(Windows NT 5.1|Windows XP)/
                }, {
                    s: "Windows 2000",
                    r: /(Windows NT 5.0|Windows 2000)/
                }, {
                    s: "Windows ME",
                    r: /(Win 9x 4.90|Windows ME)/
                }, {
                    s: "Windows 98",
                    r: /(Windows 98|Win98)/
                }, {
                    s: "Windows 95",
                    r: /(Windows 95|Win95|Windows_95)/
                }, {
                    s: "Windows NT 4.0",
                    r: /(Windows NT 4.0|WinNT4.0|WinNT|Windows NT)/
                }, {
                    s: "Windows CE",
                    r: /Windows CE/
                }, {
                    s: "Windows 3.11",
                    r: /Win16/
                }, {
                    s: "Android",
                    r: /Android/
                }, {
                    s: "Open BSD",
                    r: /OpenBSD/
                }, {
                    s: "Sun OS",
                    r: /SunOS/
                }, {
                    s: "Linux",
                    r: /(Linux|X11)/
                }, {
                    s: "iOS",
                    r: /(iPhone|iPad|iPod)/
                }, {
                    s: "Mac OS X",
                    r: /Mac OS X/
                }, {
                    s: "Mac OS",
                    r: /(MacPPC|MacIntel|Mac_PowerPC|Macintosh)/
                }, {
                    s: "QNX",
                    r: /QNX/
                }, {
                    s: "UNIX",
                    r: /UNIX/
                }, {
                    s: "BeOS",
                    r: /BeOS/
                }, {
                    s: "OS/2",
                    r: /OS\/2/
                }, {
                    s: "Search Bot",
                    r: /(nuhk|Googlebot|Yammybot|Openbot|Slurp|MSNBot|Ask Jeeves\/Teoma|ia_archiver)/
                }];
            for (var o in i) {
                var a = i[o];
                if (a.r.test(n)) {
                    t = a.s;
                    break
                }
            }
            var s = e;
            switch (/Windows/.test(t) && (s = /Windows (.*)/.exec(t)[1], t = "Windows"), t) {
            case "Mac OS X":
                s = "";
                break;
            case "Android":
                var d = (/Android ([\.\_\d]+)/.exec(n)[1] || "").split(".").slice(0, 2);
                s = d.join(".");
                break;
            case "iOS":
                s = /OS (\d+)_(\d+)_?(\d+)?/.exec(r), s = s[1] + "." + s[2]
            }
            return t === e ? t : t + s
        }

        function a() {
            var e = "";
            return screen.width && (width = screen.width ? screen.width : "", height = screen.height ? screen.height : "", e += "" + width + "x" + height), e
        }

        function s() {
            var e = (window.devicePixelRatio ? window.devicePixelRatio : 1) - 0;
            return e.toFixed(1)
        }

        function d() {
            return window.navigator.userAgent
        }

        function u() {
            var e = d();
            return e.indexOf("Crosswalk") > -1
        }
        n(2), window;
        e.exports = {
            getPlatform: r,
            getScreen: a,
            getOs: o,
            getBrowser: i,
            getUa: d,
            getDevicePixelRatio: s,
            getAll: function () {
                return {
                    platform: r(),
                    screen: a(),
                    os: o(),
                    browser: i(),
                    devicePixelRatio: s(),
                    isXwalk: u()
                }
            }
        }
    },
    function (e, t) {
        var n = 0;
        e.exports = {
            formatData: function (e) {
                return ("" + e).replace(/\./gim, "_")
            }, formatUrl: function (e) {
                return "string" == typeof e && (e = e.split("?")[0].split("https://").join("").split("http://").join(""), "/" === e.charAt(e.length - 1) && (e = e.substr(0, e.length - 1))), e
            }, getIEVersion: function () {
                var e = -1;
                if ("Microsoft Internet Explorer" == navigator.appName) {
                    var t = navigator.userAgent,
                        n = new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");
                    null != n.exec(t) && (e = parseFloat(RegExp.$1))
                } else if ("Netscape" == navigator.appName) {
                    var t = navigator.userAgent,
                        n = new RegExp("Trident/.*rv:([0-9]{1,}[.0-9]{0,})");
                    null != n.exec(t) && (e = parseFloat(RegExp.$1))
                }
                return e
            }, getUniqId: function () {
                return "_traceId_" + n++
            }, post: function (e, t) {
                t = t || {};
                var n, r = this.getUniqId();
                try {
                    n = document.createElement('<iframe name="' + r + '">')
                } catch (i) {
                    n = document.createElement("iframe"), n.setAttribute("name", r)
                }
                try {
                    n.style.display = "none";
                    var o = document.createElement("form");
                    o.setAttribute("method", "POST"), o.setAttribute("action", e), o.setAttribute("target", r);
                    for (var a in t)
                        if (t.hasOwnProperty(a)) {
                            var s = document.createElement("input");
                            s.setAttribute("type", "hidden"), s.setAttribute("name", a), s.setAttribute("value", t[a]), o.appendChild(s)
                        }
                    document.body.appendChild(o), document.body.appendChild(n), this.addEventListener(n, "load", function () {
                        try {
                            document.body.removeChild(o), document.body.removeChild(n)
                        } catch (e) {}
                    }), o.submit()
                } catch (i) {}
            }, waitFor$: function (e) {
                return window.$ ? void e() : void setTimeout(function () {
                    this.waitFor$(e)
                }, 50)
            }, addEventListener: function (e, t, n) {
                e.addEventListener ? e.addEventListener(t, n, !1) : e.attachEvent && e.attachEvent("on" + t, n)
            }, extend: function () {
                for (var e = arguments, t = arguments[0], n = 1; n < e.length; n++) {
                    var r = e[n];
                    for (var i in r) r.hasOwnProperty(i) && (t[i] = r[i])
                }
                return t
            }, trim: function (e) {
                var t = new RegExp("(^[\\s\\t\\xa0\\u3000]+)|([\\u3000\\xa0\\s\\t]+$)", "g");
                return String(e).replace(t, "")
            }, getMsExactMin: function () {
                var e = (new Date).getTime();
                return e - e % 6e4
            }, stringify: function (e) {
                var t = typeof e;
                if ("object" != t || null === e) return "string" == t && (e = '"' + e + '"'), String(e);
                var n, r, i = [],
                    o = e && e.constructor == Array;
                for (n in e) r = e[n], t = typeof r, e.hasOwnProperty(n) && ("string" == t ? r = '"' + r + '"' : "object" == t && null !== r && (r = jQuery.stringify(r)), i.push((o ? "" : '"' + n + '":') + String(r)));
                return (o ? "[" : "{") + String(i) + (o ? "]" : "}")
            }
        }
    },
    function (e, t, n) {
        function r() {
            return window.performance && window.performance.timing ? s.responseEnd - s.requestStart : a.BLANK_VALUE
        }

        function i() {
            if (!s) return {};
            for (var e = {
                dns: s.domainLookupEnd - s.domainLookupStart,
                tcp: s.connectEnd - s.connectStart,
                request: s.responseStart - s.requestStart,
                response: s.responseEnd - s.responseStart,
                domContentLoad: s.domContentLoadedEventEnd - s.domContentLoadedEventStart,
                blankTime: (window.__trace__headendt || 0) - s.domainLookupStart,
                readyTime: s.domInteractive - s.domainLookupStart,
                onloadTime: s.domComplete - s.domainLookupStart,
                os: o.getOs(),
                browser: o.getBrowser()
            }, t = ["dns", "tcp", "request", "response", "domContentLoad", "loadEvent", "blankTime", "readyTime", "onloadTime"], n = 0; n < t.length; n++)
                if (e[t[n]] < 0) return {};
            return e
        }
        var o = n(1),
            a = n(4),
            s = window.performance && window.performance.timing ? window.performance.timing : null;
        e.exports = {
            getOnload: i,
            getResponseTime: r
        }
    },
    function (e, t) {
        e.exports = {
            URL: "http://log.juangua.com/mlogs.php",
            APPID: 30,
            BLANK_VALUE: "",
            LOCALSTORAGE_KEY: "__trace__queue",
            LOCALSTORAGE_MAXLENGTH: 3,
            COOL_DOWN: 5e3,
            eventidMap: {
                h5Performance: 50003,
                pcPerformance: 50004,
                jserror: 50005
            },
            abbreviation: {}
        }
    },
    function (e, t, n) {
        function r(e, t, n, r) {
            for (var i = !0, o = 0; o < d.length; o++) {
                var a = d[o] || {};
                if (a.msg === e && a.file === t && a.line === n && a["char"] === r) {
                    i = !1;
                    break
                }
            }
            return i
        }
        var i = (document, n(4), n(6)),
            o = n(8),
            a = n(1),
            s = n(2),
            d = [];
        e.exports = {
            init: function () {
                window.onerror = function (e, t, n, u) {
                    r(e, t, n, u) && (d.push({
                        msg: e,
                        file: t,
                        line: n,
                        "char": u
                    }), i.send(o.constructTraceData({
                        type: "e",
                        extra: s.extend({
                            msg: e,
                            file: t,
                            line: n,
                            "char": u
                        }, a.getAll())
                    })))
                }
            }
        }
    },
    function (e, t, n) {
        function r(e) {
            var t, n = {
                v: 3
            };
            return t = "n" === e[0].type || "s" === e[0].type ? "network" : "data", n[t] = i(e), n
        }

        function i(e) {
            e = e || [];
            for (var t = "	", n = "\n", r = [], i = 0; i < e.length; i++) {
                var o = e[i] || {};
                if (o = o || {}, o.extra) {
                    o.extra.performanceEvent && delete o.extra.performanceEvent;
                    var a = window.JSON ? JSON.stringify : u.stringify;
                    o.extra = a(o.extra)
                }
                var s = [];
                "n" === o.type || "s" === o.type ? s = ["appid", "type", "did", "startTime", "url", "responseCode", "responseTime", "time", "fixTime", "requestSize", "responseSize", "bizCode", "extra"] : "e" === o.type && (s = ["appid", "type", "did", "startTime", "uid", "referrer", "url", "time", "fixTime", "extra"]);
                for (var d = [], c = 0; c < s.length; c++) d.push(o[s[c]]);
                r.push(d.join(t))
            }
            return r.join(n)
        }

        function o(e) {
            return "e" === e.type && e.extra.performanceEvent
        }

        function a(e) {
            var t = (new Date).getTime();
            t - p > c.COOL_DOWN && (u.post(c.URL, e), p = t)
        }

        function s() {
            setTimeout(function () {
                d.isReadyPost() && a(r(d.shift())), s()
            }, c.COOL_DOWN)
        }
        var d = n(7),
            u = n(2),
            c = n(4),
            p = 0;
        e.exports = {
            send: function (e) {
                if (e = e || {}, e.extra = e.extra || {}, "n" !== e.type && !o(e)) return void u.post(c.URL, r([e]));
                var t = d.push(e);
                t || u.post(c.URL, r([e])), "n" !== e.type && d.isReadyPost() && a(r(d.shift()))
            }, sendImmediately: function (e) {
                e = e || {}, e.extra = e.extra || {}, u.post(c.URL, r([e]))
            }, init: function () {
                s()
            }
        }
    },
    function (e, t, n) {
        function r() {
            return {
                event: [],
                network: []
            }
        }
        var i = {
                e: "event",
                n: "network",
                s: "network"
            },
            o = n(4),
            a = n(2);
        e.exports = {
            support: !(!window.localStorage || !window.JSON || "function" != typeof localStorage.getItem || "function" != typeof localStorage.setItem || 11 == a.getIEVersion()),
            init: function () {
                this.support && this.getStorage()
            }, push: function (e) {
                if (!this.support) return !1;
                var t = this.getStorage() || r(),
                    n = i[e.type];
                return n ? (t[n].push(e), this.setStorage(t), t) : !1
            }, shift: function (e) {
                if (!this.support) return !1;
                e = e || o.LOCALSTORAGE_MAXLENGTH;
                var t, n = this.getStorage();
                if (n.event.length >= e) t = "event";
                else {
                    if (!(n.network.length >= e)) return !1;
                    t = "network"
                }
                var r = n[t].slice(0, e);
                return n[t] = n[t].slice(e), this.setStorage(n), r
            }, isReadyPost: function () {
                if (!this.support) return !1;
                var e = this.getStorage();
                return e.event.length > o.LOCALSTORAGE_MAXLENGTH || e.network.length > o.LOCALSTORAGE_MAXLENGTH
            }, getStorage: function () {
                try {
                    var e = JSON.parse(localStorage.getItem(o.LOCALSTORAGE_KEY))
                } catch (t) {
                    e = r(), this.setStorage(e)
                }
                return e || (e = r(), this.setStorage(e)), e
            }, setStorage: function (e) {
                try {
                    localStorage.setItem(o.LOCALSTORAGE_KEY, JSON.stringify(e))
                } catch (t) {
                    return !1
                }
            }
        }
    },
    function (e, t, n) {
        var r = n(4),
            i = n(9),
            o = n(2);
        e.exports = {
            constructTraceData: function (e) {
                e = e || {}, e.extra = e.extra || {}, e.extra.pageUrl = o.formatUrl(location.href);
                var t = Math.ceil(o.getMsExactMin() / 1e3);
                return e = o.extend({
                    appid: i.getAppid(),
                    did: i.getDid(),
                    startTime: t,
                    uid: i.getUid(),
                    referrer: document.referrer,
                    url: o.formatUrl(location.href),
                    time: t,
                    fixTime: t
                }, e)
            }, constructNetworkData: function (e) {
                e = e || {}, e.extra = e.extra || {}, e.extra.pageUrl = o.formatUrl(location.href);
                var t = Math.ceil(o.getMsExactMin() / 1e3);
                return e = o.extend({
                    appid: i.getAppid(),
                    did: i.getDid(),
                    startTime: t,
                    time: t,
                    fixTime: r.BLANK_VALUE,
                    requestSize: t
                }, e)
            }
        }
    },
    function (e, t, n) {
        var r = n(4),
            i = n(2);
        e.exports = {
            getUid: function () {
                var e = this._getCookie() || {};
                return e.__ud || r.BLANK_VALUE
            }, getDid: function () {
                var e = this._getCookie() || {};
                return e.__mgjuuid || r.BLANK_VALUE
            }, getAppid: function () {
                return r.APPID
            }, _getCookie: function () {
                for (var e = document.cookie || "", t = e.split(";"), n = {}, r = 0; r < t.length; r++) {
                    var o = i.trim(t[r] || ""),
                        a = o.split("=");
                    n[a[0]] = a[1]
                }
                return n
            }
        }
    },
    function (e, t, n) {
        var r = n(2),
            i = n(6),
            o = n(8),
            a = n(4);
        e.exports = {
            init: function () {
                var e = $.ajax;
                $.ajax = function () {
                    var t = (new Date).getTime(),
                        n = e.apply(this, arguments);
                    try {
                        var s, d = !1;
                        "string" == typeof arguments[0] ? (s = r.formatUrl(arguments[0]), arguments[1] && "[object Object]" === Object.prototype.toString.call(arguments[1]) && "jsonp" === arguments[1].dataType && (d = !0)) : "object" == typeof arguments[0] && (s = r.formatUrl(arguments[0].url || ""), "jsonp" === arguments[0].dataType && (d = !0)), n.always(function (e) {
                            if (!d) {
                                var r = n.getAllResponseHeaders() || "",
                                    u = /content\-length\:\s(\d*)/m,
                                    c = 0,
                                    p = u.exec(r);
                                p && p[1] && (c = $.trim(p[1]) || "");
                                var f;
                                "[object Object]" === Object.prototype.toString.call(e) && e.status && (f = e.status.code), i.send(o.constructNetworkData({
                                    type: "n",
                                    url: s,
                                    responseCode: n.status,
                                    responseSize: c,
                                    responseTime: (new Date).getTime() - t,
                                    bizCode: f || a.BLANK_VALUE,
                                    extra: {
                                        isAjax: 1
                                    }
                                }))
                            }
                        })
                    } catch (u) {}
                    return n
                }
            }
        }
    }
]);
! function (t, e) {
    "object" == typeof exports && "object" == typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define("mls-pc/common/header/index", [], e) : "object" == typeof exports ? exports["mls-pc/common/header/index"] = e() : t["mls-pc/common/header/index"] = e()
}(this, function () {
    return function (t) {
        function e(i) {
            if (n[i]) return n[i].exports;
            var o = n[i] = {
                exports: {},
                id: i,
                loaded: !1
            };
            return t[i].call(o.exports, o, o.exports, e), o.loaded = !0, o.exports
        }
        var n = {};
        return e.m = t, e.c = n, e.p = "", e(0)
    }([
        function (t, e, n) {
            "use strict";
            n(1)
        },
        function (t, e, n) {
            var i, o;
            i = [], o = function () {
                function t(t, e) {
                    this.init(t, e)
                }

                function e() {
                    function t(t) {
                        return $.trim(t).replace(/(<|>|'|"|window|alert|eval|$|jQuery)/gi, "")
                    }
                    s.on("mouseenter", ".search_tip li", function (t) {
                        var e = $(this),
                            n = e.index();
                        d.chooseIndex = n, m.changeListTab(n)
                    }).on("click", ".search_tip li", function (t) {
                        var n = $(this).find(".title").text();
                        $(t.target).hasClass("prop") && (n += " " + $(t.target).text()), e.submitBefore(d.chooseType, d.chooseIndex), a.val(n), r.submit()
                    }), s.on("click", ".hot_list li", function () {
                        var t = $(this);
                        return e.submitBefore(m.hotTypeName, t.index()), a.val(t.find("span").html()), r.submit(), !1
                    }), s.on("click", ".local_del", function (t) {
                        var e = $(this),
                            n = e.parent();
                        u.del(n.find(".title").attr("title"));
                        var i = u.getTenItem();
                        return m.updateLocalContent(e, i), d.chooseIndex = -1, d.tipLength = i.length, !1
                    }).on("click", ".local_title .del_all", function () {
                        var t = $(this);
                        return u.set(), m.destoryLocalContent(t), t.remove(), d.chooseIndex = -1, d.tipLength = 0, !1
                    }), o.on("click", ".selectbox a", function (t) {
                        t.preventDefault(), m.changeType($(this))
                    }).on("mouseenter", ".selectbox", function () {
                        s.hide(), $(this).addClass("sele_hover")
                    }).on("mouseleave", ".selectbox", function () {
                        $(this).removeClass("sele_hover")
                    }), r.submit(function () {
                        var n = $(this),
                            i = t(a.val()),
                            o = a.attr("def-v");
                        if ("" == i || i == o) {
                            if ("" == i && "shop" == $("#select_type").val()) return !1;
                            var s = a.data("def");
                            a.val(s || "");
                            var l = '<input type="hidden" name="from" value="searchplacehold" id="TJ">';
                            $("#top_nav_form").append(l), setTimeout(function () {
                                $("#TJ").remove()
                            }, 1e3)
                        } else i == $.trim(a.val()) && "bao" == $("#select_type").val() && u.addOne(i); if (r.find(".emptyvalue").remove(), n.data("index") > -1 && null !== n.data("type")) {
                            var c = '<input type="hidden" class="emptyvalue" name="from" value="' + n.data("type") + "querytip" + n.data("index") + '">';
                            r.append(c)
                        }
                        m.destoryContent(), e.submitAfter()
                    }), m.showStickySearch() && m.initStickySearch()
                }
                var n = MoGu.ui.getdoT(),
                    i = MoGu.util.getStore();
                if (n && i) {
                    var o = $("#nav_search_form");
                    if (o.length) {
                        var s = $(".top_search_hint"),
                            a = o.find(".ts_txt"),
                            r = $("#top_nav_form"),
                            l = $("#select_type"),
                            c = o.find(".selectbox"),
                            h = "/msearch/tips/item",
                            p = {
                                nowHost: window.location.host,
                                defultHost: "index.html",
                                template: '<div class="search_tip_box fl">{{=it.searchResult}}</div>',
                                listItemTemp: ['<div class="mr300 tip_wrap">', '{{ if(it.titleName && it.titleName != ""){ }}', '<h3 class="search_tip_title">{{=it.titleName}}</h3>', "{{ }else{ }}", "{{ } }}", '<ul class="search_tip">', "{{~it.items :item:index}}", "{{ if(index < 10){ }}", "<li>", '<a href="javascript:;" class="title" title="{{= item.title }}" >{{= item.title }}</a>', "{{~item.props :prop: i}}", '<span class="prop">{{= prop }}</span>', "{{~}}", "</li>", "{{ } }}", "{{~}}", "</ul>", "</div>"].join(""),
                                localItemTemp: ['<div class="mr300 tip_wrap">', '<h3 class="search_tip_title local_title clearfix">', "{{ if(it.items.length){ }}", '<span class="del_all">删除</span>', "{{ } }}", "历史记录", "</h3>", '<ul class="search_tip">', "{{~it.items :item:index}}", "{{ if(index < 10){ }}", '<li class="local_item">', '<a href="javascript:;" class="title" title="{{=item}}" >{{=item}}</a>', "{{~item.props :prop: i}}", '<span class="prop">{{= prop }}</span>', "{{~}}", '<span class="nums local_del">x</span>', "</li>", "{{ } }}", "{{~}}", "</ul>", "</div>"].join(""),
                                hotKeyTpl: ['<div class="search_hot_wrap">', '<h3 class="search_tip_title hot_title">热门关键词</h3>', '<ul class="hot_list clearfix">', "{{~it.items :item:index}}", "{{ if(index < 10){ }}", "<li><span>{{= item.title }}</span></li>", "{{ } }}", "{{~}}", "</ul>", "</div>"].join(""),
                                emptyTpl: ['<div class="mr300 tip_wrap">', '<p class="tip_none">暂无相关热门关键词</p>', "</div>"].join("")
                            },
                            u = {
                                keyName: "_search_local_history",
                                keyShowName: "_search_local_history_show",
                                maxLength: 20,
                                showLength: 10,
                                isshow: function () {
                                    return !0
                                }, abtest: function (t) {
                                    i.set(this.keyShowName, 1)
                                }, get: function () {
                                    return i.get(this.keyName) || []
                                }, getTenItem: function () {
                                    var t = this.get();
                                    return t.slice(0, this.showLength)
                                }, set: function (t) {
                                    i.set(this.keyName, t || [])
                                }, addOne: function (t) {
                                    if (t = $.trim(t), "" != t) {
                                        var e = this.get(),
                                            n = $.inArray(t, e); - 1 == n ? (e.unshift(t), e.length > this.maxLength && e.pop()) : (e.splice(n, 1), e.unshift(t)), this.set(e)
                                    }
                                }, del: function (t) {
                                    t = $.trim(t);
                                    var e = this.get(),
                                        n = $.inArray(t, e);
                                    n > -1 && (e.splice(n, 1), this.set(e))
                                }
                            };
                        t.prototype.init = function (t, e) {
                            this.chooseIndex = -1, this.chooseType = t, this.tipLength = e || 0
                        };
                        var d = new t("undefined"),
                            m = {
                                ajaxRequest: null,
                                hotKeyArr: [],
                                isShopHost: function () {
                                    return !1
                                }, showStickySearch: function () {
                                    var t = location.pathname,
                                        e = $(".mgj_primary"),
                                        n = e.length > 0 ? e.offset().top + e.height() : 10;
                                    return "www.meilishuo.com" === location.host && ("/" === t || "/more" === t) || t.indexOf("/book/search/") > -1 || /webdemo || localhost/.test(location.host) && /sticky/.test(location.search) ? (t.indexOf("/book/search/") > -1 && (e = $(".search_filter_wrap"), n = e.length ? e.offset().top : 150), this.stickyTargetTop = n, !0) : !1
                                }, resetFactory: function (t) {
                                    this.isShopHost() ? this.resetShopContent(t) : u.isshow() ? this.resetListContent(t) : this.resetOldContent(t)
                                }, resetListContent: function (e) {
                                    function i(t) {
                                        o(function () {
                                            a()
                                        })
                                    }

                                    function o(n) {
                                        r.ajaxRequest && r.ajaxRequest.abort();
                                        var i = u.getTenItem();
                                        return "" == $.trim(e) ? (l.push(r.renderLocalContent(i)), void($.isFunction(n) && n())) : void(r.ajaxRequest = $.post(h, {
                                            input: e
                                        }, function (e) {
                                            if (e && 1001 == e.status.code) {
                                                var i = e.result.tipCount;
                                                0 == i ? l.push(r.renderEmptyContent()) : (l.push(r.renderSearchContent(e.result.tips, e.result.nums, e.result.props)), d = new t(r.searchTypeName, i))
                                            }
                                            $.isFunction(n) && n()
                                        }, "json"))
                                    }

                                    function a() {
                                        var t = n.template(p.template)({
                                            searchResult: l.join("")
                                        });
                                        s.html(t), r.showContentBox()
                                    }
                                    var r = this,
                                        l = [];
                                    r.hotKeyArr.length ? i(r.hotKeyArr) : $.post(h, {}, function (t) {
                                        r.hotKeyArr = t.result.tips, i(r.hotKeyArr)
                                    }, "json")
                                }, resetShopContent: function (e) {
                                    function i(n) {
                                        a.ajaxRequest && a.ajaxRequest.abort(), a.ajaxRequest = $.post(h, {
                                            input: e
                                        }, function (e) {
                                            if (e && 1001 == e.status.code) {
                                                var i = e.result.tipCount;
                                                0 == i ? r.push(a.renderEmptyContent()) : (r.push(a.renderSearchContent(e.result.tips, e.result.nums, e.result.props, l)), d = new t(c, i))
                                            }
                                            $.isFunction(n) && n()
                                        }, "json")
                                    }

                                    function o() {
                                        var t = n.template(p.template)({
                                            searchResult: r.join("")
                                        });
                                        s.html(t), a.showContentBox()
                                    }
                                    var a = this,
                                        r = [],
                                        l = "",
                                        c = "" != e ? a.searchTypeName : a.hotTypeName;
                                    i(function () {
                                        o()
                                    })
                                }, resetOldContent: function (e) {
                                    function i(n) {
                                        a.ajaxRequest && a.ajaxRequest.abort(), a.ajaxRequest = $.post(h, {
                                            input: e
                                        }, function (e) {
                                            if (e && 1001 == e.status.code) {
                                                var i = e.result.tipCount;
                                                0 == i ? r.push(a.renderEmptyContent()) : (r.push(a.renderSearchContent(e.result.tips, e.result.nums, l)), d = new t(c, i))
                                            }
                                            $.isFunction(n) && n()
                                        }, "json")
                                    }

                                    function o() {
                                        var t = n.template(p.template)({
                                            searchResult: r.join("")
                                        });
                                        s.html(t), s.find(".tip_wrap").removeClass("mr300").addClass("mr300_fix"), a.showContentBox()
                                    }
                                    var a = this,
                                        r = [],
                                        l = "" != e ? "搜索结果" : "热门关键词",
                                        c = "" != e ? a.searchTypeName : a.hotTypeName;
                                    i(function () {
                                        o()
                                    })
                                }, searchTypeName: "",
                                renderSearchContent: function (t, e, i, o) {
                                    for (var s = [], a = 0; a < t.length; a++) s.push({
                                        title: t[a],
                                        props: i[a],
                                        num: e[a]
                                    });
                                    return n.template(p.listItemTemp)({
                                        titleName: o || null,
                                        items: s
                                    })
                                }, localTypeName: "local",
                                renderLocalContent: function (t) {
                                    return n.template(p.localItemTemp)({
                                        items: t
                                    })
                                }, updateLocalContent: function (t, e) {
                                    var n = t.parent(),
                                        i = t.parents(".search_tip");
                                    if (n.length && i.length)
                                        if (e.length < u.showLength) n.remove();
                                        else {
                                            var o = e[u.showLength - 1];
                                            n.find(".title").attr("title", o).html(o), n.appendTo(i)
                                        }
                                }, destoryLocalContent: function (t) {
                                    var e = t.parents(".tip_wrap").find(".search_tip");
                                    e.length && e.empty()
                                }, hotTypeName: "default",
                                renderHotContent: function (t) {
                                    for (var e = [], i = 0; i < t.length; i++) e.push({
                                        title: t[i]
                                    });
                                    return n.template(p.hotKeyTpl)({
                                        items: e
                                    })
                                }, renderEmptyContent: function () {
                                    return p.emptyTpl
                                }, destoryContent: function () {
                                    s.empty().hide()
                                }, getContentPosition: function (t, e) {
                                    var n = e.offset(),
                                        i = t.data("fixleft"),
                                        o = t.data("fixtop");
                                    i && (n.left += parseInt(i)), o && (n.top -= parseInt(o));
                                    var s = e.width() - 34;
                                    t.css({
                                        left: n.left,
                                        top: n.top + e.height() + 2,
                                        width: s
                                    }).addClass("hasposition")
                                }, showContentBox: function () {
                                    s.show().data("isshow", !0)
                                }, changeListTab: function (t) {
                                    var e = s.find(".search_tip li"),
                                        n = e.eq(t);
                                    return e.removeClass("checked"), n.addClass("checked"), n.find(".title").text()
                                }, changeType: function (t) {
                                    var e = t.parent(),
                                        n = e.attr("data-index"),
                                        i = t.text();
                                    if (l.val(n), c.find(".selected").text("搜" + i), e.siblings("li").removeClass("current"), e.addClass("current"), "shop" == n) a.val() == a.attr("def-v") && a.val("");
                                    else if ("" == a.val()) {
                                        var o = a.attr("def-v");
                                        a.val(o)
                                    }
                                    4 == n ? "item.meilishuo.com" === p.nowHost ? r.attr("action", "http://www.meilishuo.com/group/search/") : r.attr("action", "http://www.meilishuo.com/group/search/") : "item.meilishuo.com" === p.nowHost ? r.attr("action", "http://www.meilishuo.com/search/") : r.attr("action", "http://www.meilishuo.com/search/"), c.removeClass("sele_hover")
                                }, initStickySearch: function () {
                                    var t = $("#nav_search_form"),
                                        e = ['<div id="J_sticky_container" class="sticky-search-container">', '<div class="wrap">', '<a rel="nofollow" href="index.html" class="logo" title="美丽说">美丽说</a>', '<div class="sticky-search-content"></div>', "</div>", "</div>"].join("");
                                    $("body").append(e);
                                    var n = $(".sticky-search-container");
                                    $(window).off("scroll.sticky").on("scroll.sticky", function () {
                                        $(document).scrollTop() > m.stickyTargetTop ? n.hasClass("lets-rock") || n.find(".sticky-search-content").append(t).end().addClass("lets-rock") : n.hasClass("lets-rock") && ($(".normal-search-content").append($("#nav_search_form")), n.find(".sticky-search-content").empty().end().removeClass("lets-rock"))
                                    })
                                }
                            };
                        e.submitBefore = function (t, e) {
                            r.data({
                                type: t,
                                index: e
                            })
                        }, e.submitAfter = function () {
                            r.removeData("type index"), d.chooseType = "undefined", d.chooseIndex = -1
                        };
                        var f = function () {
                            MoGu.util.inputTextHide(a, "ts_high"), e()
                        };
                        f()
                    }
                }
            }.apply(e, i), !(void 0 !== o && (t.exports = o))
        }
    ])
}), "function" == typeof define && define.amd && require(["mls-pc/common/header/index"]);
! function (e) {
    MGLightBox = function (t) {
        var i = this,
            l = {
                title: "",
                titleLink: "",
                titleLinkText: "",
                lightBoxId: "",
                ajax: !1,
                contentHtml: "",
                scroll: !1,
                isBgClickClose: !0,
                resizeshow: !0,
                closeCallBack: function () {}
            },
            n = null,
            o = '<div id="{id}" class="light_box"><iframe frameborder="0" scrolling="no" class="lb_fix"></iframe>{content}</div>',
            s = '<table class="lb_wrap clearfix r5"><tbody><tr><td><div class="lb_hd">{title}{title_link}<a href="javascript:;" class="lb_close">×</a></div><div class="lb_bd">{body}</div></td></tr></tbody></table>',
            c = '<div class="light_box_fullbg"></div>',
            a = '<table class="lb_info r5"><tbody><tr><td><div class="lb_l">{text}......（<a class="lb_cs" href="javascript:;">取消</a>）</div></td></tr></tbody></table>',
            r = '<table class="lb_info r5"><tbody><tr><td><div class="lb_s">{text}</div></td></tr></tbody></table>',
            d = '<table class="lb_info r5"><tbody><tr><td><div class="lb_f">{text}</div></td></tr></tbody></table>',
            b = e.extend(l, t),
            f = null,
            u = null,
            h = null,
            g = !1,
            _ = function () {
                var e = (document.documentElement.scrollTop || document.body.scrollTop) + ((document.documentElement.clientHeight || document.body.clientHeight) - f.height()) / 2,
                    t = window.location.toString();
                return 0 > e ? e = 0 : t.indexOf("is_qzone") > 0 && (e /= 6), e
            };
        i.getBoxFrame = function () {
            return f
        }, i.getFrameId = function () {
            return b.lightBoxId
        }, i.getBackground = function () {
            return h
        }, i.close = function () {
            n && n.abort(), f.hide(), b.closeCallBack(), f.remove(), 0 == e(".light_box").size() && h.remove(), e("body").unbind("keydown")
        }, i.hide = function () {
            f.hide(), h.hide(), e("body").unbind("keydown")
        }, i.show = function () {
            f.show(), h.show()
        }, i.resize = function () {
            var t = e(window).width(),
                i = (t - f.width()) / 2,
                l = _();
            if (u.css({
                width: f.width(),
                height: f.height()
            }), e.browser.msie && "6.0" == e.browser.version && h.css("height", document.documentElement.clientHeight || document.body.clientHeight), b.scroll)
                if (e.browser.msie && "6.0" == e.browser.version) f.css({
                    left: i,
                    top: l
                }).show(), g || e(window).scroll(function () {
                    var e = _();
                    f.css("top", e)
                });
                else {
                    l = ((document.documentElement.clientHeight || document.body.clientHeight) - f.height()) / 2;
                    var n = window.location.toString();
                    0 > l ? l = 0 : n.indexOf("is_qzone") > 0 && (l /= 6), f.css({
                        left: i,
                        top: l,
                        position: "fixed"
                    }).show()
                } else f.css({
                left: i,
                top: l
            }).show()
        }, i.init = function () {
            if ("" != b.lightBoxId) {
                var t = o.replace(/{id}/g, b.lightBoxId).replace(/{content}/, s);
                b.title && "" != b.title && (t = t.replace(/{title}/g, '<span class="lb_title">' + b.title + "</span>")), t = "" != b.titleLinkText ? t.replace(/{title_link}/g, '<span class="lb_lnk">（<a href="' + b.titleLink + '" target="_blank">' + b.titleLinkText + "</a>）</span>") : t.replace(/{title_link}/g, ""), t = b.ajax ? t.replace(/{body}/g, "") : t.replace(/{body}/g, b.contentHtml);
                var l = e(".light_box_fullbg");
                0 == l.size() ? e("body").append(t + c) : (e("body").append(t), l.eq(0).show()), f = e("#" + b.lightBoxId), u = e(".lb_fix"), h = e(".light_box_fullbg"), b.ajax ? i.loading() : (i.resize(), b.resizeshow && e(window).resize(function () {
                    f.filter(":visible").length <= 0 || i.resize()
                }), f.find(".lb_close").click(function () {
                    i.close()
                })), b.isBgClickClose && e(".light_box_fullbg").click(function () {
                    i.close()
                })
            }
        }, i.fadeout = function () {
            n && n.abort(), f.fadeOut(500), h.fadeOut(500, function () {
                i.close()
            })
        }, i.startAjax = function (e) {
            n = e
        }, i.buildContent = function (t) {
            if (0 == f.find(".lb_wrap").size()) {
                var l = s.replace(/{body}/, t);
                b.title && "" != b.title && (l = l.replace(/{title}/g, '<span class="lb_title">' + b.title + "</span>")), l = "" != b.titleLinkText ? l.replace(/{title_link}/g, '<span class="lb_lnk">（<a href="' + b.titleLink + '" target="_blank">' + b.titleLinkText + "</a>）</span>") : l.replace(/{title_link}/g, ""), f.find(".lb_info").after(l).remove(), e("#" + b.lightBoxId + " .lb_close").click(function () {
                    i.close()
                })
            } else f.find(".lb_bd").html(t);
            i.resize()
        }, i.success = function (e) {
            var t = r.replace(/{text}/, e);
            f.find(".lb_wrap").after(t).remove(), i.resize(), setTimeout(function () {
                i.fadeout()
            }, 1e3)
        }, i.success_close = function (e, t) {
            var l = r.replace(/{text}/, e);
            f.find(".lb_wrap").after(l).remove(), i.resize();
            var t = t || 1e3;
            setTimeout(function () {
                i.close()
            }, t)
        }, i.fail = function (e, t) {
            var l = d.replace(/{text}/, e);
            f.find(".lb_wrap").after(l).remove(), i.resize();
            var t = t || 2e3;
            setTimeout(function () {
                i.close()
            }, t)
        }, i.loading = function (e) {
            e = e || "请稍后";
            var t = a.replace(/{text}/, e);
            f.find(".lb_wrap").after(t).remove(), i.resize(), f.find(".lb_l .lb_cs").click(function () {
                i.close()
            }), i.resize()
        }
    }
}(jQuery);
! function (t, e) {
    "object" == typeof exports && "object" == typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define("mls-pc/common/login/index", [], e) : "object" == typeof exports ? exports["mls-pc/common/login/index"] = e() : t["mls-pc/common/login/index"] = e()
}(this, function () {
    return function (t) {
        function e(n) {
            if (i[n]) return i[n].exports;
            var r = i[n] = {
                exports: {},
                id: n,
                loaded: !1
            };
            return t[n].call(r.exports, r, r.exports, e), r.loaded = !0, r.exports
        }
        var i = {};
        return e.m = t, e.c = i, e.p = "", e(0)
    }([
        function (t, e, i) {
            "use strict";
            var n = i(1),
                r = i(2),
                s = i(3),
                o = i(4),
                a = i(10),
                h = {},
                c = "lb_login",
                u = {
                    init: function () {
                        $(".light_box").remove(), this.newLightbox()
                    }, newLightbox: function () {
                        var t = {
                            title: "登录美丽说",
                            lightBoxId: c,
                            contentHtml: a,
                            scroll: !0
                        };
                        h = new n(t), h.init()
                    }
                },
                l = {
                    init: function (t, e) {
                        var i = this;
                        MOGU.Globe_Bind_Keybord_Submit("", $("#" + c + " .login_btn"), "not_need_focus"), r.CHECK.FixIe6Bug();
                        var n = $("#lb_login");
                        i.EventsOn(n, e), MOGU.Globe_Input_Text_Hide(n.find("input[type=text]"))
                    }, EventsOn: function (t, e) {
                        t.on("blur", '.lg_name input[name="uname"]', function () {
                            var e, i = $(this),
                                n = MGTOOL.trim(i.val());
                            return "" == n || n == i.attr("def-v") ? !1 : n == i.attr("data-lastname") ? !1 : (r.UI.hideError(t), e = t.find(".lg_form").hasClass("easy_buy") ? 2 : 1, void(1 == e && /^1\d{10,10}$/.test(n) ? r.UI.ajaxPost({
                                mobile: i.val()
                            }, s.CANLOGINBYCODE, function (s) {
                                1001 == s.status.code ? (i.val(i.attr("def-v")).css("color", "#ccc"), t.find(".eb_mod_box input[name=uname]").val(n).css("color", "#000"), r.UI.turnLoginMod(t, 2), t.find(".eb_mod_box input[name=uname]").trigger("blur")) : (r.CHECK.checkCodeIsShow(t, i, e), i.attr("data-lastname", i.val()))
                            }) : (r.CHECK.checkCodeIsShow(t, i, e), i.attr("data-lastname", i.val()))))
                        }).on("focus", ".lg_item input", function () {
                            r.UI.hideError(t)
                        }).on("click", ".imgcheck_image_div,#imgcheck_code_change", function () {
                            r.UI.hideError(t)
                        }).on("click", ".login_title a", function () {
                            var e, i = $(this);
                            return i.hasClass("tab_on") ? !1 : (r.UI.hideError(t), e = i.hasClass("lo_mod") ? 1 : 2, console.log(e), void r.UI.turnLoginMod(t, e))
                        }).on("click", "#get_tel_code", function () {
                            var e = $(this),
                                i = 60,
                                n = t.find(".eb_mod_box input[name='uname']").val();
                            if (!$("#get_tel_code:visible").length || e.hasClass("downing")) return !1;
                            if (!/^1\d{10,10}$/.test(n)) return r.UI.showError(t, "请输入正确的手机号码"), !1;
                            if ($(".imgcheck_code_img_div:visible").length && !o.isImgcodeCheck(t, r.UI.showError)) return !1;
                            e.addClass("downing").html("正在发送……");
                            var a = {
                                mobile: n,
                                captkey: $("#imgcheckcode").val(),
                                captcode: $("#imgcheckvalue").val()
                            };
                            r.UI.ajaxPost(a, s.LOGIN_GET_CODE, function (n) {
                                1001 === n.status.code ? (e.addClass("downing").html("重新发送(60)"), r.UI.countDownStart(e, i)) : (e.removeClass("downing").html("获取手机动态密码"), r.UI.showError(t, n.status.msg))
                            })
                        }).on("click", ".lg_login .sub", function (i) {
                            i.preventDefault();
                            var n;
                            n = t.find(".lg_form").hasClass("easy_buy") ? 2 : 1, e.Login_Light_Box = h, r.UI.submitNowForm(t, n, e, i)
                        }), $(".ui-ot-btn").click(function () {
                            var e = $(this),
                                i = {
                                    third: e.data("type"),
                                    platform: "pc",
                                    operScene: "login"
                                };
                            r.UI.ajaxPost(i, s.LOGIN_AUTHORIZE, function (e) {
                                1001 == e.status.code ? location.href = e.result.redirect_uri : r.UI.showError(t, e.status.msg)
                            })
                        })
                    }
                };
            MOGU.user_handsome_login_init = function () {
                u.init()
            }, MOGU.user_handsome_login = function (t, e) {
                l.init(t, e)
            }
        },
        function (t, e) {
            "use strict";
            ! function (e) {
                window.MGLightBox = function (t) {
                    var i = this,
                        n = {
                            title: "",
                            titleLink: "",
                            titleLinkText: "",
                            ajax: !1,
                            lightBoxId: "",
                            contentHtml: "",
                            scroll: !1,
                            isBgClickClose: !0,
                            resizeshow: !0,
                            closeCallBack: function () {}
                        },
                        r = null,
                        s = '<div id="{id}" class="light_box"><iframe frameborder="0" scrolling="no" class="lb_fix"></iframe>{content}</div>',
                        o = '<table class="lb_wrap clearfix r5"><tbody><tr><td><div class="lb_hd">{title}{title_link}<a href="javascript:;" class="lb_close">×</a></div><div class="lb_bd">{body}</div></td></tr></tbody></table>',
                        a = '<div class="light_box_fullbg"></div>',
                        h = '<table class="lb_info r5"><tbody><tr><td><div class="lb_l">{text}......（<a class="lb_cs" href="javascript:;">取消</a>）</div></td></tr></tbody></table>',
                        c = '<table class="lb_info r5"><tbody><tr><td><div class="lb_s">{text}</div></td></tr></tbody></table>',
                        u = '<table class="lb_info r5"><tbody><tr><td><div class="lb_f">{text}</div></td></tr></tbody></table>',
                        l = e.extend(n, t),
                        f = null,
                        p = null,
                        d = null,
                        g = !1,
                        m = function () {
                            var t = (document.documentElement.scrollTop || document.body.scrollTop) + ((document.documentElement.clientHeight || document.body.clientHeight) - f.height()) / 2,
                                e = window.location.toString();
                            return 0 > t ? t = 0 : e.indexOf("is_qzone") > 0 && (t /= 6), t
                        };
                    i.getBoxFrame = function () {
                        return f
                    }, i.getFrameId = function () {
                        return l.lightBoxId
                    }, i.getBackground = function () {
                        return d
                    }, i.close = function () {
                        r && r.abort(), f.hide(), l.closeCallBack(), f.remove(), 0 == e(".light_box").size() && d.remove(), e("body").unbind("keydown")
                    }, i.hide = function () {
                        f.hide(), d.hide(), e("body").unbind("keydown")
                    }, i.show = function () {
                        f.show(), d.show()
                    }, i.resize = function () {
                        var t = e(window).width(),
                            i = (t - f.width()) / 2,
                            n = m();
                        if (p.css({
                            width: f.width(),
                            height: f.height()
                        }), e.browser.msie && "6.0" == e.browser.version && d.css("height", document.documentElement.clientHeight || document.body.clientHeight), l.scroll)
                            if (e.browser.msie && "6.0" == e.browser.version) f.css({
                                left: i,
                                top: n
                            }).show(), g || e(window).scroll(function () {
                                var t = m();
                                f.css("top", t)
                            });
                            else {
                                n = ((document.documentElement.clientHeight || document.body.clientHeight) - f.height()) / 2;
                                var r = window.location.toString();
                                0 > n ? n = 0 : r.indexOf("is_qzone") > 0 && (n /= 6), f.css({
                                    left: i,
                                    top: n,
                                    position: "fixed"
                                }).show()
                            } else f.css({
                            left: i,
                            top: n
                        }).show()
                    }, i.init = function () {
                        if ("" != l.lightBoxId) {
                            var t = s.replace(/{id}/g, l.lightBoxId).replace(/{content}/, o);
                            l.title && "" != l.title && (t = t.replace(/{title}/g, '<span class="lb_title">' + l.title + "</span>")), t = "" != l.titleLinkText ? t.replace(/{title_link}/g, '<span class="lb_lnk">（<a href="' + l.titleLink + '" target="_blank">' + l.titleLinkText + "</a>）</span>") : t.replace(/{title_link}/g, ""), t = l.ajax ? t.replace(/{body}/g, "") : t.replace(/{body}/g, l.contentHtml);
                            var n = e(".light_box_fullbg");
                            0 == n.size() ? e("body").append(t + a) : (e("body").append(t), n.eq(0).show()), f = e("#" + l.lightBoxId), p = e(".lb_fix"), d = e(".light_box_fullbg"), l.ajax ? i.loading() : (i.resize(), l.resizeshow && e(window).resize(function () {
                                f.filter(":visible").length <= 0 || i.resize()
                            }), f.find(".lb_close").click(function () {
                                i.close()
                            })), l.isBgClickClose && e(".light_box_fullbg").click(function () {
                                i.close()
                            })
                        }
                    }, i.fadeout = function () {
                        r && r.abort(), f.fadeOut(500), d.fadeOut(500, function () {
                            i.close()
                        })
                    }, i.startAjax = function (t) {
                        r = t
                    }, i.buildContent = function (t) {
                        if (0 == f.find(".lb_wrap").size()) {
                            var n = o.replace(/{body}/, t);
                            l.title && "" != l.title && (n = n.replace(/{title}/g, '<span class="lb_title">' + l.title + "</span>")), n = "" != l.titleLinkText ? n.replace(/{title_link}/g, '<span class="lb_lnk">（<a href="' + l.titleLink + '" target="_blank">' + l.titleLinkText + "</a>）</span>") : n.replace(/{title_link}/g, ""), f.find(".lb_info").after(n).remove(), e("#" + l.lightBoxId + " .lb_close").click(function () {
                                i.close()
                            })
                        } else f.find(".lb_bd").html(t);
                        i.resize()
                    }, i.success = function (t) {
                        var e = c.replace(/{text}/, t);
                        f.find(".lb_wrap").after(e).remove(), i.resize(), setTimeout(function () {
                            i.fadeout()
                        }, 1e3)
                    }, i.success_close = function (t, e) {
                        var n = c.replace(/{text}/, t);
                        f.find(".lb_wrap").after(n).remove(), i.resize();
                        var e = e || 1e3;
                        setTimeout(function () {
                            i.close()
                        }, e)
                    }, i.fail = function (t, e) {
                        var n = u.replace(/{text}/, t);
                        f.find(".lb_wrap").after(n).remove(), i.resize();
                        var e = e || 2e3;
                        setTimeout(function () {
                            i.close()
                        }, e)
                    }, i.loading = function (t) {
                        t = t || "请稍后";
                        var e = h.replace(/{text}/, t);
                        f.find(".lb_wrap").after(e).remove(), i.resize(), f.find(".lb_l .lb_cs").click(function () {
                            i.close()
                        }), i.resize()
                    }
                }, t.exports = MGLightBox
            }(jQuery)
        },
        function (t, e, i) {
            "use strict";
            var n = i(3),
                r = i(4);
            i(7);
            var s = i(8);
            i(9);
            var o = new JSEncrypt,
                a = {
                    FixIe6Bug: function () {
                        $.browser.msie && "6.0" == $.browser.version && document.execCommand("BackgroundImageCache", !1, !0)
                    }, checkCodeIsShow: function (t, e, i) {
                        var s = function (e) {
                            if (1001 == e.status.code) switch (e.result.securityLevel) {
                            case 0:
                                t.find(".mod_box").eq(i - 1).attr("data-isshow", "0");
                                break;
                            case 1:
                                h.showError(t, e.result.message);
                                break;
                            case 2:
                                t.find(".mod_box").eq(i - 1).attr("data-isshow", "1");
                                var n = '<div id="lg_chk" class="lg_chk"></div>',
                                    s = t.find(".lg_remember");
                                r.GetImgCheck(n, "#lg_chk", s, t)
                            }
                        };
                        h.ajaxPost({
                            uname: e.val(),
                            type: i
                        }, n.LOGIN_CONFIG, s)
                    }
                },
                h = {
                    ajaxPost: function (t, e, i) {
                        $.ajax({
                            url: e,
                            type: "GET",
                            dataType: "jsonp",
                            data: t,
                            success: function (t) {
                                i(t)
                            }
                        })
                    }, submitNowForm: function (t, e, i, a) {
                        var h, c, u = this;
                        if ("visible" == t.find(".error_tip").css("visibility")) return !1;
                        var l = t.find(".lg_remember :checkbox").prop("checked");
                        if (2 == e) {
                            var f = t.find(".eb_mod_box"),
                                p = f.find("input[name=uname]"),
                                d = MGTOOL.trim(p.val()),
                                g = f.find("input[name='telcode']");
                            if (d == p.attr("def-v")) return u.showError(t, "请输入" + p.attr("def-v")), !1;
                            if (!/^1\d{10,10}$/.test(d)) return u.showError(t, "请输入正确的手机号码"), !1;
                            if (MGTOOL.trim(g.val()) == g.attr("def-v")) return u.showError(t, "请输入" + g.attr("def-v")), !1;
                            h = {
                                mobile: d,
                                code: g.val(),
                                captkey: $("#imgcheckcode").val(),
                                captcode: $("#imgcheckvalue").val(),
                                from: 1,
                                remember: l,
                                mogusecret: s.ccback(a)
                            }, c = n.LOGIN_CHECK_CODE
                        } else {
                            var f = t.find(".lo_mod_box"),
                                p = f.find("input[name=uname]"),
                                m = f.find("input[name=pass]").val();
                            if (MGTOOL.trim(p.val()) == p.attr("def-v")) return u.showError(t, "请输入" + p.attr("def-v")), !1;
                            if ("" == MGTOOL.trim(m)) return u.showError(t, "请输入登录密码"), !1;
                            if ($(".imgcheck_code_img_div:visible").length && !r.isImgcodeCheck(t, u.showError)) return !1;
                            h = {
                                uname: p.val(),
                                captkey: $("#imgcheckcode").val(),
                                captcode: $("#imgcheckvalue").val(),
                                from: 2,
                                remember: l,
                                token: window.__token,
                                mogusecret: s.ccback(a)
                            }, c = n.LOGIN
                        }
                        var v = function (e) {
                            var n = e.result;
                            if (1001 == e.status.code) switch (n.securityLevel) {
                            case 5:
                                location.href = "http://portal.meilishuo.com/user/forcebind?token=" + n.bindToken;
                                break;
                            case 4:
                                u.showError(t, n.toastText + '。<a style="text-decoration: underline;" href="' + n.jumpUrl + '">去重置</a>');
                                break;
                            case 3:
                                location.href = "http://portal.meilishuo.com/user/validation?pagetype=validation&code=" + encodeURIComponent(n.code);
                                break;
                            case 0:
                                i.Login_Light_Box.success_close("登录成功！", 200), i.callback ? i.callback(e.result.data) : location.reload()
                            } else u.showError(t, e.status.msg)
                        };
                        return 1 == e ? void u.ajaxPost({}, n.LOGIN_GETTOKEN, function (e) {
                            var i = t.find(".lo_mod_box"),
                                n = i.find("input[name=pass]").val();
                            o.setPublicKey(e.result.publicKey);
                            var r = o.encrypt($.md5(n));
                            h.password = r, h.passwordToken = e.result.token, u.ajaxPost(h, c, v)
                        }) : void u.ajaxPost(h, c, v)
                    }, showError: function (t, e) {
                        e && t.find(".error_tip").html(e).css("visibility", "visible")
                    }, hideError: function (t) {
                        "visible" == t.find(".error_tip").css("visibility") && t.find(".error_tip").css("visibility", "hidden")
                    }, turnLoginMod: function (t, e) {
                        var i = t.find(".lg_form");
                        1 == e ? (i.find(".mod_box").hide().eq(0).show(), i.removeClass("easy_buy")) : 2 == e && (i.find(".mod_box").hide().eq(1).show(), i.addClass("easy_buy")), 1 == i.find(".mod_box:visible").attr("data-isshow") ? i.find(".lg_chk").show() : i.find(".lg_chk").hide()
                    }, countDownStart: function (t, e) {
                        var i = this;
                        i.timer = "";
                        var n = function r(t, e) {
                            i.timer && clearTimeout(i.timer), i.timer = setTimeout(function () {
                                0 >= e ? t.html("重新发送").removeClass("downing") : (e--, t.html("重新发送(" + e + ")"), r(t, e))
                            }, "1000")
                        };
                        n(t, e)
                    }
                };
            t.exports = {
                CHECK: a,
                UI: h
            }
        },
        function (t, e) {
            "use strict";
            var i = {
                LOGIN_CONFIG: "http://portal.meilishuo.com/api/validate/loginconfig",
                CAPTCHA_GET: "http://portal.meilishuo.com/api/validate/captcha/get",
                LOGIN: "http://portal.meilishuo.com/api/login/login",
                CANLOGINBYCODE: "http://portal.meilishuo.com/api/login/canloginbycode",
                LOGIN_GET_CODE: "http://portal.meilishuo.com/api/login/getcode",
                LOGIN_CHECK_CODE: "http://portal.meilishuo.com/api/login/checkcode",
                LOGIN_AUTHORIZE: "http://portal.meilishuo.com/api/oauth/login/authorize",
                LOGIN_GETTOKEN: "http://portal.meilishuo.com/api/security/getToken"
            };
            t.exports = i
        },
        function (t, e, i) {
            "use strict";
            var n = i(5),
                r = i(6),
                s = i(3),
                o = {
                    FixIe6Bug: function () {
                        $.browser.msie && "6.0" == $.browser.version && document.execCommand("BackgroundImageCache", !1, !0)
                    }, GetImgCheck: function (t, e, i, o) {
                        return $(e).length > 0 ? (o.find("#lg_chk").show(), r.imgCaptchaRecaptcha(), !1) : (i.before(t), void $.ajax({
                            url: s.CAPTCHA_GET,
                            type: "GET",
                            dataType: "jsonp"
                        }).then(function (t) {
                            if (1001 == t.status.code) {
                                var i = MoGu.ui.getTemplate(n, t.result);
                                setTimeout(function () {
                                    $(e).html(i).css("opacity", 0).animate({
                                        opacity: 1
                                    }, 1e3), $(".lg_chk").show(), r.imgCaptchaInit()
                                }, 0)
                            } else $(e).remove()
                        }))
                    }, RemoveImgCheck: function () {
                        $("#lg_chk").remove()
                    }, isImgcodeCheck: function (t, e) {
                        var i = !0;
                        if (r.imgCodeCheck()) {
                            var n = [];
                            $(".img_code_spin").each(function (t, e) {
                                var i = $(e).val();
                                n.push(i)
                            }), $("#imgcheckvalue").val(n.join("_"))
                        } else e ? e(t, "请先点击图片旋转到正确方向") : MOGU.alert("请先点击图片旋转到正确方向"), i = !1;
                        return i
                    }
                };
            t.exports = $.extend(o, r)
        },
        function (t, e) {
            t.exports = '<div class="imgcheck_code_main clearfix">\n  <span class="notice">请点击下方图片,将她们转到正确方向</span>\n  <a href="javascript:void(0);" id="imgcheck_code_change" style="float: none">换一组</a>\n  <div class="imgcheck_code_img_div" onselectstart="return false">\n    <input type="hidden" value="{{= it.code}}" id="imgcheckcode">\n\n    <div class="imgcheck_image_div" f="0" style="background:url(http://portal.meilishuo.com/api/validate/captcha/{{= it.code}}) no-repeat; background-position: 0px 0;" ></div>\n    <input type="hidden" class="img_code_spin" id="img_code_spin_0" name="check[]" value="0" autocomplete="off">\n\n    <div class="imgcheck_image_div" f="1" style="background:url(http://portal.meilishuo.com/api/validate/captcha/{{= it.code}}) no-repeat; background-position: -75px 0;" ></div>\n    <input type="hidden" class="img_code_spin" id="img_code_spin_1" name="check[]" value="0" autocomplete="off">\n\n    <div class="imgcheck_image_div" f="2" style="background:url(http://portal.meilishuo.com/api/validate/captcha/{{= it.code}}) no-repeat; background-position: -150px 0;" ></div>\n    <input type="hidden" class="img_code_spin" id="img_code_spin_2" name="check[]" value="0" autocomplete="off">\n\n    <div class="imgcheck_image_div" f="3" style="background:url(http://portal.meilishuo.com/api/validate/captcha/{{= it.code}}) no-repeat; background-position: -225px 0;" ></div>\n    <input type="hidden" class="img_code_spin" id="img_code_spin_3" name="check[]" value="0" autocomplete="off">\n  </div>\n</div>\n'
        },
        function (t, e, i) {
            "use strict";
            var n = i(3),
                r = {};
            r.imgCodeCheck = function () {
                var t = !1,
                    e = $(".img_code_spin");
                if (0 == e.length) return t = !0;
                for (var i = 0; i < e.length; i++) {
                    var n = $(e[i]);
                    if (0 != n.val()) {
                        t = !0;
                        break
                    }
                }
                return t
            };
            var s = function (t) {
                var e = t.parents(".validateitem").find(".tips"),
                    i = t.parents(".ui-option-main-box").find(".error_tip");
                e && e.length > 0 && e.is(":visible") && e.remove(), i && i.length > 0 && i.is(":visible") && i.html("")
            };
            r.imgCaptchaInit = function () {
                var t = $(".imgcheck_image_div"),
                    e = $("#imgcheck_code_change"),
                    i = function (t, e) {
                        var i = -75 * ((e + 1) % 4),
                            n = t[0].style.backgroundPosition.split(" ");
                        t[0].style.backgroundPosition = n[0] + " " + i + "px"
                    };
                t.click(function () {
                    s($(this));
                    var t = $(this).attr("f"),
                        e = $("#img_code_spin_" + t),
                        n = parseInt(e.val());
                    i($(this), n), e.val(n + 1)
                }), e.click(function () {
                    s($(this)), r.imgCaptchaRecaptcha()
                })
            }, r.imgCaptchaRecaptcha = function (t) {
                var e = function (t) {
                    for (var e = $(".imgcheck_image_div"), i = e.length, n = 0; i > n; n++) {
                        var r = e[n],
                            s = r.getAttribute("f"),
                            o = $("#img_code_spin_" + s);
                        o.val(0);
                        var a = $(r);
                        a.css("background-image", "url(http://portal.meilishuo.com/api/validate/captcha/" + t + ")"), a.css({
                            "background-position": -75 * n + "px 0"
                        })
                    }
                    $("#imgcheckcode").val(t)
                };
                void 0 === t ? $.ajax({
                    url: n.CAPTCHA_GET,
                    type: "get",
                    timeout: 6e4,
                    data: {},
                    dataType: "jsonp",
                    cache: !1,
                    success: function (t) {
                        var i = t.status.code;
                        t.status.msg;
                        if (1001 == i) {
                            var n = t.result.code;
                            e(n)
                        }
                    }, error: function (t, e, i) {
                        "timeout" == e && MOGU.alert(MGLANG.msgTimeout)
                    }
                }) : setTimeout(function () {
                    e(t)
                }, 1)
            }, r.imgCaptchaInit(), t.exports = r
        },
        function (t, e) {
            "use strict";
            var i = function (t, e) {
                    return t << e | t >>> 32 - e
                },
                n = function (t, e) {
                    var i, n, r, s, o;
                    return r = 2147483648 & t, s = 2147483648 & e, i = 1073741824 & t, n = 1073741824 & e, o = (1073741823 & t) + (1073741823 & e), i & n ? 2147483648 ^ o ^ r ^ s : i | n ? 1073741824 & o ? 3221225472 ^ o ^ r ^ s : 1073741824 ^ o ^ r ^ s : o ^ r ^ s
                },
                r = function (t, e, i) {
                    return t & e | ~t & i
                },
                s = function (t, e, i) {
                    return t & i | e & ~i
                },
                o = function (t, e, i) {
                    return t ^ e ^ i
                },
                a = function (t, e, i) {
                    return e ^ (t | ~i)
                },
                h = function (t, e, s, o, a, h, c) {
                    return t = n(t, n(n(r(e, s, o), a), c)), n(i(t, h), e)
                },
                c = function (t, e, r, o, a, h, c) {
                    return t = n(t, n(n(s(e, r, o), a), c)), n(i(t, h), e)
                },
                u = function (t, e, r, s, a, h, c) {
                    return t = n(t, n(n(o(e, r, s), a), c)), n(i(t, h), e)
                },
                l = function (t, e, r, s, o, h, c) {
                    return t = n(t, n(n(a(e, r, s), o), c)), n(i(t, h), e)
                },
                f = function (t) {
                    for (var e, i = t.length, n = i + 8, r = (n - n % 64) / 64, s = 16 * (r + 1), o = Array(s - 1), a = 0, h = 0; i > h;) e = (h - h % 4) / 4, a = h % 4 * 8, o[e] = o[e] | t.charCodeAt(h) << a, h++;
                    return e = (h - h % 4) / 4, a = h % 4 * 8, o[e] = o[e] | 128 << a, o[s - 2] = i << 3, o[s - 1] = i >>> 29, o
                },
                p = function (t) {
                    var e, i, n = "",
                        r = "";
                    for (i = 0; 3 >= i; i++) e = t >>> 8 * i & 255, r = "0" + e.toString(16), n += r.substr(r.length - 2, 2);
                    return n
                },
                d = function (t) {
                    t = t.replace(/\x0d\x0a/g, "\n");
                    for (var e = "", i = 0; i < t.length; i++) {
                        var n = t.charCodeAt(i);
                        128 > n ? e += String.fromCharCode(n) : n > 127 && 2048 > n ? (e += String.fromCharCode(n >> 6 | 192), e += String.fromCharCode(63 & n | 128)) : (e += String.fromCharCode(n >> 12 | 224), e += String.fromCharCode(n >> 6 & 63 | 128), e += String.fromCharCode(63 & n | 128))
                    }
                    return e
                };
            $.extend({
                md5: function (t) {
                    var e, i, r, s, o, a, g, m, v, b = Array(),
                        y = 7,
                        T = 12,
                        x = 17,
                        w = 22,
                        S = 5,
                        E = 9,
                        _ = 14,
                        R = 20,
                        D = 4,
                        O = 11,
                        C = 16,
                        A = 23,
                        k = 6,
                        B = 10,
                        I = 15,
                        U = 21;
                    for (t = d(t), b = f(t), a = 1732584193, g = 4023233417, m = 2562383102, v = 271733878, e = 0; e < b.length; e += 16) i = a, r = g, s = m, o = v, a = h(a, g, m, v, b[e + 0], y, 3614090360), v = h(v, a, g, m, b[e + 1], T, 3905402710), m = h(m, v, a, g, b[e + 2], x, 606105819), g = h(g, m, v, a, b[e + 3], w, 3250441966), a = h(a, g, m, v, b[e + 4], y, 4118548399), v = h(v, a, g, m, b[e + 5], T, 1200080426), m = h(m, v, a, g, b[e + 6], x, 2821735955), g = h(g, m, v, a, b[e + 7], w, 4249261313), a = h(a, g, m, v, b[e + 8], y, 1770035416), v = h(v, a, g, m, b[e + 9], T, 2336552879), m = h(m, v, a, g, b[e + 10], x, 4294925233), g = h(g, m, v, a, b[e + 11], w, 2304563134), a = h(a, g, m, v, b[e + 12], y, 1804603682), v = h(v, a, g, m, b[e + 13], T, 4254626195), m = h(m, v, a, g, b[e + 14], x, 2792965006), g = h(g, m, v, a, b[e + 15], w, 1236535329), a = c(a, g, m, v, b[e + 1], S, 4129170786), v = c(v, a, g, m, b[e + 6], E, 3225465664), m = c(m, v, a, g, b[e + 11], _, 643717713), g = c(g, m, v, a, b[e + 0], R, 3921069994), a = c(a, g, m, v, b[e + 5], S, 3593408605), v = c(v, a, g, m, b[e + 10], E, 38016083), m = c(m, v, a, g, b[e + 15], _, 3634488961), g = c(g, m, v, a, b[e + 4], R, 3889429448), a = c(a, g, m, v, b[e + 9], S, 568446438), v = c(v, a, g, m, b[e + 14], E, 3275163606), m = c(m, v, a, g, b[e + 3], _, 4107603335), g = c(g, m, v, a, b[e + 8], R, 1163531501), a = c(a, g, m, v, b[e + 13], S, 2850285829), v = c(v, a, g, m, b[e + 2], E, 4243563512), m = c(m, v, a, g, b[e + 7], _, 1735328473), g = c(g, m, v, a, b[e + 12], R, 2368359562), a = u(a, g, m, v, b[e + 5], D, 4294588738), v = u(v, a, g, m, b[e + 8], O, 2272392833), m = u(m, v, a, g, b[e + 11], C, 1839030562), g = u(g, m, v, a, b[e + 14], A, 4259657740), a = u(a, g, m, v, b[e + 1], D, 2763975236), v = u(v, a, g, m, b[e + 4], O, 1272893353), m = u(m, v, a, g, b[e + 7], C, 4139469664), g = u(g, m, v, a, b[e + 10], A, 3200236656), a = u(a, g, m, v, b[e + 13], D, 681279174), v = u(v, a, g, m, b[e + 0], O, 3936430074), m = u(m, v, a, g, b[e + 3], C, 3572445317), g = u(g, m, v, a, b[e + 6], A, 76029189), a = u(a, g, m, v, b[e + 9], D, 3654602809), v = u(v, a, g, m, b[e + 12], O, 3873151461), m = u(m, v, a, g, b[e + 15], C, 530742520), g = u(g, m, v, a, b[e + 2], A, 3299628645), a = l(a, g, m, v, b[e + 0], k, 4096336452), v = l(v, a, g, m, b[e + 7], B, 1126891415), m = l(m, v, a, g, b[e + 14], I, 2878612391), g = l(g, m, v, a, b[e + 5], U, 4237533241), a = l(a, g, m, v, b[e + 12], k, 1700485571), v = l(v, a, g, m, b[e + 3], B, 2399980690), m = l(m, v, a, g, b[e + 10], I, 4293915773), g = l(g, m, v, a, b[e + 1], U, 2240044497), a = l(a, g, m, v, b[e + 8], k, 1873313359), v = l(v, a, g, m, b[e + 15], B, 4264355552), m = l(m, v, a, g, b[e + 6], I, 2734768916), g = l(g, m, v, a, b[e + 13], U, 1309151649), a = l(a, g, m, v, b[e + 4], k, 4149444226), v = l(v, a, g, m, b[e + 11], B, 3174756917), m = l(m, v, a, g, b[e + 2], I, 718787259), g = l(g, m, v, a, b[e + 9], U, 3951481745), a = n(a, i), g = n(g, r), m = n(m, s), v = n(v, o);
                    var K = p(a) + p(g) + p(m) + p(v);
                    return K.toLowerCase()
                }
            })
        },
        function (t, e, i) {
            "use strict";
            var n = {
                ccback: function (t) {
                    function e(t) {
                        t.s = t.s + t.t
                    }

                    function i(t) {
                        _ += t
                    }

                    function n(t, e, i) {
                        if (-1 == I && (I = e / 2), 1 != e)
                            if (e == I + 1)
                                if (0 > i) {
                                    var r = t.s.charCodeAt(t.s.length - 1);
                                    t.t = String.fromCharCode(r - 1), S.ab("zq", t), n(t, e - 1, i)
                                } else {
                                    var r = t.s.charCodeAt(t.s.length - 1);
                                    t.t = String.fromCharCode(r + 1), S.ab("zq", t), n(t, e - 1, i)
                                } else if (I + 1 > e)
                            if (0 > i) {
                                var r = t.s.charCodeAt(t.s.length - 1);
                                t.t = String.fromCharCode(r + 2), S.ab("zq", t), n(t, e - 1, i)
                            } else {
                                var r = t.s.charCodeAt(t.s.length - 1);
                                t.t = String.fromCharCode(r - 2), S.ab("zq", t), n(t, e - 1, i)
                            } else if (0 > i) {
                            var r = t.s.charCodeAt(t.s.length - 1);
                            t.t = String.fromCharCode(r - 2), S.ab("zq", t), n(t, e - 1, i)
                        } else {
                            var r = t.s.charCodeAt(t.s.length - 1);
                            t.t = String.fromCharCode(r + 2), S.ab("zq", t), n(t, e - 1, i)
                        }
                    }

                    function r() {
                        this.name = "bat", this.tt = 4, this.q = {}, this.HA = function () {
                            this.name = "tabd", this.tt += 1, this.q.ab = 124, this.q.ab += 291, S.t1 = y;
                            var t = {};
                            return t.qP = function (t) {
                                S.t1 -= t
                            }, t.Qr = function (t) {
                                S.t1 += t
                            }, t.Jk = function (t) {
                                var e = 11,
                                    i = t << 4,
                                    n = t >>> 16 - e,
                                    r = (i ^ n) >>> 0,
                                    s = r + t & 4294967295;
                                return s >>> 0
                            }, t.tt = 911511, t
                        }
                    }

                    function s(t, e, i) {
                        for (var n = t, r = "", s = 0; e > s; s++) {
                            n += 6;
                            var o = i >>> 32 - n;
                            o = 63 & o, r += M.tz[w](o)
                        }
                        return r
                    }

                    function o(t) {
                        k[0] = String.fromCharCode(Math.floor(16 * Math.random()) + t)
                    }

                    function a(t, e) {
                        t.t = e
                    }

                    function h() {
                        M.ab("jjt", 65);
                        var t = "";
                        t += s(0, 5, S.ls[1]);
                        var e = (3 & S.ls[1]) << 4 | S.ls[2] >>> 28;
                        return t += M.tz[w](e), t += s(4, 4, S.ls[2]), e = (15 & S.ls[2]) << 2 | S.ls[3] >>> 30, t += M.tz[w](e), t += s(2, 5, S.ls[3]), t += s(0, 5, S.ls[4]), e = (3 & S.ls[4]) << 4 | 2 * Math.floor(4 * Math.random()), t += M.tz[w](e), S.zA = k[0] + t, t
                    }

                    function c(t, e, i) {
                        for (var n = e[0], r = e[1], s = 0, o = 0; t > o; o++) n += (j.Jk(r) ^ s + i[3 & s]) >>> 0, n = (4294967295 & n) >>> 0, s = (s + S.t1 & 4294967295) >>> 0, r += (j.Jk(n) ^ s + i[s >> 11 & 3]) >>> 0, r = (4294967295 & r) >>> 0;
                        e[0] = n, e[1] = r
                    }

                    function u(t) {
                        function e(t) {
                            return t.toString(16).toUpperCase()
                        }
                        if (null == t || "" == t) return "";
                        var i = "";
                        A += "pe", m += "en";
                        for (var n, r = 0, s = t.length; s > r; r++) n = t.charCodeAt(r), 16 > n ? i += "%0" + n.toString(16).toUpperCase() : 128 > n ? i += 32 == n ? "+" : n >= 48 && 57 >= n || n >= 65 && 90 >= n || n >= 97 && 122 >= n ? t.charAt(r) : "%" + e(n) : 2048 > n ? (i += "%" + e(192 + (n >> 6)), i += "%" + e(128 + n % 64)) : (i += "%" + e(224 + (n >> 12)), i += "%" + e(128 + (n >> 6) % 64), i += "%" + e(128 + n % 64));
                        return i
                    }
                    var l, f = 10,
                        p = {
                            s: "",
                            t: ""
                        },
                        d = "tlitj",
                        g = "app";
                    if (function () {
                        l = "zac"
                    }(), 10 == f) var m = "hi",
                        v = "i";
                    var b = "",
                        y = function () {
                            function t(t) {
                                e = 291
                            }
                            for (var e = 2041507, i = 0; 8 > i; i++) e += 291;
                            return t(e), l += "exime", e > 44084 ? e + 62 - 2 + 291 + 1406985 : e - 62 - 5347 - 9 - 1560
                        }(),
                        T = "tdd",
                        x = "va",
                        w = "ch";
                    l = l.replace("z", "D");
                    var S = function () {
                            var t = {};
                            t.tt = 8;
                            var e = {};
                            return t.ab = function (t, i) {
                                if (e[t]) {
                                    for (var n = e[t], r = n.length; r--;) n[r].qq(i);
                                    return this
                                }
                            }, t.ba = function (t, i) {
                                e[t] = e[t] ? e[t] : [], e[t].push({
                                    tt: 10,
                                    qq: i
                                })
                            }, t
                        }(),
                        E = "an";
                    l = l.replace("c", "t"), x += "zue", w += "vrAt", T = T.replace("t", "a");
                    var _ = "gmt";
                    f = "cr", S.zA = "", y += 10449;
                    var R = 12,
                        D = {
                            r1: 137,
                            hj: function (t) {
                                return R + t
                            }, v: 2,
                            w: function () {
                                function t() {
                                    R = "window"
                                }
                                t()
                            }
                        };
                    m += "dd", D.w(), S.ib = g, b = "senAnn", f.replace("c", "z"), S.re = "am".replace;
                    x.replace("z", "l");
                    d = S.re.call(d, /t/g, "c");
                    var O = function () {
                        var t = 123,
                            e = t + 255;
                        return e &= 15, t = window, e > 25 && (t += "pt"), t
                    };
                    T += "gvbnt";
                    var C = {
                        ab: 9,
                        ll: function () {
                            return ab + "abc"
                        }
                    };
                    f = {
                        s: "",
                        t: ""
                    }, b += "ribune", l = S.re.call(l, "x", "T");
                    var A = "ty",
                        k = [0];
                    d = S.re.call(d, "j", "k");
                    var B = "lb_crnvenv";
                    C.x = 1, S.SO = function (t) {
                        S.t1 *= t
                    }, p.s = "z", S.oQ = e;
                    var I = -1;
                    f.s = "cre", T += "Listbnbr", C.m = O, b = S.re.call(b, /n/g, "t");
                    var U = {
                            s: 800,
                            t: 11
                        },
                        K = {};
                    ! function $(t) {
                        1 != t && (t > 5 ? k.push(t * t * t * t + 16668304) : k.push(t * t + 16), $(t - 1))
                    }(11), S.ls = k, K.s = "cli", f.t = "ate", S.kp = b, T = T.replace("g", "E"), K.t = "ent", w = S.re.call(w, "v", "a"), k[0] = Math.floor(16 * Math.random()) + 65, S.ba("zq", S.oQ), S.ab("zq", f), n(p, 26, -10), U.t += 100, p.s = p.s + "0", S.ba("JK", i), k[0] = String.fromCharCode(k[0]), I = -1, n(p, 10, 5);
                    var N = 3,
                        V = "bvbnt";
                    T = T.replace(/b/g, "e"),
                        function () {
                            B = B.replace("r", "o"), S.eb = n, I = -1, S.wq = p
                        }(), r.prototype = S;
                    var M = new r;
                    M.ba("Ma", S.SO);
                    var L = [-1, -2, -4, -8],
                        J = [100, 10];
                    N += 1, S.ba("jjt", o), D.v = C.m.apply(), M.wq.s += String.fromCharCode(43), V = M.re.call(V, /b/g, "e"), S.wq.s += "/Z";
                    var q = {};
                    ! function () {
                        B = M.re.call(B, /v/g, "t"), B = M.re.call(B, "b", "g")
                    }();
                    var P = "cmass";
                    E += "zizo";
                    (function () {
                        var t = {};
                        return t.v1 = 123, t.ff = function (t) {
                            return t /= 2, t - 2
                        }, t.ff(t.v1), J.push(D.v), t
                    })();
                    q.s = "si", J.push(J[2].document), _ = _.replace("m", "e");
                    var H = "intex",
                        j = M.HA();
                    S.ab("zq", U), q.t = "gnfo", P = P.replace("m", "l"), M.ab("Ma", 1231458), S.eb(S.wq, 26, -74), S.t1 = M.t1 / 2 + 338063271, H = M.re.call(H, "t", "d");
                    var z = new r;
                    M.tz = S.wq.s, M.ib += "end", z.bn = K, H += "Of", v += "npzt", g = "Ch", M.ib += g + "ild", z.Oz = h;
                    var G = B.substring(0, 3);
                    v = z.re.call(v, "z", "u"), G = z.re.call(G, "l", "r"), M.ab("JK", "Element"), z.ab("zq", K), S.ab("zq", q), a(K, "X"), z.ii = _ + "ById", f.t = z.ii.substring(3, 10), G += "suz", S.gw = c, M.ab("JK", "sByTagName"), G = S.re.call(G, "z", "b"), P += "Name", z.ab("zq", f), G += "mit", S.ab("zq", z.bn), D.gc = function (t, e) {
                        for (var i = t[_]("*"), n = 0; n < i.length; n++)
                            if (-1 != i[n][P][H](e)) return i[n];
                        return null
                    }, z.bn.t = z.bn.s.substring(0, 6) + "Y";
                    u("dxjhdM5c"), z.re.call(E, /z/g, "t");
                    return S.GM = function (t) {
                        t = t || J[2][V], k[1] = Math.round((new(J[2][l.substring(0, 4)]))["get" + l.substring(4)]() / 1e3), k[2] = t[z.bn.s], k[3] = t[z.bn.t], k[N] = Math.floor(5209 * Math.random() * 271) * U.s;
                        var e = [k[1], k[2]],
                            i = [k[3], k[4]];
                        M.gw(k[7], e, L), M.gw(k[9], i, L);
                        for (var n = k[4], r = 1; 5 > r; r++) 3 > r ? k[r] = e[r - 1] : k[r] = i[r - 3];
                        z.Oz(), k[4] = n
                    }, z.Gl = D.v.eci, M.GM(t), c(50, J, L), z.zA
                }
            };
            t.exports = n
        },
        function (t, e) {
            "use strict";
            var i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) {
                    return typeof t
                } : function (t) {
                    return t && "function" == typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                },
                n = {};
            ! function (t) {
                function e(t, e, i) {
                    null != t && ("number" == typeof t ? this.fromNumber(t, e, i) : null == e && "string" != typeof t ? this.fromString(t, 256) : this.fromString(t, e))
                }

                function n() {
                    return new e(null)
                }

                function r(t, e, i, n, r, s) {
                    for (; --s >= 0;) {
                        var o = e * this[t++] + i[n] + r;
                        r = Math.floor(o / 67108864), i[n++] = 67108863 & o
                    }
                    return r
                }

                function s(t, e, i, n, r, s) {
                    for (var o = 32767 & e, a = e >> 15; --s >= 0;) {
                        var h = 32767 & this[t],
                            c = this[t++] >> 15,
                            u = a * h + c * o;
                        h = o * h + ((32767 & u) << 15) + i[n] + (1073741823 & r), r = (h >>> 30) + (u >>> 15) + a * c + (r >>> 30), i[n++] = 1073741823 & h
                    }
                    return r
                }

                function o(t, e, i, n, r, s) {
                    for (var o = 16383 & e, a = e >> 14; --s >= 0;) {
                        var h = 16383 & this[t],
                            c = this[t++] >> 14,
                            u = a * h + c * o;
                        h = o * h + ((16383 & u) << 14) + i[n] + r, r = (h >> 28) + (u >> 14) + a * c, i[n++] = 268435455 & h
                    }
                    return r
                }

                function a(t) {
                    return Oe.charAt(t)
                }

                function h(t, e) {
                    var i = Ce[t.charCodeAt(e)];
                    return null == i ? -1 : i
                }

                function c(t) {
                    for (var e = this.t - 1; e >= 0; --e) t[e] = this[e];
                    t.t = this.t, t.s = this.s
                }

                function u(t) {
                    this.t = 1, this.s = 0 > t ? -1 : 0, t > 0 ? this[0] = t : -1 > t ? this[0] = t + DV : this.t = 0
                }

                function l(t) {
                    var e = n();
                    return e.fromInt(t), e
                }

                function f(t, i) {
                    var n;
                    if (16 == i) n = 4;
                    else if (8 == i) n = 3;
                    else if (256 == i) n = 8;
                    else if (2 == i) n = 1;
                    else if (32 == i) n = 5;
                    else {
                        if (4 != i) return void this.fromRadix(t, i);
                        n = 2
                    }
                    this.t = 0, this.s = 0;
                    for (var r = t.length, s = !1, o = 0; --r >= 0;) {
                        var a = 8 == n ? 255 & t[r] : h(t, r);
                        0 > a ? "-" == t.charAt(r) && (s = !0) : (s = !1, 0 == o ? this[this.t++] = a : o + n > this.DB ? (this[this.t - 1] |= (a & (1 << this.DB - o) - 1) << o, this[this.t++] = a >> this.DB - o) : this[this.t - 1] |= a << o, o += n, o >= this.DB && (o -= this.DB))
                    }
                    8 == n && 0 != (128 & t[0]) && (this.s = -1, o > 0 && (this[this.t - 1] |= (1 << this.DB - o) - 1 << o)), this.clamp(), s && e.ZERO.subTo(this, this)
                }

                function p() {
                    for (var t = this.s & this.DM; this.t > 0 && this[this.t - 1] == t;)--this.t
                }

                function d(t) {
                    if (this.s < 0) return "-" + this.negate().toString(t);
                    var e;
                    if (16 == t) e = 4;
                    else if (8 == t) e = 3;
                    else if (2 == t) e = 1;
                    else if (32 == t) e = 5;
                    else {
                        if (4 != t) return this.toRadix(t);
                        e = 2
                    }
                    var i, n = (1 << e) - 1,
                        r = !1,
                        s = "",
                        o = this.t,
                        h = this.DB - o * this.DB % e;
                    if (o-- > 0)
                        for (h < this.DB && (i = this[o] >> h) > 0 && (r = !0, s = a(i)); o >= 0;) e > h ? (i = (this[o] & (1 << h) - 1) << e - h, i |= this[--o] >> (h += this.DB - e)) : (i = this[o] >> (h -= e) & n, 0 >= h && (h += this.DB, --o)), i > 0 && (r = !0), r && (s += a(i));
                    return r ? s : "0"
                }

                function g() {
                    var t = n();
                    return e.ZERO.subTo(this, t), t
                }

                function m() {
                    return this.s < 0 ? this.negate() : this
                }

                function b(t) {
                    var e = this.s - t.s;
                    if (0 != e) return e;
                    var i = this.t;
                    if (e = i - t.t, 0 != e) return this.s < 0 ? -e : e;
                    for (; --i >= 0;)
                        if (0 != (e = this[i] - t[i])) return e;
                    return 0
                }

                function y(t) {
                    var e, i = 1;
                    return 0 != (e = t >>> 16) && (t = e, i += 16), 0 != (e = t >> 8) && (t = e, i += 8), 0 != (e = t >> 4) && (t = e, i += 4), 0 != (e = t >> 2) && (t = e, i += 2), 0 != (e = t >> 1) && (t = e, i += 1), i
                }

                function T() {
                    return this.t <= 0 ? 0 : this.DB * (this.t - 1) + y(this[this.t - 1] ^ this.s & this.DM)
                }

                function x(t, e) {
                    var i;
                    for (i = this.t - 1; i >= 0; --i) e[i + t] = this[i];
                    for (i = t - 1; i >= 0; --i) e[i] = 0;
                    e.t = this.t + t, e.s = this.s
                }

                function w(t, e) {
                    for (var i = t; i < this.t; ++i) e[i - t] = this[i];
                    e.t = Math.max(this.t - t, 0), e.s = this.s
                }

                function S(t, e) {
                    var i, n = t % this.DB,
                        r = this.DB - n,
                        s = (1 << r) - 1,
                        o = Math.floor(t / this.DB),
                        a = this.s << n & this.DM;
                    for (i = this.t - 1; i >= 0; --i) e[i + o + 1] = this[i] >> r | a, a = (this[i] & s) << n;
                    for (i = o - 1; i >= 0; --i) e[i] = 0;
                    e[o] = a, e.t = this.t + o + 1, e.s = this.s, e.clamp()
                }

                function E(t, e) {
                    e.s = this.s;
                    var i = Math.floor(t / this.DB);
                    if (i >= this.t) return void(e.t = 0);
                    var n = t % this.DB,
                        r = this.DB - n,
                        s = (1 << n) - 1;
                    e[0] = this[i] >> n;
                    for (var o = i + 1; o < this.t; ++o) e[o - i - 1] |= (this[o] & s) << r, e[o - i] = this[o] >> n;
                    n > 0 && (e[this.t - i - 1] |= (this.s & s) << r), e.t = this.t - i, e.clamp()
                }

                function _(t, e) {
                    for (var i = 0, n = 0, r = Math.min(t.t, this.t); r > i;) n += this[i] - t[i], e[i++] = n & this.DM, n >>= this.DB;
                    if (t.t < this.t) {
                        for (n -= t.s; i < this.t;) n += this[i], e[i++] = n & this.DM, n >>= this.DB;
                        n += this.s
                    } else {
                        for (n += this.s; i < t.t;) n -= t[i], e[i++] = n & this.DM, n >>= this.DB;
                        n -= t.s
                    }
                    e.s = 0 > n ? -1 : 0, -1 > n ? e[i++] = this.DV + n : n > 0 && (e[i++] = n), e.t = i, e.clamp()
                }

                function R(t, i) {
                    var n = this.abs(),
                        r = t.abs(),
                        s = n.t;
                    for (i.t = s + r.t; --s >= 0;) i[s] = 0;
                    for (s = 0; s < r.t; ++s) i[s + n.t] = n.am(0, r[s], i, s, 0, n.t);
                    i.s = 0, i.clamp(), this.s != t.s && e.ZERO.subTo(i, i)
                }

                function D(t) {
                    for (var e = this.abs(), i = t.t = 2 * e.t; --i >= 0;) t[i] = 0;
                    for (i = 0; i < e.t - 1; ++i) {
                        var n = e.am(i, e[i], t, 2 * i, 0, 1);
                        (t[i + e.t] += e.am(i + 1, 2 * e[i], t, 2 * i + 1, n, e.t - i - 1)) >= e.DV && (t[i + e.t] -= e.DV, t[i + e.t + 1] = 1)
                    }
                    t.t > 0 && (t[t.t - 1] += e.am(i, e[i], t, 2 * i, 0, 1)), t.s = 0, t.clamp()
                }

                function O(t, i, r) {
                    var s = t.abs();
                    if (!(s.t <= 0)) {
                        var o = this.abs();
                        if (o.t < s.t) return null != i && i.fromInt(0), void(null != r && this.copyTo(r));
                        null == r && (r = n());
                        var a = n(),
                            h = this.s,
                            c = t.s,
                            u = this.DB - y(s[s.t - 1]);
                        u > 0 ? (s.lShiftTo(u, a), o.lShiftTo(u, r)) : (s.copyTo(a), o.copyTo(r));
                        var l = a.t,
                            f = a[l - 1];
                        if (0 != f) {
                            var p = f * (1 << this.F1) + (l > 1 ? a[l - 2] >> this.F2 : 0),
                                d = this.FV / p,
                                g = (1 << this.F1) / p,
                                m = 1 << this.F2,
                                v = r.t,
                                b = v - l,
                                T = null == i ? n() : i;
                            for (a.dlShiftTo(b, T), r.compareTo(T) >= 0 && (r[r.t++] = 1, r.subTo(T, r)), e.ONE.dlShiftTo(l, T), T.subTo(a, a); a.t < l;) a[a.t++] = 0;
                            for (; --b >= 0;) {
                                var x = r[--v] == f ? this.DM : Math.floor(r[v] * d + (r[v - 1] + m) * g);
                                if ((r[v] += a.am(0, x, r, b, 0, l)) < x)
                                    for (a.dlShiftTo(b, T), r.subTo(T, r); r[v] < --x;) r.subTo(T, r)
                            }
                            null != i && (r.drShiftTo(l, i), h != c && e.ZERO.subTo(i, i)), r.t = l, r.clamp(), u > 0 && r.rShiftTo(u, r), 0 > h && e.ZERO.subTo(r, r)
                        }
                    }
                }

                function C(t) {
                    var i = n();
                    return this.abs().divRemTo(t, null, i), this.s < 0 && i.compareTo(e.ZERO) > 0 && t.subTo(i, i), i
                }

                function A(t) {
                    this.m = t
                }

                function k(t) {
                    return t.s < 0 || t.compareTo(this.m) >= 0 ? t.mod(this.m) : t
                }

                function B(t) {
                    return t
                }

                function I(t) {
                    t.divRemTo(this.m, null, t)
                }

                function U(t, e, i) {
                    t.multiplyTo(e, i), this.reduce(i)
                }

                function K(t, e) {
                    t.squareTo(e), this.reduce(e)
                }

                function N() {
                    if (this.t < 1) return 0;
                    var t = this[0];
                    if (0 == (1 & t)) return 0;
                    var e = 3 & t;
                    return e = e * (2 - (15 & t) * e) & 15, e = e * (2 - (255 & t) * e) & 255, e = e * (2 - ((65535 & t) * e & 65535)) & 65535, e = e * (2 - t * e % this.DV) % this.DV, e > 0 ? this.DV - e : -e
                }

                function V(t) {
                    this.m = t, this.mp = t.invDigit(), this.mpl = 32767 & this.mp, this.mph = this.mp >> 15, this.um = (1 << t.DB - 15) - 1, this.mt2 = 2 * t.t
                }

                function M(t) {
                    var i = n();
                    return t.abs().dlShiftTo(this.m.t, i), i.divRemTo(this.m, null, i), t.s < 0 && i.compareTo(e.ZERO) > 0 && this.m.subTo(i, i), i
                }

                function L(t) {
                    var e = n();
                    return t.copyTo(e), this.reduce(e), e
                }

                function J(t) {
                    for (; t.t <= this.mt2;) t[t.t++] = 0;
                    for (var e = 0; e < this.m.t; ++e) {
                        var i = 32767 & t[e],
                            n = i * this.mpl + ((i * this.mph + (t[e] >> 15) * this.mpl & this.um) << 15) & t.DM;
                        for (i = e + this.m.t, t[i] += this.m.am(0, n, t, e, 0, this.m.t); t[i] >= t.DV;) t[i] -= t.DV, t[++i]++
                    }
                    t.clamp(), t.drShiftTo(this.m.t, t), t.compareTo(this.m) >= 0 && t.subTo(this.m, t)
                }

                function q(t, e) {
                    t.squareTo(e), this.reduce(e)
                }

                function P(t, e, i) {
                    t.multiplyTo(e, i), this.reduce(i)
                }

                function H() {
                    return 0 == (this.t > 0 ? 1 & this[0] : this.s)
                }

                function j(t, i) {
                    if (t > 4294967295 || 1 > t) return e.ONE;
                    var r = n(),
                        s = n(),
                        o = i.convert(this),
                        a = y(t) - 1;
                    for (o.copyTo(r); --a >= 0;)
                        if (i.sqrTo(r, s), (t & 1 << a) > 0) i.mulTo(s, o, r);
                        else {
                            var h = r;
                            r = s, s = h
                        }
                    return i.revert(r)
                }

                function z(t, e) {
                    var i;
                    return i = 256 > t || e.isEven() ? new A(e) : new V(e), this.exp(t, i)
                }

                function G() {
                    var t = n();
                    return this.copyTo(t), t
                }

                function $() {
                    if (this.s < 0) {
                        if (1 == this.t) return this[0] - this.DV;
                        if (0 == this.t) return -1
                    } else {
                        if (1 == this.t) return this[0];
                        if (0 == this.t) return 0
                    }
                    return (this[1] & (1 << 32 - this.DB) - 1) << this.DB | this[0]
                }

                function F() {
                    return 0 == this.t ? this.s : this[0] << 24 >> 24
                }

                function Z() {
                    return 0 == this.t ? this.s : this[0] << 16 >> 16
                }

                function Y(t) {
                    return Math.floor(Math.LN2 * this.DB / Math.log(t))
                }

                function Q() {
                    return this.s < 0 ? -1 : this.t <= 0 || 1 == this.t && this[0] <= 0 ? 0 : 1
                }

                function W(t) {
                    if (null == t && (t = 10), 0 == this.signum() || 2 > t || t > 36) return "0";
                    var e = this.chunkSize(t),
                        i = Math.pow(t, e),
                        r = l(i),
                        s = n(),
                        o = n(),
                        a = "";
                    for (this.divRemTo(r, s, o); s.signum() > 0;) a = (i + o.intValue()).toString(t).substr(1) + a, s.divRemTo(r, s, o);
                    return o.intValue().toString(t) + a
                }

                function X(t, i) {
                    this.fromInt(0), null == i && (i = 10);
                    for (var n = this.chunkSize(i), r = Math.pow(i, n), s = !1, o = 0, a = 0, c = 0; c < t.length; ++c) {
                        var u = h(t, c);
                        0 > u ? "-" == t.charAt(c) && 0 == this.signum() && (s = !0) : (a = i * a + u,
                            ++o >= n && (this.dMultiply(r), this.dAddOffset(a, 0), o = 0, a = 0))
                    }
                    o > 0 && (this.dMultiply(Math.pow(i, o)), this.dAddOffset(a, 0)), s && e.ZERO.subTo(this, this)
                }

                function tt(t, i, n) {
                    if ("number" == typeof i)
                        if (2 > t) this.fromInt(1);
                        else
                            for (this.fromNumber(t, n), this.testBit(t - 1) || this.bitwiseTo(e.ONE.shiftLeft(t - 1), ht, this), this.isEven() && this.dAddOffset(1, 0); !this.isProbablePrime(i);) this.dAddOffset(2, 0), this.bitLength() > t && this.subTo(e.ONE.shiftLeft(t - 1), this);
                    else {
                        var r = new Array,
                            s = 7 & t;
                        r.length = (t >> 3) + 1, i.nextBytes(r), s > 0 ? r[0] &= (1 << s) - 1 : r[0] = 0, this.fromString(r, 256)
                    }
                }

                function et() {
                    var t = this.t,
                        e = new Array;
                    e[0] = this.s;
                    var i, n = this.DB - t * this.DB % 8,
                        r = 0;
                    if (t-- > 0)
                        for (n < this.DB && (i = this[t] >> n) != (this.s & this.DM) >> n && (e[r++] = i | this.s << this.DB - n); t >= 0;) 8 > n ? (i = (this[t] & (1 << n) - 1) << 8 - n, i |= this[--t] >> (n += this.DB - 8)) : (i = this[t] >> (n -= 8) & 255, 0 >= n && (n += this.DB, --t)), 0 != (128 & i) && (i |= -256), 0 == r && (128 & this.s) != (128 & i) && ++r, (r > 0 || i != this.s) && (e[r++] = i);
                    return e
                }

                function it(t) {
                    return 0 == this.compareTo(t)
                }

                function nt(t) {
                    return this.compareTo(t) < 0 ? this : t
                }

                function rt(t) {
                    return this.compareTo(t) > 0 ? this : t
                }

                function st(t, e, i) {
                    var n, r, s = Math.min(t.t, this.t);
                    for (n = 0; s > n; ++n) i[n] = e(this[n], t[n]);
                    if (t.t < this.t) {
                        for (r = t.s & this.DM, n = s; n < this.t; ++n) i[n] = e(this[n], r);
                        i.t = this.t
                    } else {
                        for (r = this.s & this.DM, n = s; n < t.t; ++n) i[n] = e(r, t[n]);
                        i.t = t.t
                    }
                    i.s = e(this.s, t.s), i.clamp()
                }

                function ot(t, e) {
                    return t & e
                }

                function at(t) {
                    var e = n();
                    return this.bitwiseTo(t, ot, e), e
                }

                function ht(t, e) {
                    return t | e
                }

                function ct(t) {
                    var e = n();
                    return this.bitwiseTo(t, ht, e), e
                }

                function ut(t, e) {
                    return t ^ e
                }

                function lt(t) {
                    var e = n();
                    return this.bitwiseTo(t, ut, e), e
                }

                function ft(t, e) {
                    return t & ~e
                }

                function pt(t) {
                    var e = n();
                    return this.bitwiseTo(t, ft, e), e
                }

                function dt() {
                    for (var t = n(), e = 0; e < this.t; ++e) t[e] = this.DM & ~this[e];
                    return t.t = this.t, t.s = ~this.s, t
                }

                function gt(t) {
                    var e = n();
                    return 0 > t ? this.rShiftTo(-t, e) : this.lShiftTo(t, e), e
                }

                function mt(t) {
                    var e = n();
                    return 0 > t ? this.lShiftTo(-t, e) : this.rShiftTo(t, e), e
                }

                function vt(t) {
                    if (0 == t) return -1;
                    var e = 0;
                    return 0 == (65535 & t) && (t >>= 16, e += 16), 0 == (255 & t) && (t >>= 8, e += 8), 0 == (15 & t) && (t >>= 4, e += 4), 0 == (3 & t) && (t >>= 2, e += 2), 0 == (1 & t) && ++e, e
                }

                function bt() {
                    for (var t = 0; t < this.t; ++t)
                        if (0 != this[t]) return t * this.DB + vt(this[t]);
                    return this.s < 0 ? this.t * this.DB : -1
                }

                function yt(t) {
                    for (var e = 0; 0 != t;) t &= t - 1, ++e;
                    return e
                }

                function Tt() {
                    for (var t = 0, e = this.s & this.DM, i = 0; i < this.t; ++i) t += yt(this[i] ^ e);
                    return t
                }

                function xt(t) {
                    var e = Math.floor(t / this.DB);
                    return e >= this.t ? 0 != this.s : 0 != (this[e] & 1 << t % this.DB)
                }

                function wt(t, i) {
                    var n = e.ONE.shiftLeft(t);
                    return this.bitwiseTo(n, i, n), n
                }

                function St(t) {
                    return this.changeBit(t, ht)
                }

                function Et(t) {
                    return this.changeBit(t, ft)
                }

                function _t(t) {
                    return this.changeBit(t, ut)
                }

                function Rt(t, e) {
                    for (var i = 0, n = 0, r = Math.min(t.t, this.t); r > i;) n += this[i] + t[i], e[i++] = n & this.DM, n >>= this.DB;
                    if (t.t < this.t) {
                        for (n += t.s; i < this.t;) n += this[i], e[i++] = n & this.DM, n >>= this.DB;
                        n += this.s
                    } else {
                        for (n += this.s; i < t.t;) n += t[i], e[i++] = n & this.DM, n >>= this.DB;
                        n += t.s
                    }
                    e.s = 0 > n ? -1 : 0, n > 0 ? e[i++] = n : -1 > n && (e[i++] = this.DV + n), e.t = i, e.clamp()
                }

                function Dt(t) {
                    var e = n();
                    return this.addTo(t, e), e
                }

                function Ot(t) {
                    var e = n();
                    return this.subTo(t, e), e
                }

                function Ct(t) {
                    var e = n();
                    return this.multiplyTo(t, e), e
                }

                function At() {
                    var t = n();
                    return this.squareTo(t), t
                }

                function kt(t) {
                    var e = n();
                    return this.divRemTo(t, e, null), e
                }

                function Bt(t) {
                    var e = n();
                    return this.divRemTo(t, null, e), e
                }

                function It(t) {
                    var e = n(),
                        i = n();
                    return this.divRemTo(t, e, i), new Array(e, i)
                }

                function Ut(t) {
                    this[this.t] = this.am(0, t - 1, this, 0, 0, this.t), ++this.t, this.clamp()
                }

                function Kt(t, e) {
                    if (0 != t) {
                        for (; this.t <= e;) this[this.t++] = 0;
                        for (this[e] += t; this[e] >= this.DV;) this[e] -= this.DV, ++e >= this.t && (this[this.t++] = 0), ++this[e]
                    }
                }

                function Nt() {}

                function Vt(t) {
                    return t
                }

                function Mt(t, e, i) {
                    t.multiplyTo(e, i)
                }

                function Lt(t, e) {
                    t.squareTo(e)
                }

                function Jt(t) {
                    return this.exp(t, new Nt)
                }

                function qt(t, e, i) {
                    var n = Math.min(this.t + t.t, e);
                    for (i.s = 0, i.t = n; n > 0;) i[--n] = 0;
                    var r;
                    for (r = i.t - this.t; r > n; ++n) i[n + this.t] = this.am(0, t[n], i, n, 0, this.t);
                    for (r = Math.min(t.t, e); r > n; ++n) this.am(0, t[n], i, n, 0, e - n);
                    i.clamp()
                }

                function Pt(t, e, i) {
                    --e;
                    var n = i.t = this.t + t.t - e;
                    for (i.s = 0; --n >= 0;) i[n] = 0;
                    for (n = Math.max(e - this.t, 0); n < t.t; ++n) i[this.t + n - e] = this.am(e - n, t[n], i, 0, 0, this.t + n - e);
                    i.clamp(), i.drShiftTo(1, i)
                }

                function Ht(t) {
                    this.r2 = n(), this.q3 = n(), e.ONE.dlShiftTo(2 * t.t, this.r2), this.mu = this.r2.divide(t), this.m = t
                }

                function jt(t) {
                    if (t.s < 0 || t.t > 2 * this.m.t) return t.mod(this.m);
                    if (t.compareTo(this.m) < 0) return t;
                    var e = n();
                    return t.copyTo(e), this.reduce(e), e
                }

                function zt(t) {
                    return t
                }

                function Gt(t) {
                    for (t.drShiftTo(this.m.t - 1, this.r2), t.t > this.m.t + 1 && (t.t = this.m.t + 1, t.clamp()), this.mu.multiplyUpperTo(this.r2, this.m.t + 1, this.q3), this.m.multiplyLowerTo(this.q3, this.m.t + 1, this.r2); t.compareTo(this.r2) < 0;) t.dAddOffset(1, this.m.t + 1);
                    for (t.subTo(this.r2, t); t.compareTo(this.m) >= 0;) t.subTo(this.m, t)
                }

                function $t(t, e) {
                    t.squareTo(e), this.reduce(e)
                }

                function Ft(t, e, i) {
                    t.multiplyTo(e, i), this.reduce(i)
                }

                function Zt(t, e) {
                    var i, r, s = t.bitLength(),
                        o = l(1);
                    if (0 >= s) return o;
                    i = 18 > s ? 1 : 48 > s ? 3 : 144 > s ? 4 : 768 > s ? 5 : 6, r = 8 > s ? new A(e) : e.isEven() ? new Ht(e) : new V(e);
                    var a = new Array,
                        h = 3,
                        c = i - 1,
                        u = (1 << i) - 1;
                    if (a[1] = r.convert(this), i > 1) {
                        var f = n();
                        for (r.sqrTo(a[1], f); u >= h;) a[h] = n(), r.mulTo(f, a[h - 2], a[h]), h += 2
                    }
                    var p, d, g = t.t - 1,
                        m = !0,
                        v = n();
                    for (s = y(t[g]) - 1; g >= 0;) {
                        for (s >= c ? p = t[g] >> s - c & u : (p = (t[g] & (1 << s + 1) - 1) << c - s, g > 0 && (p |= t[g - 1] >> this.DB + s - c)), h = i; 0 == (1 & p);) p >>= 1, --h;
                        if ((s -= h) < 0 && (s += this.DB, --g), m) a[p].copyTo(o), m = !1;
                        else {
                            for (; h > 1;) r.sqrTo(o, v), r.sqrTo(v, o), h -= 2;
                            h > 0 ? r.sqrTo(o, v) : (d = o, o = v, v = d), r.mulTo(v, a[p], o)
                        }
                        for (; g >= 0 && 0 == (t[g] & 1 << s);) r.sqrTo(o, v), d = o, o = v, v = d, --s < 0 && (s = this.DB - 1, --g)
                    }
                    return r.revert(o)
                }

                function Yt(t) {
                    var e = this.s < 0 ? this.negate() : this.clone(),
                        i = t.s < 0 ? t.negate() : t.clone();
                    if (e.compareTo(i) < 0) {
                        var n = e;
                        e = i, i = n
                    }
                    var r = e.getLowestSetBit(),
                        s = i.getLowestSetBit();
                    if (0 > s) return e;
                    for (s > r && (s = r), s > 0 && (e.rShiftTo(s, e), i.rShiftTo(s, i)); e.signum() > 0;)(r = e.getLowestSetBit()) > 0 && e.rShiftTo(r, e), (r = i.getLowestSetBit()) > 0 && i.rShiftTo(r, i), e.compareTo(i) >= 0 ? (e.subTo(i, e), e.rShiftTo(1, e)) : (i.subTo(e, i), i.rShiftTo(1, i));
                    return s > 0 && i.lShiftTo(s, i), i
                }

                function Qt(t) {
                    if (0 >= t) return 0;
                    var e = this.DV % t,
                        i = this.s < 0 ? t - 1 : 0;
                    if (this.t > 0)
                        if (0 == e) i = this[0] % t;
                        else
                            for (var n = this.t - 1; n >= 0; --n) i = (e * i + this[n]) % t;
                    return i
                }

                function Wt(t) {
                    var i = t.isEven();
                    if (this.isEven() && i || 0 == t.signum()) return e.ZERO;
                    for (var n = t.clone(), r = this.clone(), s = l(1), o = l(0), a = l(0), h = l(1); 0 != n.signum();) {
                        for (; n.isEven();) n.rShiftTo(1, n), i ? (s.isEven() && o.isEven() || (s.addTo(this, s), o.subTo(t, o)), s.rShiftTo(1, s)) : o.isEven() || o.subTo(t, o), o.rShiftTo(1, o);
                        for (; r.isEven();) r.rShiftTo(1, r), i ? (a.isEven() && h.isEven() || (a.addTo(this, a), h.subTo(t, h)), a.rShiftTo(1, a)) : h.isEven() || h.subTo(t, h), h.rShiftTo(1, h);
                        n.compareTo(r) >= 0 ? (n.subTo(r, n), i && s.subTo(a, s), o.subTo(h, o)) : (r.subTo(n, r), i && a.subTo(s, a), h.subTo(o, h))
                    }
                    return 0 != r.compareTo(e.ONE) ? e.ZERO : h.compareTo(t) >= 0 ? h.subtract(t) : h.signum() < 0 ? (h.addTo(t, h), h.signum() < 0 ? h.add(t) : h) : h
                }

                function Xt(t) {
                    var e, i = this.abs();
                    if (1 == i.t && i[0] <= Ae[Ae.length - 1]) {
                        for (e = 0; e < Ae.length; ++e)
                            if (i[0] == Ae[e]) return !0;
                        return !1
                    }
                    if (i.isEven()) return !1;
                    for (e = 1; e < Ae.length;) {
                        for (var n = Ae[e], r = e + 1; r < Ae.length && ke > n;) n *= Ae[r++];
                        for (n = i.modInt(n); r > e;)
                            if (n % Ae[e++] == 0) return !1
                    }
                    return i.millerRabin(t)
                }

                function te(t) {
                    var i = this.subtract(e.ONE),
                        r = i.getLowestSetBit();
                    if (0 >= r) return !1;
                    var s = i.shiftRight(r);
                    t = t + 1 >> 1, t > Ae.length && (t = Ae.length);
                    for (var o = n(), a = 0; t > a; ++a) {
                        o.fromInt(Ae[Math.floor(Math.random() * Ae.length)]);
                        var h = o.modPow(s, this);
                        if (0 != h.compareTo(e.ONE) && 0 != h.compareTo(i)) {
                            for (var c = 1; c++ < r && 0 != h.compareTo(i);)
                                if (h = h.modPowInt(2, this), 0 == h.compareTo(e.ONE)) return !1;
                            if (0 != h.compareTo(i)) return !1
                        }
                    }
                    return !0
                }

                function ee() {
                    this.i = 0, this.j = 0, this.S = new Array
                }

                function ie(t) {
                    var e, i, n;
                    for (e = 0; 256 > e; ++e) this.S[e] = e;
                    for (i = 0, e = 0; 256 > e; ++e) i = i + this.S[e] + t[e % t.length] & 255, n = this.S[e], this.S[e] = this.S[i], this.S[i] = n;
                    this.i = 0, this.j = 0
                }

                function ne() {
                    var t;
                    return this.i = this.i + 1 & 255, this.j = this.j + this.S[this.i] & 255, t = this.S[this.i], this.S[this.i] = this.S[this.j], this.S[this.j] = t, this.S[t + this.S[this.i] & 255]
                }

                function re() {
                    return new ee
                }

                function se() {
                    if (null == Be) {
                        for (Be = re(); Ke > Ue;) {
                            var t = Math.floor(65536 * Math.random());
                            Ie[Ue++] = 255 & t
                        }
                        for (Be.init(Ie), Ue = 0; Ue < Ie.length; ++Ue) Ie[Ue] = 0;
                        Ue = 0
                    }
                    return Be.next()
                }

                function oe(t) {
                    var e;
                    for (e = 0; e < t.length; ++e) t[e] = se()
                }

                function ae() {}

                function he(t, i) {
                    return new e(t, i)
                }

                function ce(t, i) {
                    if (i < t.length + 11) return console.error("Message too long for RSA"), null;
                    for (var n = new Array, r = t.length - 1; r >= 0 && i > 0;) {
                        var s = t.charCodeAt(r--);
                        128 > s ? n[--i] = s : s > 127 && 2048 > s ? (n[--i] = 63 & s | 128, n[--i] = s >> 6 | 192) : (n[--i] = 63 & s | 128, n[--i] = s >> 6 & 63 | 128, n[--i] = s >> 12 | 224)
                    }
                    n[--i] = 0;
                    for (var o = new ae, a = new Array; i > 2;) {
                        for (a[0] = 0; 0 == a[0];) o.nextBytes(a);
                        n[--i] = a[0]
                    }
                    return n[--i] = 2, n[--i] = 0, new e(n)
                }

                function ue() {
                    this.n = null, this.e = 0, this.d = null, this.p = null, this.q = null, this.dmp1 = null, this.dmq1 = null, this.coeff = null
                }

                function le(t, e) {
                    null != t && null != e && t.length > 0 && e.length > 0 ? (this.n = he(t, 16), this.e = parseInt(e, 16)) : console.error("Invalid RSA public key")
                }

                function fe(t) {
                    return t.modPowInt(this.e, this.n)
                }

                function pe(t) {
                    var e = ce(t, this.n.bitLength() + 7 >> 3);
                    if (null == e) return null;
                    var i = this.doPublic(e);
                    if (null == i) return null;
                    var n = i.toString(16);
                    return 0 == (1 & n.length) ? n : "0" + n
                }

                function de(t, e) {
                    for (var i = t.toByteArray(), n = 0; n < i.length && 0 == i[n];)++n;
                    if (i.length - n != e - 1 || 2 != i[n]) return null;
                    for (++n; 0 != i[n];)
                        if (++n >= i.length) return null;
                    for (var r = ""; ++n < i.length;) {
                        var s = 255 & i[n];
                        128 > s ? r += String.fromCharCode(s) : s > 191 && 224 > s ? (r += String.fromCharCode((31 & s) << 6 | 63 & i[n + 1]), ++n) : (r += String.fromCharCode((15 & s) << 12 | (63 & i[n + 1]) << 6 | 63 & i[n + 2]), n += 2)
                    }
                    return r
                }

                function ge(t, e, i) {
                    null != t && null != e && t.length > 0 && e.length > 0 ? (this.n = he(t, 16), this.e = parseInt(e, 16), this.d = he(i, 16)) : console.error("Invalid RSA private key")
                }

                function me(t, e, i, n, r, s, o, a) {
                    null != t && null != e && t.length > 0 && e.length > 0 ? (this.n = he(t, 16), this.e = parseInt(e, 16), this.d = he(i, 16), this.p = he(n, 16), this.q = he(r, 16), this.dmp1 = he(s, 16), this.dmq1 = he(o, 16), this.coeff = he(a, 16)) : console.error("Invalid RSA private key")
                }

                function ve(t, i) {
                    var n = new ae,
                        r = t >> 1;
                    this.e = parseInt(i, 16);
                    for (var s = new e(i, 16);;) {
                        for (; this.p = new e(t - r, 1, n), 0 != this.p.subtract(e.ONE).gcd(s).compareTo(e.ONE) || !this.p.isProbablePrime(10););
                        for (; this.q = new e(r, 1, n), 0 != this.q.subtract(e.ONE).gcd(s).compareTo(e.ONE) || !this.q.isProbablePrime(10););
                        if (this.p.compareTo(this.q) <= 0) {
                            var o = this.p;
                            this.p = this.q, this.q = o
                        }
                        var a = this.p.subtract(e.ONE),
                            h = this.q.subtract(e.ONE),
                            c = a.multiply(h);
                        if (0 == c.gcd(s).compareTo(e.ONE)) {
                            this.n = this.p.multiply(this.q), this.d = s.modInverse(c), this.dmp1 = this.d.mod(a), this.dmq1 = this.d.mod(h), this.coeff = this.q.modInverse(this.p);
                            break
                        }
                    }
                }

                function be(t) {
                    if (null == this.p || null == this.q) return t.modPow(this.d, this.n);
                    for (var e = t.mod(this.p).modPow(this.dmp1, this.p), i = t.mod(this.q).modPow(this.dmq1, this.q); e.compareTo(i) < 0;) e = e.add(this.p);
                    return e.subtract(i).multiply(this.coeff).mod(this.p).multiply(this.q).add(i)
                }

                function ye(t) {
                    var e = he(t, 16),
                        i = this.doPrivate(e);
                    return null == i ? null : de(i, this.n.bitLength() + 7 >> 3)
                }

                function Te(t) {
                    var e, i, n = "";
                    for (e = 0; e + 3 <= t.length; e += 3) i = parseInt(t.substring(e, e + 3), 16), n += Le.charAt(i >> 6) + Le.charAt(63 & i);
                    for (e + 1 == t.length ? (i = parseInt(t.substring(e, e + 1), 16), n += Le.charAt(i << 2)) : e + 2 == t.length && (i = parseInt(t.substring(e, e + 2), 16), n += Le.charAt(i >> 2) + Le.charAt((3 & i) << 4));
                        (3 & n.length) > 0;) n += Je;
                    return n
                }

                function xe(t) {
                    var e, i, n = "",
                        r = 0;
                    for (e = 0; e < t.length && t.charAt(e) != Je; ++e) v = Le.indexOf(t.charAt(e)), v < 0 || (0 == r ? (n += a(v >> 2), i = 3 & v, r = 1) : 1 == r ? (n += a(i << 2 | v >> 4), i = 15 & v, r = 2) : 2 == r ? (n += a(i), n += a(v >> 2), i = 3 & v, r = 3) : (n += a(i << 2 | v >> 4), n += a(15 & v), r = 0));
                    return 1 == r && (n += a(i << 2)), n
                }
                var we, Se = 0xdeadbeefcafe,
                    Ee = 15715070 == (16777215 & Se);
                Ee && "Microsoft Internet Explorer" == navigator.appName ? (e.prototype.am = s, we = 30) : Ee && "Netscape" != navigator.appName ? (e.prototype.am = r, we = 26) : (e.prototype.am = o, we = 28), e.prototype.DB = we, e.prototype.DM = (1 << we) - 1, e.prototype.DV = 1 << we;
                var _e = 52;
                e.prototype.FV = Math.pow(2, _e), e.prototype.F1 = _e - we, e.prototype.F2 = 2 * we - _e;
                var Re, De, Oe = "0123456789abcdefghijklmnopqrstuvwxyz",
                    Ce = new Array;
                for (Re = "0".charCodeAt(0), De = 0; 9 >= De; ++De) Ce[Re++] = De;
                for (Re = "a".charCodeAt(0), De = 10; 36 > De; ++De) Ce[Re++] = De;
                for (Re = "A".charCodeAt(0), De = 10; 36 > De; ++De) Ce[Re++] = De;
                A.prototype.convert = k, A.prototype.revert = B, A.prototype.reduce = I, A.prototype.mulTo = U, A.prototype.sqrTo = K, V.prototype.convert = M, V.prototype.revert = L, V.prototype.reduce = J, V.prototype.mulTo = P, V.prototype.sqrTo = q, e.prototype.copyTo = c, e.prototype.fromInt = u, e.prototype.fromString = f, e.prototype.clamp = p, e.prototype.dlShiftTo = x, e.prototype.drShiftTo = w, e.prototype.lShiftTo = S, e.prototype.rShiftTo = E, e.prototype.subTo = _, e.prototype.multiplyTo = R, e.prototype.squareTo = D, e.prototype.divRemTo = O, e.prototype.invDigit = N, e.prototype.isEven = H, e.prototype.exp = j, e.prototype.toString = d, e.prototype.negate = g, e.prototype.abs = m, e.prototype.compareTo = b, e.prototype.bitLength = T, e.prototype.mod = C, e.prototype.modPowInt = z, e.ZERO = l(0), e.ONE = l(1), Nt.prototype.convert = Vt, Nt.prototype.revert = Vt, Nt.prototype.mulTo = Mt, Nt.prototype.sqrTo = Lt, Ht.prototype.convert = jt, Ht.prototype.revert = zt, Ht.prototype.reduce = Gt, Ht.prototype.mulTo = Ft, Ht.prototype.sqrTo = $t;
                var Ae = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997],
                    ke = (1 << 26) / Ae[Ae.length - 1];
                e.prototype.chunkSize = Y, e.prototype.toRadix = W, e.prototype.fromRadix = X, e.prototype.fromNumber = tt, e.prototype.bitwiseTo = st, e.prototype.changeBit = wt, e.prototype.addTo = Rt, e.prototype.dMultiply = Ut, e.prototype.dAddOffset = Kt, e.prototype.multiplyLowerTo = qt, e.prototype.multiplyUpperTo = Pt, e.prototype.modInt = Qt, e.prototype.millerRabin = te, e.prototype.clone = G, e.prototype.intValue = $, e.prototype.byteValue = F, e.prototype.shortValue = Z, e.prototype.signum = Q, e.prototype.toByteArray = et, e.prototype.equals = it, e.prototype.min = nt, e.prototype.max = rt, e.prototype.and = at, e.prototype.or = ct, e.prototype.xor = lt, e.prototype.andNot = pt, e.prototype.not = dt, e.prototype.shiftLeft = gt, e.prototype.shiftRight = mt, e.prototype.getLowestSetBit = bt, e.prototype.bitCount = Tt, e.prototype.testBit = xt, e.prototype.setBit = St, e.prototype.clearBit = Et, e.prototype.flipBit = _t, e.prototype.add = Dt, e.prototype.subtract = Ot, e.prototype.multiply = Ct, e.prototype.divide = kt, e.prototype.remainder = Bt, e.prototype.divideAndRemainder = It, e.prototype.modPow = Zt, e.prototype.modInverse = Wt, e.prototype.pow = Jt, e.prototype.gcd = Yt, e.prototype.isProbablePrime = Xt, e.prototype.square = At, ee.prototype.init = ie, ee.prototype.next = ne;
                var Be, Ie, Ue, Ke = 256;
                if (null == Ie) {
                    Ie = new Array, Ue = 0;
                    var Ne;
                    if (window.crypto && window.crypto.getRandomValues) {
                        var Ve = new Uint32Array(256);
                        for (window.crypto.getRandomValues(Ve), Ne = 0; Ne < Ve.length; ++Ne) Ie[Ue++] = 255 & Ve[Ne]
                    }
                    var Me = function Fe(t) {
                        if (this.count = this.count || 0, this.count >= 256 || Ue >= Ke) return void(window.removeEventListener ? window.removeEventListener("mousemove", Fe) : window.detachEvent && window.detachEvent("onmousemove", Fe));
                        this.count += 1;
                        var e = t.x + t.y;
                        Ie[Ue++] = 255 & e
                    };
                    window.addEventListener ? window.addEventListener("mousemove", Me) : window.attachEvent && window.attachEvent("onmousemove", Me)
                }
                ae.prototype.nextBytes = oe, ue.prototype.doPublic = fe, ue.prototype.setPublic = le, ue.prototype.encrypt = pe, ue.prototype.doPrivate = be, ue.prototype.setPrivate = ge, ue.prototype.setPrivateEx = me, ue.prototype.generate = ve, ue.prototype.decrypt = ye,
                    function () {
                        var t = function (t, i, r) {
                            var s = new ae,
                                o = t >> 1;
                            this.e = parseInt(i, 16);
                            var a = new e(i, 16),
                                h = this,
                                c = function u() {
                                    var i = function () {
                                            if (h.p.compareTo(h.q) <= 0) {
                                                var t = h.p;
                                                h.p = h.q, h.q = t
                                            }
                                            var i = h.p.subtract(e.ONE),
                                                n = h.q.subtract(e.ONE),
                                                s = i.multiply(n);
                                            0 == s.gcd(a).compareTo(e.ONE) ? (h.n = h.p.multiply(h.q), h.d = a.modInverse(s), h.dmp1 = h.d.mod(i), h.dmq1 = h.d.mod(n), h.coeff = h.q.modInverse(h.p), setTimeout(function () {
                                                r()
                                            }, 0)) : setTimeout(u, 0)
                                        },
                                        c = function f() {
                                            h.q = n(), h.q.fromNumberAsync(o, 1, s, function () {
                                                h.q.subtract(e.ONE).gcda(a, function (t) {
                                                    0 == t.compareTo(e.ONE) && h.q.isProbablePrime(10) ? setTimeout(i, 0) : setTimeout(f, 0)
                                                })
                                            })
                                        },
                                        l = function p() {
                                            h.p = n(), h.p.fromNumberAsync(t - o, 1, s, function () {
                                                h.p.subtract(e.ONE).gcda(a, function (t) {
                                                    0 == t.compareTo(e.ONE) && h.p.isProbablePrime(10) ? setTimeout(c, 0) : setTimeout(p, 0)
                                                })
                                            })
                                        };
                                    setTimeout(l, 0)
                                };
                            setTimeout(c, 0)
                        };
                        ue.prototype.generateAsync = t;
                        var i = function (t, e) {
                            var i = this.s < 0 ? this.negate() : this.clone(),
                                n = t.s < 0 ? t.negate() : t.clone();
                            if (i.compareTo(n) < 0) {
                                var r = i;
                                i = n, n = r
                            }
                            var s = i.getLowestSetBit(),
                                o = n.getLowestSetBit();
                            if (0 > o) return void e(i);
                            o > s && (o = s), o > 0 && (i.rShiftTo(o, i), n.rShiftTo(o, n));
                            var a = function h() {
                                (s = i.getLowestSetBit()) > 0 && i.rShiftTo(s, i), (s = n.getLowestSetBit()) > 0 && n.rShiftTo(s, n), i.compareTo(n) >= 0 ? (i.subTo(n, i), i.rShiftTo(1, i)) : (n.subTo(i, n), n.rShiftTo(1, n)), i.signum() > 0 ? setTimeout(h, 0) : (o > 0 && n.lShiftTo(o, n), setTimeout(function () {
                                    e(n)
                                }, 0))
                            };
                            setTimeout(a, 10)
                        };
                        e.prototype.gcda = i;
                        var r = function (t, i, n, r) {
                            if ("number" == typeof i)
                                if (2 > t) this.fromInt(1);
                                else {
                                    this.fromNumber(t, n), this.testBit(t - 1) || this.bitwiseTo(e.ONE.shiftLeft(t - 1), ht, this), this.isEven() && this.dAddOffset(1, 0);
                                    var s = this,
                                        o = function c() {
                                            s.dAddOffset(2, 0), s.bitLength() > t && s.subTo(e.ONE.shiftLeft(t - 1), s), s.isProbablePrime(i) ? setTimeout(function () {
                                                r()
                                            }, 0) : setTimeout(c, 0)
                                        };
                                    setTimeout(o, 0)
                                } else {
                                var a = new Array,
                                    h = 7 & t;
                                a.length = (t >> 3) + 1, i.nextBytes(a), h > 0 ? a[0] &= (1 << h) - 1 : a[0] = 0, this.fromString(a, 256)
                            }
                        };
                        e.prototype.fromNumberAsync = r
                    }();
                var Le = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
                    Je = "=",
                    qe = qe || {};
                qe.env = qe.env || {};
                var Pe = qe,
                    He = Object.prototype,
                    je = "[object Function]",
                    ze = ["toString", "valueOf"];
                qe.env.parseUA = function (t) {
                        var e, i = function (t) {
                                var e = 0;
                                return parseFloat(t.replace(/\./g, function () {
                                    return 1 == e++ ? "" : "."
                                }))
                            },
                            n = navigator,
                            r = {
                                ie: 0,
                                opera: 0,
                                gecko: 0,
                                webkit: 0,
                                chrome: 0,
                                mobile: null,
                                air: 0,
                                ipad: 0,
                                iphone: 0,
                                ipod: 0,
                                ios: null,
                                android: 0,
                                webos: 0,
                                caja: n && n.cajaVersion,
                                secure: !1,
                                os: null
                            },
                            s = t || navigator && navigator.userAgent,
                            o = window && window.location,
                            a = o && o.href;
                        return r.secure = a && 0 === a.toLowerCase().indexOf("https"), s && (/windows|win32/i.test(s) ? r.os = "windows" : /macintosh/i.test(s) ? r.os = "macintosh" : /rhino/i.test(s) && (r.os = "rhino"), /KHTML/.test(s) && (r.webkit = 1), e = s.match(/AppleWebKit\/([^\s]*)/), e && e[1] && (r.webkit = i(e[1]), / Mobile\//.test(s) ? (r.mobile = "Apple", e = s.match(/OS ([^\s]*)/), e && e[1] && (e = i(e[1].replace("_", "."))), r.ios = e, r.ipad = r.ipod = r.iphone = 0, e = s.match(/iPad|iPod|iPhone/), e && e[0] && (r[e[0].toLowerCase()] = r.ios)) : (e = s.match(/NokiaN[^\/]*|Android \d\.\d|webOS\/\d\.\d/), e && (r.mobile = e[0]), /webOS/.test(s) && (r.mobile = "WebOS", e = s.match(/webOS\/([^\s]*);/), e && e[1] && (r.webos = i(e[1]))), / Android/.test(s) && (r.mobile = "Android", e = s.match(/Android ([^\s]*);/), e && e[1] && (r.android = i(e[1])))), e = s.match(/Chrome\/([^\s]*)/), e && e[1] ? r.chrome = i(e[1]) : (e = s.match(/AdobeAIR\/([^\s]*)/), e && (r.air = e[0]))), r.webkit || (e = s.match(/Opera[\s\/]([^\s]*)/), e && e[1] ? (r.opera = i(e[1]), e = s.match(/Version\/([^\s]*)/), e && e[1] && (r.opera = i(e[1])), e = s.match(/Opera Mini[^;]*/), e && (r.mobile = e[0])) : (e = s.match(/MSIE\s([^;]*)/), e && e[1] ? r.ie = i(e[1]) : (e = s.match(/Gecko\/([^\s]*)/), e && (r.gecko = 1, e = s.match(/rv:([^\s\)]*)/), e && e[1] && (r.gecko = i(e[1]))))))), r
                    }, qe.env.ua = qe.env.parseUA(), qe.isFunction = function (t) {
                        return "function" == typeof t || He.toString.apply(t) === je
                    }, qe._IEEnumFix = qe.env.ua.ie ? function (t, e) {
                        var i, n, r;
                        for (i = 0; i < ze.length; i += 1) n = ze[i], r = e[n], Pe.isFunction(r) && r != He[n] && (t[n] = r)
                    } : function () {}, qe.extend = function (t, e, i) {
                        if (!e || !t) throw new Error("extend failed, please check that all dependencies are included.");
                        var n, r = function () {};
                        if (r.prototype = e.prototype, t.prototype = new r, t.prototype.constructor = t, t.superclass = e.prototype, e.prototype.constructor == He.constructor && (e.prototype.constructor = e), i) {
                            for (n in i) Pe.hasOwnProperty(i, n) && (t.prototype[n] = i[n]);
                            Pe._IEEnumFix(t.prototype, i)
                        }
                    }, "undefined" != typeof KJUR && KJUR || (window.KJUR = {}), "undefined" != typeof KJUR.asn1 && KJUR.asn1 || (KJUR.asn1 = {}), KJUR.asn1.ASN1Util = new function () {
                        this.integerToByteHex = function (t) {
                            var e = t.toString(16);
                            return e.length % 2 == 1 && (e = "0" + e), e
                        }, this.bigIntToMinTwosComplementsHex = function (t) {
                            var i = t.toString(16);
                            if ("-" != i.substr(0, 1)) i.length % 2 == 1 ? i = "0" + i : i.match(/^[0-7]/) || (i = "00" + i);
                            else {
                                var n = i.substr(1),
                                    r = n.length;
                                r % 2 == 1 ? r += 1 : i.match(/^[0-7]/) || (r += 2);
                                for (var s = "", o = 0; r > o; o++) s += "f";
                                var a = new e(s, 16),
                                    h = a.xor(t).add(e.ONE);
                                i = h.toString(16).replace(/^-/, "")
                            }
                            return i
                        }, this.getPEMStringFromHex = function (t, e) {
                            var i = CryptoJS.enc.Hex.parse(t),
                                n = CryptoJS.enc.Base64.stringify(i),
                                r = n.replace(/(.{64})/g, "$1\r\n");
                            return r = r.replace(/\r\n$/, ""), "-----BEGIN " + e + "-----\r\n" + r + "\r\n-----END " + e + "-----\r\n"
                        }
                    }, KJUR.asn1.ASN1Object = function () {
                        var t = "";
                        this.getLengthHexFromValue = function () {
                            if ("undefined" == typeof this.hV || null == this.hV) throw "this.hV is null or undefined.";
                            if (this.hV.length % 2 == 1) throw "value hex must be even length: n=" + t.length + ",v=" + this.hV;
                            var e = this.hV.length / 2,
                                i = e.toString(16);
                            if (i.length % 2 == 1 && (i = "0" + i), 128 > e) return i;
                            var n = i.length / 2;
                            if (n > 15) throw "ASN.1 length too long to represent by 8x: n = " + e.toString(16);
                            var r = 128 + n;
                            return r.toString(16) + i
                        }, this.getEncodedHex = function () {
                            return (null == this.hTLV || this.isModified) && (this.hV = this.getFreshValueHex(), this.hL = this.getLengthHexFromValue(), this.hTLV = this.hT + this.hL + this.hV, this.isModified = !1), this.hTLV
                        }, this.getValueHex = function () {
                            return this.getEncodedHex(), this.hV
                        }, this.getFreshValueHex = function () {
                            return ""
                        }
                    }, KJUR.asn1.DERAbstractString = function (t) {
                        KJUR.asn1.DERAbstractString.superclass.constructor.call(this);
                        this.getString = function () {
                            return this.s
                        }, this.setString = function (t) {
                            this.hTLV = null, this.isModified = !0, this.s = t, this.hV = stohex(this.s)
                        }, this.setStringHex = function (t) {
                            this.hTLV = null, this.isModified = !0, this.s = null, this.hV = t
                        }, this.getFreshValueHex = function () {
                            return this.hV
                        }, "undefined" != typeof t && ("undefined" != typeof t.str ? this.setString(t.str) : "undefined" != typeof t.hex && this.setStringHex(t.hex))
                    }, qe.extend(KJUR.asn1.DERAbstractString, KJUR.asn1.ASN1Object), KJUR.asn1.DERAbstractTime = function (t) {
                        KJUR.asn1.DERAbstractTime.superclass.constructor.call(this);
                        this.localDateToUTC = function (t) {
                            utc = t.getTime() + 6e4 * t.getTimezoneOffset();
                            var e = new Date(utc);
                            return e
                        }, this.formatDate = function (t, e) {
                            var i = this.zeroPadding,
                                n = this.localDateToUTC(t),
                                r = String(n.getFullYear());
                            "utc" == e && (r = r.substr(2, 2));
                            var s = i(String(n.getMonth() + 1), 2),
                                o = i(String(n.getDate()), 2),
                                a = i(String(n.getHours()), 2),
                                h = i(String(n.getMinutes()), 2),
                                c = i(String(n.getSeconds()), 2);
                            return r + s + o + a + h + c + "Z"
                        }, this.zeroPadding = function (t, e) {
                            return t.length >= e ? t : new Array(e - t.length + 1).join("0") + t
                        }, this.getString = function () {
                            return this.s
                        }, this.setString = function (t) {
                            this.hTLV = null, this.isModified = !0, this.s = t, this.hV = stohex(this.s)
                        }, this.setByDateValue = function (t, e, i, n, r, s) {
                            var o = new Date(Date.UTC(t, e - 1, i, n, r, s, 0));
                            this.setByDate(o)
                        }, this.getFreshValueHex = function () {
                            return this.hV
                        }
                    }, qe.extend(KJUR.asn1.DERAbstractTime, KJUR.asn1.ASN1Object), KJUR.asn1.DERAbstractStructured = function (t) {
                        KJUR.asn1.DERAbstractString.superclass.constructor.call(this);
                        this.setByASN1ObjectArray = function (t) {
                            this.hTLV = null, this.isModified = !0, this.asn1Array = t
                        }, this.appendASN1Object = function (t) {
                            this.hTLV = null, this.isModified = !0, this.asn1Array.push(t)
                        }, this.asn1Array = new Array, "undefined" != typeof t && "undefined" != typeof t.array && (this.asn1Array = t.array)
                    }, qe.extend(KJUR.asn1.DERAbstractStructured, KJUR.asn1.ASN1Object), KJUR.asn1.DERBoolean = function () {
                        KJUR.asn1.DERBoolean.superclass.constructor.call(this), this.hT = "01", this.hTLV = "0101ff"
                    }, qe.extend(KJUR.asn1.DERBoolean, KJUR.asn1.ASN1Object), KJUR.asn1.DERInteger = function (t) {
                        KJUR.asn1.DERInteger.superclass.constructor.call(this), this.hT = "02", this.setByBigInteger = function (t) {
                            this.hTLV = null, this.isModified = !0, this.hV = KJUR.asn1.ASN1Util.bigIntToMinTwosComplementsHex(t)
                        }, this.setByInteger = function (t) {
                            var i = new e(String(t), 10);
                            this.setByBigInteger(i)
                        }, this.setValueHex = function (t) {
                            this.hV = t
                        }, this.getFreshValueHex = function () {
                            return this.hV
                        }, "undefined" != typeof t && ("undefined" != typeof t.bigint ? this.setByBigInteger(t.bigint) : "undefined" != typeof t["int"] ? this.setByInteger(t["int"]) : "undefined" != typeof t.hex && this.setValueHex(t.hex))
                    }, qe.extend(KJUR.asn1.DERInteger, KJUR.asn1.ASN1Object), KJUR.asn1.DERBitString = function (t) {
                        KJUR.asn1.DERBitString.superclass.constructor.call(this), this.hT = "03", this.setHexValueIncludingUnusedBits = function (t) {
                            this.hTLV = null, this.isModified = !0, this.hV = t
                        }, this.setUnusedBitsAndHexValue = function (t, e) {
                            if (0 > t || t > 7) throw "unused bits shall be from 0 to 7: u = " + t;
                            var i = "0" + t;
                            this.hTLV = null, this.isModified = !0, this.hV = i + e
                        }, this.setByBinaryString = function (t) {
                            t = t.replace(/0+$/, "");
                            var e = 8 - t.length % 8;
                            8 == e && (e = 0);
                            for (var i = 0; e >= i; i++) t += "0";
                            for (var n = "", i = 0; i < t.length - 1; i += 8) {
                                var r = t.substr(i, 8),
                                    s = parseInt(r, 2).toString(16);
                                1 == s.length && (s = "0" + s), n += s
                            }
                            this.hTLV = null, this.isModified = !0, this.hV = "0" + e + n
                        }, this.setByBooleanArray = function (t) {
                            for (var e = "", i = 0; i < t.length; i++) e += 1 == t[i] ? "1" : "0";
                            this.setByBinaryString(e)
                        }, this.newFalseArray = function (t) {
                            for (var e = new Array(t), i = 0; t > i; i++) e[i] = !1;
                            return e
                        }, this.getFreshValueHex = function () {
                            return this.hV
                        }, "undefined" != typeof t && ("undefined" != typeof t.hex ? this.setHexValueIncludingUnusedBits(t.hex) : "undefined" != typeof t.bin ? this.setByBinaryString(t.bin) : "undefined" != typeof t.array && this.setByBooleanArray(t.array))
                    }, qe.extend(KJUR.asn1.DERBitString, KJUR.asn1.ASN1Object), KJUR.asn1.DEROctetString = function (t) {
                        KJUR.asn1.DEROctetString.superclass.constructor.call(this, t), this.hT = "04"
                    }, qe.extend(KJUR.asn1.DEROctetString, KJUR.asn1.DERAbstractString), KJUR.asn1.DERNull = function () {
                        KJUR.asn1.DERNull.superclass.constructor.call(this), this.hT = "05", this.hTLV = "0500"
                    }, qe.extend(KJUR.asn1.DERNull, KJUR.asn1.ASN1Object), KJUR.asn1.DERObjectIdentifier = function (t) {
                        var i = function (t) {
                                var e = t.toString(16);
                                return 1 == e.length && (e = "0" + e), e
                            },
                            n = function (t) {
                                var n = "",
                                    r = new e(t, 10),
                                    s = r.toString(2),
                                    o = 7 - s.length % 7;
                                7 == o && (o = 0);
                                for (var a = "", h = 0; o > h; h++) a += "0";
                                s = a + s;
                                for (var h = 0; h < s.length - 1; h += 7) {
                                    var c = s.substr(h, 7);
                                    h != s.length - 7 && (c = "1" + c), n += i(parseInt(c, 2))
                                }
                                return n
                            };
                        KJUR.asn1.DERObjectIdentifier.superclass.constructor.call(this), this.hT = "06", this.setValueHex = function (t) {
                            this.hTLV = null, this.isModified = !0, this.s = null, this.hV = t
                        }, this.setValueOidString = function (t) {
                            if (!t.match(/^[0-9.]+$/)) throw "malformed oid string: " + t;
                            var e = "",
                                r = t.split("."),
                                s = 40 * parseInt(r[0]) + parseInt(r[1]);
                            e += i(s), r.splice(0, 2);
                            for (var o = 0; o < r.length; o++) e += n(r[o]);
                            this.hTLV = null, this.isModified = !0, this.s = null, this.hV = e
                        }, this.setValueName = function (t) {
                            if ("undefined" == typeof KJUR.asn1.x509.OID.name2oidList[t]) throw "DERObjectIdentifier oidName undefined: " + t;
                            var e = KJUR.asn1.x509.OID.name2oidList[t];
                            this.setValueOidString(e)
                        }, this.getFreshValueHex = function () {
                            return this.hV
                        }, "undefined" != typeof t && ("undefined" != typeof t.oid ? this.setValueOidString(t.oid) : "undefined" != typeof t.hex ? this.setValueHex(t.hex) : "undefined" != typeof t.name && this.setValueName(t.name))
                    }, qe.extend(KJUR.asn1.DERObjectIdentifier, KJUR.asn1.ASN1Object), KJUR.asn1.DERUTF8String = function (t) {
                        KJUR.asn1.DERUTF8String.superclass.constructor.call(this, t), this.hT = "0c"
                    }, qe.extend(KJUR.asn1.DERUTF8String, KJUR.asn1.DERAbstractString), KJUR.asn1.DERNumericString = function (t) {
                        KJUR.asn1.DERNumericString.superclass.constructor.call(this, t), this.hT = "12"
                    }, qe.extend(KJUR.asn1.DERNumericString, KJUR.asn1.DERAbstractString), KJUR.asn1.DERPrintableString = function (t) {
                        KJUR.asn1.DERPrintableString.superclass.constructor.call(this, t), this.hT = "13"
                    }, qe.extend(KJUR.asn1.DERPrintableString, KJUR.asn1.DERAbstractString), KJUR.asn1.DERTeletexString = function (t) {
                        KJUR.asn1.DERTeletexString.superclass.constructor.call(this, t), this.hT = "14"
                    }, qe.extend(KJUR.asn1.DERTeletexString, KJUR.asn1.DERAbstractString), KJUR.asn1.DERIA5String = function (t) {
                        KJUR.asn1.DERIA5String.superclass.constructor.call(this, t), this.hT = "16"
                    }, qe.extend(KJUR.asn1.DERIA5String, KJUR.asn1.DERAbstractString), KJUR.asn1.DERUTCTime = function (t) {
                        KJUR.asn1.DERUTCTime.superclass.constructor.call(this, t), this.hT = "17", this.setByDate = function (t) {
                            this.hTLV = null, this.isModified = !0, this.date = t, this.s = this.formatDate(this.date, "utc"), this.hV = stohex(this.s)
                        }, "undefined" != typeof t && ("undefined" != typeof t.str ? this.setString(t.str) : "undefined" != typeof t.hex ? this.setStringHex(t.hex) : "undefined" != typeof t.date && this.setByDate(t.date))
                    }, qe.extend(KJUR.asn1.DERUTCTime, KJUR.asn1.DERAbstractTime), KJUR.asn1.DERGeneralizedTime = function (t) {
                        KJUR.asn1.DERGeneralizedTime.superclass.constructor.call(this, t), this.hT = "18", this.setByDate = function (t) {
                            this.hTLV = null, this.isModified = !0, this.date = t, this.s = this.formatDate(this.date, "gen"), this.hV = stohex(this.s)
                        }, "undefined" != typeof t && ("undefined" != typeof t.str ? this.setString(t.str) : "undefined" != typeof t.hex ? this.setStringHex(t.hex) : "undefined" != typeof t.date && this.setByDate(t.date))
                    }, qe.extend(KJUR.asn1.DERGeneralizedTime, KJUR.asn1.DERAbstractTime), KJUR.asn1.DERSequence = function (t) {
                        KJUR.asn1.DERSequence.superclass.constructor.call(this, t), this.hT = "30", this.getFreshValueHex = function () {
                            for (var t = "", e = 0; e < this.asn1Array.length; e++) {
                                var i = this.asn1Array[e];
                                t += i.getEncodedHex()
                            }
                            return this.hV = t, this.hV
                        }
                    }, qe.extend(KJUR.asn1.DERSequence, KJUR.asn1.DERAbstractStructured), KJUR.asn1.DERSet = function (t) {
                        KJUR.asn1.DERSet.superclass.constructor.call(this, t), this.hT = "31", this.getFreshValueHex = function () {
                            for (var t = new Array, e = 0; e < this.asn1Array.length; e++) {
                                var i = this.asn1Array[e];
                                t.push(i.getEncodedHex())
                            }
                            return t.sort(), this.hV = t.join(""), this.hV
                        }
                    }, qe.extend(KJUR.asn1.DERSet, KJUR.asn1.DERAbstractStructured), KJUR.asn1.DERTaggedObject = function (t) {
                        KJUR.asn1.DERTaggedObject.superclass.constructor.call(this), this.hT = "a0", this.hV = "", this.isExplicit = !0, this.asn1Object = null, this.setASN1Object = function (t, e, i) {
                            this.hT = e, this.isExplicit = t, this.asn1Object = i, this.isExplicit ? (this.hV = this.asn1Object.getEncodedHex(), this.hTLV = null, this.isModified = !0) : (this.hV = null, this.hTLV = i.getEncodedHex(), this.hTLV = this.hTLV.replace(/^../, e), this.isModified = !1)
                        }, this.getFreshValueHex = function () {
                            return this.hV
                        }, "undefined" != typeof t && ("undefined" != typeof t.tag && (this.hT = t.tag), "undefined" != typeof t.explicit && (this.isExplicit = t.explicit), "undefined" != typeof t.obj && (this.asn1Object = t.obj, this.setASN1Object(this.isExplicit, this.hT, this.asn1Object)))
                    }, qe.extend(KJUR.asn1.DERTaggedObject, KJUR.asn1.ASN1Object),
                    function (t) {
                        var e, i = {};
                        i.decode = function (i) {
                            var n;
                            if (e === t) {
                                var r = "0123456789ABCDEF",
                                    s = " \f\n\r	 \u2028\u2029";
                                for (e = [], n = 0; 16 > n; ++n) e[r.charAt(n)] = n;
                                for (r = r.toLowerCase(), n = 10; 16 > n; ++n) e[r.charAt(n)] = n;
                                for (n = 0; n < s.length; ++n) e[s.charAt(n)] = -1
                            }
                            var o = [],
                                a = 0,
                                h = 0;
                            for (n = 0; n < i.length; ++n) {
                                var c = i.charAt(n);
                                if ("=" == c) break;
                                if (c = e[c], -1 != c) {
                                    if (c === t) throw "Illegal character at offset " + n;
                                    a |= c, ++h >= 2 ? (o[o.length] = a, a = 0, h = 0) : a <<= 4
                                }
                            }
                            if (h) throw "Hex encoding incomplete: 4 bits missing";
                            return o
                        }, window.Hex = i
                    }(),
                    function (t) {
                        var e, i = {};
                        i.decode = function (i) {
                            var n;
                            if (e === t) {
                                var r = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
                                    s = "= \f\n\r	 \u2028\u2029";
                                for (e = [], n = 0; 64 > n; ++n) e[r.charAt(n)] = n;
                                for (n = 0; n < s.length; ++n) e[s.charAt(n)] = -1
                            }
                            var o = [],
                                a = 0,
                                h = 0;
                            for (n = 0; n < i.length; ++n) {
                                var c = i.charAt(n);
                                if ("=" == c) break;
                                if (c = e[c], -1 != c) {
                                    if (c === t) throw "Illegal character at offset " + n;
                                    a |= c, ++h >= 4 ? (o[o.length] = a >> 16, o[o.length] = a >> 8 & 255, o[o.length] = 255 & a, a = 0, h = 0) : a <<= 6
                                }
                            }
                            switch (h) {
                            case 1:
                                throw "Base64 encoding incomplete: at least 2 bits missing";
                            case 2:
                                o[o.length] = a >> 10;
                                break;
                            case 3:
                                o[o.length] = a >> 16, o[o.length] = a >> 8 & 255
                            }
                            return o
                        }, i.re = /-----BEGIN [^-]+-----([A-Za-z0-9+\/=\s]+)-----END [^-]+-----|begin-base64[^\n]+\n([A-Za-z0-9+\/=\s]+)====/, i.unarmor = function (t) {
                            var e = i.re.exec(t);
                            if (e)
                                if (e[1]) t = e[1];
                                else {
                                    if (!e[2]) throw "RegExp out of sync";
                                    t = e[2]
                                }
                            return i.decode(t)
                        }, window.Base64 = i
                    }(),
                    function (t) {
                        function e(t, i) {
                            t instanceof e ? (this.enc = t.enc, this.pos = t.pos) : (this.enc = t, this.pos = i)
                        }

                        function n(t, e, i, n, r) {
                            this.stream = t, this.header = e, this.length = i, this.tag = n, this.sub = r
                        }
                        var r = 100,
                            s = "…",
                            o = {
                                tag: function (t, e) {
                                    var i = document.createElement(t);
                                    return i.className = e,
                                        i
                                }, text: function (t) {
                                    return document.createTextNode(t)
                                }
                            };
                        e.prototype.get = function (e) {
                            if (e === t && (e = this.pos++), e >= this.enc.length) throw "Requesting byte offset " + e + " on a stream of length " + this.enc.length;
                            return this.enc[e]
                        }, e.prototype.hexDigits = "0123456789ABCDEF", e.prototype.hexByte = function (t) {
                            return this.hexDigits.charAt(t >> 4 & 15) + this.hexDigits.charAt(15 & t)
                        }, e.prototype.hexDump = function (t, e, i) {
                            for (var n = "", r = t; e > r; ++r)
                                if (n += this.hexByte(this.get(r)), i !== !0) switch (15 & r) {
                                case 7:
                                    n += "  ";
                                    break;
                                case 15:
                                    n += "\n";
                                    break;
                                default:
                                    n += " "
                                }
                                return n
                        }, e.prototype.parseStringISO = function (t, e) {
                            for (var i = "", n = t; e > n; ++n) i += String.fromCharCode(this.get(n));
                            return i
                        }, e.prototype.parseStringUTF = function (t, e) {
                            for (var i = "", n = t; e > n;) {
                                var r = this.get(n++);
                                i += 128 > r ? String.fromCharCode(r) : r > 191 && 224 > r ? String.fromCharCode((31 & r) << 6 | 63 & this.get(n++)) : String.fromCharCode((15 & r) << 12 | (63 & this.get(n++)) << 6 | 63 & this.get(n++))
                            }
                            return i
                        }, e.prototype.parseStringBMP = function (t, e) {
                            for (var i = "", n = t; e > n; n += 2) {
                                var r = this.get(n),
                                    s = this.get(n + 1);
                                i += String.fromCharCode((r << 8) + s)
                            }
                            return i
                        }, e.prototype.reTime = /^((?:1[89]|2\d)?\d\d)(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])([01]\d|2[0-3])(?:([0-5]\d)(?:([0-5]\d)(?:[.,](\d{1,3}))?)?)?(Z|[-+](?:[0]\d|1[0-2])([0-5]\d)?)?$/, e.prototype.parseTime = function (t, e) {
                            var i = this.parseStringISO(t, e),
                                n = this.reTime.exec(i);
                            return n ? (i = n[1] + "-" + n[2] + "-" + n[3] + " " + n[4], n[5] && (i += ":" + n[5], n[6] && (i += ":" + n[6], n[7] && (i += "." + n[7]))), n[8] && (i += " UTC", "Z" != n[8] && (i += n[8], n[9] && (i += ":" + n[9]))), i) : "Unrecognized time: " + i
                        }, e.prototype.parseInteger = function (t, e) {
                            var i = e - t;
                            if (i > 4) {
                                i <<= 3;
                                var n = this.get(t);
                                if (0 === n) i -= 8;
                                else
                                    for (; 128 > n;) n <<= 1, --i;
                                return "(" + i + " bit)"
                            }
                            for (var r = 0, s = t; e > s; ++s) r = r << 8 | this.get(s);
                            return r
                        }, e.prototype.parseBitString = function (t, e) {
                            var i = this.get(t),
                                n = (e - t - 1 << 3) - i,
                                r = "(" + n + " bit)";
                            if (20 >= n) {
                                var s = i;
                                r += " ";
                                for (var o = e - 1; o > t; --o) {
                                    for (var a = this.get(o), h = s; 8 > h; ++h) r += a >> h & 1 ? "1" : "0";
                                    s = 0
                                }
                            }
                            return r
                        }, e.prototype.parseOctetString = function (t, e) {
                            var i = e - t,
                                n = "(" + i + " byte) ";
                            i > r && (e = t + r);
                            for (var o = t; e > o; ++o) n += this.hexByte(this.get(o));
                            return i > r && (n += s), n
                        }, e.prototype.parseOID = function (t, e) {
                            for (var i = "", n = 0, r = 0, s = t; e > s; ++s) {
                                var o = this.get(s);
                                if (n = n << 7 | 127 & o, r += 7, !(128 & o)) {
                                    if ("" === i) {
                                        var a = 80 > n ? 40 > n ? 0 : 1 : 2;
                                        i = a + "." + (n - 40 * a)
                                    } else i += "." + (r >= 31 ? "bigint" : n);
                                    n = r = 0
                                }
                            }
                            return i
                        }, n.prototype.typeName = function () {
                            if (this.tag === t) return "unknown";
                            var e = this.tag >> 6,
                                i = (this.tag >> 5 & 1, 31 & this.tag);
                            switch (e) {
                            case 0:
                                switch (i) {
                                case 0:
                                    return "EOC";
                                case 1:
                                    return "BOOLEAN";
                                case 2:
                                    return "INTEGER";
                                case 3:
                                    return "BIT_STRING";
                                case 4:
                                    return "OCTET_STRING";
                                case 5:
                                    return "NULL";
                                case 6:
                                    return "OBJECT_IDENTIFIER";
                                case 7:
                                    return "ObjectDescriptor";
                                case 8:
                                    return "EXTERNAL";
                                case 9:
                                    return "REAL";
                                case 10:
                                    return "ENUMERATED";
                                case 11:
                                    return "EMBEDDED_PDV";
                                case 12:
                                    return "UTF8String";
                                case 16:
                                    return "SEQUENCE";
                                case 17:
                                    return "SET";
                                case 18:
                                    return "NumericString";
                                case 19:
                                    return "PrintableString";
                                case 20:
                                    return "TeletexString";
                                case 21:
                                    return "VideotexString";
                                case 22:
                                    return "IA5String";
                                case 23:
                                    return "UTCTime";
                                case 24:
                                    return "GeneralizedTime";
                                case 25:
                                    return "GraphicString";
                                case 26:
                                    return "VisibleString";
                                case 27:
                                    return "GeneralString";
                                case 28:
                                    return "UniversalString";
                                case 30:
                                    return "BMPString";
                                default:
                                    return "Universal_" + i.toString(16)
                                }
                            case 1:
                                return "Application_" + i.toString(16);
                            case 2:
                                return "[" + i + "]";
                            case 3:
                                return "Private_" + i.toString(16)
                            }
                        }, n.prototype.reSeemsASCII = /^[ -~]+$/, n.prototype.content = function () {
                            if (this.tag === t) return null;
                            var e = this.tag >> 6,
                                i = 31 & this.tag,
                                n = this.posContent(),
                                o = Math.abs(this.length);
                            if (0 !== e) {
                                if (null !== this.sub) return "(" + this.sub.length + " elem)";
                                var a = this.stream.parseStringISO(n, n + Math.min(o, r));
                                return this.reSeemsASCII.test(a) ? a.substring(0, 2 * r) + (a.length > 2 * r ? s : "") : this.stream.parseOctetString(n, n + o)
                            }
                            switch (i) {
                            case 1:
                                return 0 === this.stream.get(n) ? "false" : "true";
                            case 2:
                                return this.stream.parseInteger(n, n + o);
                            case 3:
                                return this.sub ? "(" + this.sub.length + " elem)" : this.stream.parseBitString(n, n + o);
                            case 4:
                                return this.sub ? "(" + this.sub.length + " elem)" : this.stream.parseOctetString(n, n + o);
                            case 6:
                                return this.stream.parseOID(n, n + o);
                            case 16:
                            case 17:
                                return "(" + this.sub.length + " elem)";
                            case 12:
                                return this.stream.parseStringUTF(n, n + o);
                            case 18:
                            case 19:
                            case 20:
                            case 21:
                            case 22:
                            case 26:
                                return this.stream.parseStringISO(n, n + o);
                            case 30:
                                return this.stream.parseStringBMP(n, n + o);
                            case 23:
                            case 24:
                                return this.stream.parseTime(n, n + o)
                            }
                            return null
                        }, n.prototype.toString = function () {
                            return this.typeName() + "@" + this.stream.pos + "[header:" + this.header + ",length:" + this.length + ",sub:" + (null === this.sub ? "null" : this.sub.length) + "]"
                        }, n.prototype.print = function (e) {
                            if (e === t && (e = ""), document.writeln(e + this), null !== this.sub) {
                                e += "  ";
                                for (var i = 0, n = this.sub.length; n > i; ++i) this.sub[i].print(e)
                            }
                        }, n.prototype.toPrettyString = function (e) {
                            e === t && (e = "");
                            var i = e + this.typeName() + " @" + this.stream.pos;
                            if (this.length >= 0 && (i += "+"), i += this.length, 32 & this.tag ? i += " (constructed)" : 3 != this.tag && 4 != this.tag || null === this.sub || (i += " (encapsulates)"), i += "\n", null !== this.sub) {
                                e += "  ";
                                for (var n = 0, r = this.sub.length; r > n; ++n) i += this.sub[n].toPrettyString(e)
                            }
                            return i
                        }, n.prototype.toDOM = function () {
                            var t = o.tag("div", "node");
                            t.asn1 = this;
                            var e = o.tag("div", "head"),
                                n = this.typeName().replace(/_/g, " ");
                            e.innerHTML = n;
                            var r = this.content();
                            if (null !== r) {
                                r = String(r).replace(/</g, "&lt;");
                                var s = o.tag("span", "preview");
                                s.appendChild(o.text(r)), e.appendChild(s)
                            }
                            t.appendChild(e), this.node = t, this.head = e;
                            var a = o.tag("div", "value");
                            if (n = "Offset: " + this.stream.pos + "<br/>", n += "Length: " + this.header + "+", n += this.length >= 0 ? this.length : -this.length + " (undefined)", 32 & this.tag ? n += "<br/>(constructed)" : 3 != this.tag && 4 != this.tag || null === this.sub || (n += "<br/>(encapsulates)"), null !== r && (n += "<br/>Value:<br/><b>" + r + "</b>", "object" === ("undefined" == typeof oids ? "undefined" : i(oids)) && 6 == this.tag)) {
                                var h = oids[r];
                                h && (h.d && (n += "<br/>" + h.d), h.c && (n += "<br/>" + h.c), h.w && (n += "<br/>(warning!)"))
                            }
                            a.innerHTML = n, t.appendChild(a);
                            var c = o.tag("div", "sub");
                            if (null !== this.sub)
                                for (var u = 0, l = this.sub.length; l > u; ++u) c.appendChild(this.sub[u].toDOM());
                            return t.appendChild(c), e.onclick = function () {
                                t.className = "node collapsed" == t.className ? "node" : "node collapsed"
                            }, t
                        }, n.prototype.posStart = function () {
                            return this.stream.pos
                        }, n.prototype.posContent = function () {
                            return this.stream.pos + this.header
                        }, n.prototype.posEnd = function () {
                            return this.stream.pos + this.header + Math.abs(this.length)
                        }, n.prototype.fakeHover = function (t) {
                            this.node.className += " hover", t && (this.head.className += " hover")
                        }, n.prototype.fakeOut = function (t) {
                            var e = / ?hover/;
                            this.node.className = this.node.className.replace(e, ""), t && (this.head.className = this.head.className.replace(e, ""))
                        }, n.prototype.toHexDOM_sub = function (t, e, i, n, r) {
                            if (!(n >= r)) {
                                var s = o.tag("span", e);
                                s.appendChild(o.text(i.hexDump(n, r))), t.appendChild(s)
                            }
                        }, n.prototype.toHexDOM = function (e) {
                            var i = o.tag("span", "hex");
                            if (e === t && (e = i), this.head.hexNode = i, this.head.onmouseover = function () {
                                this.hexNode.className = "hexCurrent"
                            }, this.head.onmouseout = function () {
                                this.hexNode.className = "hex"
                            }, i.asn1 = this, i.onmouseover = function () {
                                var t = !e.selected;
                                t && (e.selected = this.asn1, this.className = "hexCurrent"), this.asn1.fakeHover(t)
                            }, i.onmouseout = function () {
                                var t = e.selected == this.asn1;
                                this.asn1.fakeOut(t), t && (e.selected = null, this.className = "hex")
                            }, this.toHexDOM_sub(i, "tag", this.stream, this.posStart(), this.posStart() + 1), this.toHexDOM_sub(i, this.length >= 0 ? "dlen" : "ulen", this.stream, this.posStart() + 1, this.posContent()), null === this.sub) i.appendChild(o.text(this.stream.hexDump(this.posContent(), this.posEnd())));
                            else if (this.sub.length > 0) {
                                var n = this.sub[0],
                                    r = this.sub[this.sub.length - 1];
                                this.toHexDOM_sub(i, "intro", this.stream, this.posContent(), n.posStart());
                                for (var s = 0, a = this.sub.length; a > s; ++s) i.appendChild(this.sub[s].toHexDOM(e));
                                this.toHexDOM_sub(i, "outro", this.stream, r.posEnd(), this.posEnd())
                            }
                            return i
                        }, n.prototype.toHexString = function (t) {
                            return this.stream.hexDump(this.posStart(), this.posEnd(), !0)
                        }, n.decodeLength = function (t) {
                            var e = t.get(),
                                i = 127 & e;
                            if (i == e) return i;
                            if (i > 3) throw "Length over 24 bits not supported at position " + (t.pos - 1);
                            if (0 === i) return -1;
                            e = 0;
                            for (var n = 0; i > n; ++n) e = e << 8 | t.get();
                            return e
                        }, n.hasContent = function (t, i, r) {
                            if (32 & t) return !0;
                            if (3 > t || t > 4) return !1;
                            var s = new e(r);
                            3 == t && s.get();
                            var o = s.get();
                            if (o >> 6 & 1) return !1;
                            try {
                                var a = n.decodeLength(s);
                                return s.pos - r.pos + a == i
                            } catch (h) {
                                return !1
                            }
                        }, n.decode = function (t) {
                            t instanceof e || (t = new e(t, 0));
                            var i = new e(t),
                                r = t.get(),
                                s = n.decodeLength(t),
                                o = t.pos - i.pos,
                                a = null;
                            if (n.hasContent(r, s, t)) {
                                var h = t.pos;
                                if (3 == r && t.get(), a = [], s >= 0) {
                                    for (var c = h + s; t.pos < c;) a[a.length] = n.decode(t);
                                    if (t.pos != c) throw "Content size is not correct for container starting at offset " + h
                                } else try {
                                    for (;;) {
                                        var u = n.decode(t);
                                        if (0 === u.tag) break;
                                        a[a.length] = u
                                    }
                                    s = h - t.pos
                                } catch (l) {
                                    throw "Exception while decoding undefined length content: " + l
                                }
                            } else t.pos += s;
                            return new n(i, o, s, r, a)
                        }, n.test = function () {
                            for (var t = [{
                                value: [39],
                                expected: 39
                            }, {
                                value: [129, 201],
                                expected: 201
                            }, {
                                value: [131, 254, 220, 186],
                                expected: 16702650
                            }], i = 0, r = t.length; r > i; ++i) {
                                var s = new e(t[i].value, 0),
                                    o = n.decodeLength(s);
                                o != t[i].expected && document.write("In test[" + i + "] expected " + t[i].expected + " got " + o + "\n")
                            }
                        }, window.ASN1 = n
                    }(), ASN1.prototype.getHexStringValue = function () {
                        var t = this.toHexString(),
                            e = 2 * this.header,
                            i = 2 * this.length;
                        return t.substr(e, i)
                    }, ue.prototype.parseKey = function (t) {
                        try {
                            var e = 0,
                                i = 0,
                                n = /^\s*(?:[0-9A-Fa-f][0-9A-Fa-f]\s*)+$/,
                                r = n.test(t) ? Hex.decode(t) : Base64.unarmor(t),
                                s = ASN1.decode(r);
                            if (9 === s.sub.length) {
                                e = s.sub[1].getHexStringValue(), this.n = he(e, 16), i = s.sub[2].getHexStringValue(), this.e = parseInt(i, 16);
                                var o = s.sub[3].getHexStringValue();
                                this.d = he(o, 16);
                                var a = s.sub[4].getHexStringValue();
                                this.p = he(a, 16);
                                var h = s.sub[5].getHexStringValue();
                                this.q = he(h, 16);
                                var c = s.sub[6].getHexStringValue();
                                this.dmp1 = he(c, 16);
                                var u = s.sub[7].getHexStringValue();
                                this.dmq1 = he(u, 16);
                                var l = s.sub[8].getHexStringValue();
                                this.coeff = he(l, 16)
                            } else {
                                if (2 !== s.sub.length) return !1;
                                var f = s.sub[1],
                                    p = f.sub[0];
                                e = p.sub[0].getHexStringValue(), this.n = he(e, 16), i = p.sub[1].getHexStringValue(), this.e = parseInt(i, 16)
                            }
                            return !0
                        } catch (d) {
                            return !1
                        }
                    }, ue.prototype.getPrivateBaseKey = function () {
                        var t = {
                                array: [new KJUR.asn1.DERInteger({
                                    "int": 0
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.n
                                }), new KJUR.asn1.DERInteger({
                                    "int": this.e
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.d
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.p
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.q
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.dmp1
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.dmq1
                                }), new KJUR.asn1.DERInteger({
                                    bigint: this.coeff
                                })]
                            },
                            e = new KJUR.asn1.DERSequence(t);
                        return e.getEncodedHex()
                    }, ue.prototype.getPrivateBaseKeyB64 = function () {
                        return Te(this.getPrivateBaseKey())
                    }, ue.prototype.getPublicBaseKey = function () {
                        var t = {
                                array: [new KJUR.asn1.DERObjectIdentifier({
                                    oid: "1.2.840.113549.1.1.1"
                                }), new KJUR.asn1.DERNull]
                            },
                            e = new KJUR.asn1.DERSequence(t);
                        t = {
                            array: [new KJUR.asn1.DERInteger({
                                bigint: this.n
                            }), new KJUR.asn1.DERInteger({
                                "int": this.e
                            })]
                        };
                        var i = new KJUR.asn1.DERSequence(t);
                        t = {
                            hex: "00" + i.getEncodedHex()
                        };
                        var n = new KJUR.asn1.DERBitString(t);
                        t = {
                            array: [e, n]
                        };
                        var r = new KJUR.asn1.DERSequence(t);
                        return r.getEncodedHex()
                    }, ue.prototype.getPublicBaseKeyB64 = function () {
                        return Te(this.getPublicBaseKey())
                    }, ue.prototype.wordwrap = function (t, e) {
                        if (e = e || 64, !t) return t;
                        var i = "(.{1," + e + "})( +|$\n?)|(.{1," + e + "})";
                        return t.match(RegExp(i, "g")).join("\n")
                    }, ue.prototype.getPrivateKey = function () {
                        var t = "-----BEGIN RSA PRIVATE KEY-----\n";
                        return t += this.wordwrap(this.getPrivateBaseKeyB64()) + "\n", t += "-----END RSA PRIVATE KEY-----"
                    }, ue.prototype.getPublicKey = function () {
                        var t = "-----BEGIN PUBLIC KEY-----\n";
                        return t += this.wordwrap(this.getPublicBaseKeyB64()) + "\n", t += "-----END PUBLIC KEY-----"
                    }, ue.prototype.hasPublicKeyProperty = function (t) {
                        return t = t || {}, t.hasOwnProperty("n") && t.hasOwnProperty("e")
                    }, ue.prototype.hasPrivateKeyProperty = function (t) {
                        return t = t || {}, t.hasOwnProperty("n") && t.hasOwnProperty("e") && t.hasOwnProperty("d") && t.hasOwnProperty("p") && t.hasOwnProperty("q") && t.hasOwnProperty("dmp1") && t.hasOwnProperty("dmq1") && t.hasOwnProperty("coeff")
                    }, ue.prototype.parsePropertiesFrom = function (t) {
                        this.n = t.n, this.e = t.e, t.hasOwnProperty("d") && (this.d = t.d, this.p = t.p, this.q = t.q, this.dmp1 = t.dmp1, this.dmq1 = t.dmq1, this.coeff = t.coeff)
                    };
                var Ge = function (t) {
                    ue.call(this), t && ("string" == typeof t ? this.parseKey(t) : (this.hasPrivateKeyProperty(t) || this.hasPublicKeyProperty(t)) && this.parsePropertiesFrom(t))
                };
                Ge.prototype = new ue, Ge.prototype.constructor = Ge;
                var $e = function (t) {
                    t = t || {}, this.default_key_size = parseInt(t.default_key_size) || 1024, this.default_public_exponent = t.default_public_exponent || "010001", this.log = t.log || !1, this.key = null
                };
                $e.prototype.setKey = function (t) {
                    this.log && this.key && console.warn("A key was already set, overriding existing."), this.key = new Ge(t)
                }, $e.prototype.setPrivateKey = function (t) {
                    this.setKey(t)
                }, $e.prototype.setPublicKey = function (t) {
                    this.setKey(t)
                }, $e.prototype.decrypt = function (t) {
                    try {
                        return this.getKey().decrypt(xe(t))
                    } catch (e) {
                        return !1
                    }
                }, $e.prototype.encrypt = function (t) {
                    try {
                        return Te(this.getKey().encrypt(t))
                    } catch (e) {
                        return !1
                    }
                }, $e.prototype.getKey = function (t) {
                    if (!this.key) {
                        if (this.key = new Ge, t && "[object Function]" === {}.toString.call(t)) return void this.key.generateAsync(this.default_key_size, this.default_public_exponent, t);
                        this.key.generate(this.default_key_size, this.default_public_exponent)
                    }
                    return this.key
                }, $e.prototype.getPrivateKey = function () {
                    return this.getKey().getPrivateKey()
                }, $e.prototype.getPrivateKeyB64 = function () {
                    return this.getKey().getPrivateBaseKeyB64()
                }, $e.prototype.getPublicKey = function () {
                    return this.getKey().getPublicKey()
                }, $e.prototype.getPublicKeyB64 = function () {
                    return this.getKey().getPublicBaseKeyB64()
                }, t.JSEncrypt = $e
            }(n);
            var r = n.JSEncrypt;
            window.JSEncrypt = r
        },
        function (t, e) {
            t.exports = '<div class="login_box clearfix">\n  <p class="error_tip">请输入密码！</p>\n  <div class="lg_form">\n      <ul class="mod_box lo_mod_box" data-isshow="0">\n          <li class="login_title">\n              <a class="fr eb_mod" href="javascript:;">手机动态密码登录</a>\n              <b>普通登录</b>\n          </li>\n          <li class="lg_item lg_name">\n              <b class="lg_icon"></b>\n              <input type="text" maxlength="32" class="text r3" name="uname" def-v="手机/邮箱/昵称" value="手机/邮箱/昵称" style="border-color: rgb(20 20 207); color:#ccc;">\n          </li>\n          <li class="lg_item u_passwd">\n              <b class="lg_icon"></b>\n              <input type="password" name="pass" class="text">\n          </li>\n      </ul>\n      <ul class="mod_box eb_mod_box" data-isshow="0">\n          <li class="login_title">\n              <a class="fr lo_mod" href="javascript:;">普通登录</a>\n              <b>手机动态密码登录</b>\n          </li>\n          <li class="lg_item lg_name">\n              <b class="lg_icon"></b>\n              <input type="text" maxlength="32" class="text r3" name="uname" def-v="手机" value="手机" style="border-color: rgb(20 20 207); color:#ccc;">\n          </li>\n          <li class="lg_item lg_code">\n              <b class="lg_icon"></b>\n              <input type="text" maxlength="32" class="text r3" name="telcode" def-v="动态密码" value="动态密码" style="border-color: rgb(20 20 207); color:#ccc;">\n          </li>\n          <li class="lg_chk"></li>\n          <li class="lg_item lg_getcode">\n              <a href="javascript:;" class="get_tel_code" id="get_tel_code" send-method="nologin" tel-input-id="uname" ready-text="获取手机动态密码" wait-text="重新获取动态密码">获取手机动态密码</a>\n          </li>\n      </ul>\n      <div class="lg_remember"><input type="checkbox" name="remember" class="checkbox" checked=""> 记住我（两周免登录）</div>\n      <div class="lg_login">\n          <input type="button" value="" class="sub">\n          <input type="hidden" value="" id="imgcheckvalue">\n          <input type="hidden" value="" id="imgcheckcode">\n          <a class="ml10" href="https://account.meilishuo.com/user/findPwd" target="_blank">忘记密码？</a>\n          <a href="https://account.meilishuo.com/user/register">新用户注册</a>\n      </div>\n  </div>\n  <div class="login_other">\n      <span>其他登录方式</span>\n      <a href="javascript:;" class="ui-ot-btn login_qq" data-type="qq"></a>\n      <a href="javascript:;" class="ui-ot-btn login_wb" data-type="sina"></a>\n      <a href="javascript:;" class="ui-ot-btn login_wx" data-type="weixin"></a>\n  </div>\n</div>\n'
        }
    ])
}), "function" == typeof define && define.amd && require(["mls-pc/common/login/index"]);
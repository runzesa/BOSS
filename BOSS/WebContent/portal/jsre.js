var _JSVM_Namespace = {
    "deviceNumber": 0x3116,
    "runtimeEnvironment": new function(){
        this.currentVersion = "2.05.061114";
        this.navigator = "unknow";
        this.jsvmHome = ".";
        this.mode = "standalone";
        this.classpath = "";
        this.debug = false;
        this.window = window;
        this.element = null;
        this.parent = null;
        this.JSVM = null;
        this.resources = {};
        this.extModules = [];
        this.state = 1;
        this.config = {
            "getParameter": function(){
            }
        };
        this.isAlive = function(){
            return (!this.window.closed);
        };
        this.getParent = function(){
            try {
                this.parent.isAlive();
                return this.parent;
            } 
            catch (ex) {
                return null;
            }
        };
        var logger = this.logger = new function(){
            var logs = [], i = 0;
            this.log = function(s){
                logs[i++] = {
                    "message": s,
                    "date": new Date()
                };
            };
            this.getLogs = function(){
                return logs.concat([]);
            }
        };
        
        var progId, progIds = ["MSXML2.XMLHTTP.6.0", "MSXML2.XMLHTTP", "Microsoft.XMLHTTP"];
        this.getXMLHttpRequest = function(){
            if (!window.ActiveXObject) {
                return new XMLHttpRequest();
            }
            else 
                if (progId != null) {
                    return new ActiveXObject(progId);
                }
                else {
                    for (var i = 0; i < progIds.length; i++) {
                        try {
                            return new ActiveXObject(progId = progIds[i]);
                        } 
                        catch (ex) {
                            progId = null;
                        }
                    }
                }
        };
        var jsre = this;
        var hasCache = true;
        var ex = null;
        this.loadModule = function(name, module){
            if (jsre.state != 1) {
                throw "JSVM runtime-environment has crashed.";
            };
            var execEty = null;
            if (module != null) {
                execEty = function(){
                    module();
                    jsre.setResource("$code{" + name + "}", module);
                    return true;
                }
            }
            else {
                var code = jsre.getResource("$code{" + name + "}");
                if (hasCache && code != null) {
                    execEty = function(){
                        eval("(" + code + ")();");
                        return true;
                    }
                }
                else {
                    hasCache = false;
                    execEty = function(){
                        var tmpRes = jsre.config.getParameter(name);
                        document.write("<script src='" + jsre.jsvmHome + "/bin/" + (tmpRes == null ? (name + ".js") : tmpRes) + "?" + jsre.currentVersion + "'></script>");
                    }
                }
            };
            try {
                if (execEty()) {
                    logger.log("JSVM runtime-environment load module '" + name + "' succ.");
                }
            } 
            catch (ex) {
                jsre.state = 0;
                logger.log(ex);
                logger.log("JSVM runtime-environment load module '" + name + "' fail.");
            }
        };
        this.getResource = function(name){
            return this.resources[name];
        };
        this.setResource = function(name, obj){
            this.resources[name] = String(obj);
        };
        this.destroy = function(){
            this.JSVM.destroy();
            this.element = null;
        }
    },
    "kernel": {},
    "developmentKit": {},
    "plugIn": {},
    "initialize": function(element){
        var jsre = this.runtimeEnvironment;
        var logger = jsre.logger;
        var ex, tmp, p;
        try {
            jsre.element = element;
            logger.log("JSVM runtime-environment initialize...");
            jsre.navigator = (/opera/i.test(tmp = navigator.userAgent)) ? "opera" : ((/gecko/i.test(tmp)) ? "moz" : ((/msie/i.test(tmp)) ? "ie" : "other"));
            var getCFGAttribute = function(name){
                var attr = jsre.element.attributes[name];
                return (attr) ? attr.nodeValue : null;
            };
            logger.log("JSVM runtime-environment get system properties...");
            var src, index;
            jsre.jsvmHome = ((tmp = getCFGAttribute("jsvm_home")) != null) ? tmp : ((index = (src = getCFGAttribute("src")).replace(/\\/g, "/").lastIndexOf("/")) == -1) ? "." : src.substring(0, index);
            jsre.mode = ((tmp = getCFGAttribute("mode")) == null) ? jsre.mode : (",standalone,application,module,auto,".indexOf(tmp = tmp.toLowerCase()) == -1) ? jsre.mode : tmp;
            if (jsre.mode == "module" || jsre.mode == "auto") {
                var winHDL = window, jsvmNs;
                while (true) {
                    if ((jsvmNs = (winHDL.opener != null && winHDL.opener.closed == false && winHDL.opener._JSVM_Namespace) || (winHDL.dialogArguments && winHDL.dialogArguments._JSVM_Namespace) || (winHDL.dialogArguments && winHDL.dialogArguments.window && winHDL.dialogArguments.window._JSVM_Namespace)) && jsvmNs.runtimeEnvironment.mode == "application") {
                        jsre.parent = jsvmNs.runtimeEnvironment;
                        jsre.mode = "module";
                        break;
                    };
                    if (winHDL == winHDL.parent && winHDL.opener == null && !(winHDL.dialogArguments && winHDL.dialogArguments.window)) {
                        if (jsre.mode == "auto") {
                            jsre.mode = "standalone";
                        };
                        break;
                    };
                    if (winHDL.parent.closed == false && (jsvmNs = winHDL.parent._JSVM_Namespace) != null && jsvmNs.runtimeEnvironment.mode == "application") {
                        jsre.parent = jsvmNs.runtimeEnvironment;
                        jsre.mode = "module";
                        break;
                    };
                    winHDL = (((winHDL.parent != winHDL) ? winHDL.parent : null) || winHDL.opener || (winHDL.dialogArguments && winHDL.dialogArguments.window));
                }
            };
            if (jsre.mode != "module") {
                jsre.classpath = ((tmp = getCFGAttribute("classpath")) != null) ? tmp : "";
                jsre.debug = ((tmp = getCFGAttribute("debug")) != null && (tmp.toLowerCase() == "true")) ? true : false;
                var jsvmConfig = "";
                if (getCFGAttribute("configurable") == "on") {
                    if (/ jsvm2Config=([^;]*)/.test(" " + document.cookie)) {
                        jsvmConfig = unescape(RegExp.$1);
                    }
                    else {
                        try {
                            var xmlHttp = jsre.getXMLHttpRequest();
                            xmlHttp.open("GET", jsre.jsvmHome + "/rtenv.conf", false);
                            xmlHttp.send(null);
                            var stus = xmlHttp.status;
                            if (stus != 0 && stus != 200 && stus != 304) {
                                throw "JSVM-NS can't find config file.";
                            };
                            document.cookie = "jsvm2Config=" + escape(jsvmConfig = xmlHttp.responseText.replace(/#([^"\n\r]*)((\r\n)|$)/g, "").replace(/\[([^"\n\r]*)\]/g, "").replace(/\r\n(\s)*\r\n/g, "\r\n"));
                        } 
                        catch (ex) {
                            throw "JSVM-NS load config file error: " + ex;
                        }
                        finally {
                            xmlHttp = null;
                        }
                    }
                };
                var cfg = jsre.config = new function(){
                    var params = {};
                    var parseParam = function(name){
                        var re = new RegExp("(\\^|\\r\\n)( |\\t)*(" + name + ")( |\\t)*=( |\\t)*(.*)($|\\r\\n)");
                        return re.test(jsvmConfig) ? RegExp.$6.replace(/\s+$/g, "") : null;
                    };
                    this.getParameter = function(name){
                        return ((p = params[name]) != null || (p = params[name] = getCFGAttribute(name)) != null) ? p : (params[name] = parseParam(name));
                    }
                };
                jsre.extModules = jsre.extModules.concat(((tmp = cfg.getParameter("extmodules")) == null || tmp == "") ? [] : tmp.replace(/,$/, "").split(","));
                jsre.classpath = ((tmp = cfg.getParameter("classpath")) == null) ? "" : tmp;
            }
            else {
                var pre = jsre.getParent();
                if (!pre) {
                    throw "The module-page can't find appliation.";
                };
                with (jsre) {
                    navigator = pre.navigator;
                    extModules = jsre.extModules;
                    debug = pre.debug;
                    config.getParameter = function(name){
                        return pre.config.getParameter(name);
                    };
                    getResource = function(name){
                        return pre.getResource(name);
                    };
                    setResource = function(name, obj){
                        pre.setResource(name, obj);
                    }
                }
            };
            logger.log("JSVM runtime-environment load modules ... ");
            jsre.loadModule("kernel");
            switch (jsre.mode) {
                case "standalone":
                    jsre.loadModule("runtime");
                    break;
                case "application":
                    jsre.loadModule("runtime");
                    jsre.loadModule("application");
                    break;
                case "module":
                    jsre.loadModule("runtime.module");
                    jsre.loadModule("module");
                    break;
                default:
                    break;
            };
            for (var i = 0; i < jsre.extModules.length; i++) {
                var m = jsre.extModules[i].replace(/\.[j|J][s|S]$/g, "");
                jsre.loadModule((/[\\|\/]/.test(m)) ? m : ("extends/" + m));
            }
        } 
        catch (ex) {
            logger.log((!ex.description) ? ex.toString() : ("Error: " + ex.description));
            var s = "", logs = logger.getLogs();
            for (var i = 0; i < logs.length; i++) {
                var d = logs[i].date;
                s += ['\r\n[', d.toLocaleString(), ':', d.getMilliseconds(), ' JSVM] ', logs[i].message].join('');
            };
            alert("JSVM load error , logs: \r\n ---------\r\n" + "URL: " + document.URL + "\r\n ---------" + s);
        }
        finally {
            element = null;
        }
    },
    "destroy": function(){
        _JSVM_Namespace.runtimeEnvironment.destroy();
    }
};
var scripts = document.getElementsByTagName("SCRIPT");
var element = scripts[scripts.length - 1];
_JSVM_Namespace.initialize(element);
scripts = element = void (0);
if (window.addEventListener) {
    window.addEventListener("unload", _JSVM_Namespace.destroy, false);
}
else {
    window.attachEvent("onunload", _JSVM_Namespace.destroy);
};

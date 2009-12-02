//Javascript div window

function createFunction(obj, strFunc) {
    var args = [];
    if (!obj) obj = window;
    for (var i = 2; i < arguments.length; i++) args.push(arguments[i]);
    return function() {
        return obj[strFunc].apply(obj, args);
    }
}

//configuration
var cBackgroundColor = "#ffffff"; //background color
var cBorderColor = "#999999"; //the color of border
var cHeaderBackgroundColor = "#f0f0f0"; //Header color

var moveFlag = 0;
var mouseBeginX = 0;
var mouseBeginY = 0;
var modalBeginTop = 0;
var modalBeginLeft = 0;
var z_index_start = 200;

//DOM
//get element by id
function getE(theID) {
    return document.getElementById(theID);
}
//create element
function createE(tagName) {
    var tag = document.createElement(tagName);
    return tag;
}
//move element
function removeE(tag) {
    if (document.removeNode) {
        //IE
        tag.removeNode(true);
    }
    else {
        //NOT IE
        tag.parentNode.removeChild(tag);
    }
}

function removeDocE(doc, tag) {
    if (doc.removeNode) {
        //IE
        tag.removeNode(true);
    }
    else {
        //NOT IE
        tag.parentNode.removeChild(tag);
    }
}

function addEvent(tag, eventName, func) {
    if (tag.attachEvent) {
        //IE
        tag.attachEvent(eventName, func);
    }
    else if (tag.addEventListener) {
        //FF AND NS
        tag.addEventListener(eventName.replace(/on(.*)/i, '$1'), func, false);
    }
}

/// <summary>mouse down</summary>
function selectBegin(obj) {

    //alert(event.button);

    if (event.button == 1) {

        moveFlag = 1;
        var modal_window = getE("modal_window" + obj.id);
        modal_window.setCapture();

        //    if (!e) {
        //        e = window.event;
        //    }

        mouseBeginX = document.body.scrollLeft + event.clientX;
        mouseBeginY = document.body.scrollTop + event.clientY;

        modalBeginTop = modal_window.offsetTop;
        modalBeginLeft = modal_window.offsetLeft;
    }
}

/// <summary>mouse move</summary>
function selectMove(obj) {
    if (moveFlag == 1) {
        var modal_window = getE("modal_window" + obj.id);

        //        if (!e) {
        //            e = window.event;
        //        }

        var mouseCurrentX = document.body.scrollLeft + event.clientX;
        var mouseCurrentY = document.body.scrollTop + event.clientY;

        modal_window.style.top = modalBeginTop + (mouseCurrentY - mouseBeginY);
        modal_window.style.left = modalBeginLeft + (mouseCurrentX - mouseBeginX);
    }
}

/// <summary>mouse up</summary>
function selectEnd(obj) {
    moveFlag = 0;
    var modal_window = getE("modal_window" + obj.id);
    modal_window.releaseCapture();
}

function DivModelWindow(id, windowTitle, iframeSrc, iframeWidth, iframeHeight, closeExecuteScript) {

    this.id = id;
    this.windowTitle = windowTitle;
    this.iframeSrc = iframeSrc;
    this.iframeWidth = iframeWidth;
    this.iframeHeight = iframeHeight;
    this.closeExecuteScript = closeExecuteScript;

    this.bulid = bulid;
    this.bulid();
}

function bulid() {


    //    //create modal shadow
    var modal_shadow = createE("div");
    modal_shadow.id = "modal_shadow" + this.id;
    modal_shadow.className = "modal_shadow";
    z_index_start++;
    modal_shadow.style.zIndex = z_index_start;

    var client_width = document.body.clientWidth + "px";
    var client_height = 0;
    if (document.documentElement.scrollHeight > document.documentElement.clientHeight) {
        client_height = document.documentElement.scrollHeight;
    }
    else {
        client_height = document.documentElement.clientHeight;
    }
    var client_height = client_height + "px";

    modal_shadow.style.width = client_width;
    modal_shadow.style.height = client_height;
    modal_shadow.style.top = 0;
    modal_shadow.style.left = 0;

    var modalShadowIframe = createE("iframe");
    modalShadowIframe.className = "modal_shadow_frame";
    modalShadowIframe.name = "modal_shadow_iframe" + this.id;
    modalShadowIframe.id = "modal_shadow_iframe" + this.id;
    modalShadowIframe.scrolling = "no";
    modalShadowIframe.frameBorder = "0";
    modal_shadow.appendChild(modalShadowIframe);

    if (document.body.childNodes.length > 0) {
        document.body.insertBefore(modal_shadow, document.body.childNodes[0]);
    }
    else {
        document.body.appendChild(modal_shadow);
    }



    //craate modal window shadow
    var modal_window_shadow = createE("div");
    modal_window_shadow.id = "modal_window_shadow" + this.id;
    modal_window_shadow.className = "modal_window_shadow";
    z_index_start++;
    modal_window_shadow.zIndex = z_index_start;
    modal_window_shadow.innerHTML = "&nbsp;";
    //iframeWidth + double border
    modal_window_shadow.style.width = this.iframeWidth + 4 + "px";
    //iframeWidth + double border + header + bottom
    modal_window_shadow.style.height = this.iframeHeight + 4 + 30 + "px";

    //create modal window
    var modal_window = createE("div");
    modal_window.id = "modal_window" + this.id;
    modal_window.className = "modal_window";
    z_index_start++;
    modal_window.style.zIndex = z_index_start;


    var modal_window_main = createE("div");
    modal_window_main.id = "modal_window_main" + this.id;
    modal_window_main.className = "modal_window_main";
    z_index_start++;
    modal_window_main.style.zIndex = z_index_start;
    modal_window_main.style.border = cBorderColor + " 2px solid";
    modal_window_main.style.width = this.iframeWidth + "px";
    modal_window_main.style.backgroundColor = cBackgroundColor;

    modal_window_main.style.top = 0;
    modal_window_main.style.left = 0;

    //header
    var modal_window_main_header = createE("div");
    modal_window_main_header.id = "modal_window_main_header" + this.id;
    modal_window_main_header.className = "modal_window_main_header";
    modal_window_main_header.style.backgroundColor = cHeaderBackgroundColor;

    var modal_window_main_header_left = createE("div");
    modal_window_main_header_left.id = "modal_window_main_header_left" + this.id;
    modal_window_main_header_left.className = "modal_window_main_header_left";

    var modal_window_main_header_left_text = createE("span");
    modal_window_main_header_left_text.id = "modal_window_main_header_left_text" + this.id;
    modal_window_main_header_left_text.className = "modal_window_main_header_left_text";
    modal_window_main_header_left_text.innerHTML = this.windowTitle;

    modal_window_main_header_left.appendChild(modal_window_main_header_left_text);

    var modal_window_main_header_right = createE("div");
    modal_window_main_header_right.id = "modal_window_main_header_right" + this.id;
    modal_window_main_header_right.className = "modal_window_main_header_right";

    var modal_window_main_header_right_text = createE("span");
    modal_window_main_header_right_text.id = "modal_window_main_header_right_text" + this.id;
    modal_window_main_header_right_text.className = "modal_window_main_header_right_text";
    modal_window_main_header_right_text.innerHTML = "X";
    modal_window_main_header_right_text.title = "CLOSE";

    modal_window_main_header_right.appendChild(modal_window_main_header_right_text);

    modal_window_main_header.appendChild(modal_window_main_header_left);
    modal_window_main_header.appendChild(modal_window_main_header_right);

    //body
    var modal_window_main_body = createE("div");
    modal_window_main_body.id = "modal_window_main_body" + this.id;
    modal_window_main_body.className = "modal_window_main_body";

    var iframe = createE("iframe");
    iframe.name = "modal_iframe" + this.id;
    iframe.id = "modal_iframe" + this.id;
    iframe.src = this.iframeSrc;
    iframe.scrolling = "no";
    iframe.frameBorder = "0";
    iframe.width = this.iframeWidth + "px";
    iframe.height = this.iframeHeight + "px";
    modal_window_main_body.appendChild(iframe);

    //bottom
    var modal_window_main_bottom = createE("div");
    modal_window_main_bottom.id = "modal_window_main_bottom" + this.id;
    modal_window_main_bottom.className = "modal_window_main_bottom";

    //append event
    //move
    addEvent(modal_window, "onmousedown", createFunction(null, "selectBegin", this));
    addEvent(modal_window, "onmousemove", createFunction(null, "selectMove", this));
    addEvent(modal_window, "onmouseup", createFunction(null, "selectEnd", this));

    //close
    addEvent(modal_window_main_header_right_text, "onclick", createFunction(null, "closeDiv", this));


    if (this.closeExecuteScript != null && this.closeExecuteScript != "" && this.closeExecuteScript != "null") {
        addEvent(modal_window_main_header_right_text, "onclick", this.closeExecuteScript);    
    }

    //modal_window location
    modal_window.style.left = (document.body.clientWidth - (this.iframeWidth + 4 + 5)) / 2 + document.documentElement.scrollLeft + "px";
    modal_window.style.top = (document.documentElement.clientHeight - (this.iframeHeight + 4 + 30 + 5)) / 2 + document.documentElement.scrollTop + "px";

    //iframe width + double borders + shadow
    modal_window.style.width = this.iframeWidth + 4 + 5 + "px";
    //iframe height + double borders + shadow + header + bottom
    modal_window.style.height = this.iframeHeight + 4 + 5 + 30 + "px";

    //dom append
    modal_window_main.appendChild(modal_window_main_header);
    modal_window_main.appendChild(modal_window_main_body);
    //modal_window_main.appendChild(modal_window_main_bottom);
    modal_window.appendChild(modal_window_shadow);
    modal_window.appendChild(modal_window_main);

    document.body.insertBefore(modal_window, document.body.childNodes[0]);
}

/// <summary>commit</summary>
/// <remark></remark>
function ok(obj) {
    var frm = document.frames["modal_iframe" + obj.id];
    if (frm.ok()) {
        closeDiv(obj);
    }
    else {
        frm.focus();
    }
}

/// <summary>close the div window</summary>
function closeDivWindow(obj) {
    var modal_window_main_header_right_text = getE("modal_window_main_header_right_text" + obj.id);
    modal_window_main_header_right_text.click();
}

/// <summary>close the open window from parent</summary>
function closeDiv(obj) {
    var modal_window = getE("modal_window" + obj.id);
    var modal_shadow = getE("modal_shadow" + obj.id);
    removeE(modal_window);
    removeE(modal_shadow);
    /*
    if(top != self){
    modal_window = window.parent.document.getElementById("modal_window");
    modal_shadow = window.parent.document.getElementById("modal_shadow");
    }
    */
}

/////<summary>close self</summary>
//function closeWindow(obj) {
//    var modal_window = window.parent.document.getElementById("modal_window" + obj.id);
//    var modal_shadow = window.parent.document.getElementById("modal_shadow" + obj.id);
//    removeDocE(window.parent.document, modal_window);
//    removeDocE(window.parent.document, modal_shadow);
//}


/// <summary>in open page close current div window</summary>
function closeCurrentDiv() {
    if (window.frameElement) {
        var framesid = window.frameElement.id;
        var objid = framesid.replace("modal_iframe", "");

        var objDivWivWindow = top.window.eval(objid);

        //top.closeDiv(objDivWivWindow);
        top.closeDivWindow(objDivWivWindow);
    }
}


/// <summary>closeCurrentDivWithMessage</summary>
/// <param name="alertMsg">alert a message</param>
/// <param name="isCloseDialog">flag: is close dialog</param>
/// <param name="isRefreshPage">flag: is refresh page</param>
function closeCurrentDivWithMessage(alertMsg, isCloseDialog, isRefreshPage) {
    if (alertMsg != "") {
        alert(alertMsg);
    }
    if (isCloseDialog) {
        closeCurrentDiv();
        if (isRefreshPage) {
            window.location.href = window.location.href;
        }
    }
}

function closeCurrentDivWithMessageAndScript(alertMsg, isCloseDialog, script) {
    if (alertMsg != "") {
        alert(alertMsg);
    }
    if (isCloseDialog) {
        if (script != "") {
            eval(script);
        }
        closeCurrentDiv();
    }
}
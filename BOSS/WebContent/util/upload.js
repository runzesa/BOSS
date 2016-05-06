function pageLoad(){
    
    var oldFileStr = window.opener.document.getElementById(valueinput).value;
    if (oldFileStr != '') {
        var oldFiles = oldFileStr.split(";");
        var fileElement = document.getElementById("upfilename");
        for (i = 0; i < oldFiles.length; ++i) {
            var showOldFile = oldFiles[i].split(",");
            var addElement = document.createElement("<div>");
            addElement.innerHTML = "<div style='height:23px;'><div style='float:left;width:200px;text-align=left'>" +
            "<input style='width:250px;' value='" +
            showOldFile[0] +
            "' name='file0' type='text' readonly='readonly'/>" +
            "<input id='file0show' name='file0show' type='hidden' value='" +
            oldFiles[i] +
            "'/></div>" +
            "<div style='width:80px;'>" +
            "<a href='#' onclick='fileDownload(this)'><img src='../images/icon/upload_save.gif'></a>&nbsp" +
            "<a href='#' onclick='delfile(this)'><img src='../images/icon/upload_del.gif'></a></div></div>";
            fileElement.appendChild(addElement);
        }
    }
}

function findFile(fid){
    var fileElement = document.getElementById("upfilename");
    var addElement = document.createElement("<div>");
    addElement.innerHTML = "<div style='height:23px;'><div style='float:left;width:220px;text-align=left'>" +
    "<input style='width:250px;' name='file" +
    fid +
    "' type='file' /></div>" +
    "<div style='width:80px;'>" +
    "<a href='#' onclick='delfile(this)'><img src='../images/icon/upload_del.gif'></a></div></div>";
    fileElement.appendChild(addElement);
}

function delfile(selfNode){
    var delNode = selfNode.parentNode.parentNode;
    delNode.parentNode.removeChild(delNode);
}

function formSubmit(){
    document.forms[0].submit();
}

function fileDownload(str){
    var downNode = str.parentNode.parentNode;
    var inputNode = downNode.getElementsByTagName("input");
    //alert(inputNode[0].value);
    window.open('download.jsp?path=' + inputNode[1].value, '', 'location=no,toolbar=no,status=no');
}

//checkboxall
function CheckAll(){
    for (var i = 0; i < document.form1.elements.length; i++) {
        var e = document.form1.elements[i];
        if (e.name != 'chkall') 
            e.checked = document.form1.chkall.checked;
    }
}

//������ı����ɫ
function hilite(obj){
    obj.style.border = '1px solid #026EDB';
}

function delite(obj){
    obj.style.border = '1px solid #7F9DB9';
}

//����
var sorttype = 1; //desc
function sortByCol(colNum){
    //����         
    var parNode = document.getElementById("listtable"); //��λ��table��       
    for (var i = 0; i < parNode.rows.length - 1; i++) {
        for (var n = 1; n < parNode.rows.length - 1 - i; n++) {
            var ifrom = parNode.rows.length - n;
            var ito = parNode.rows.length - n - 1;
            if (sorttype == 1) {
                if (parNode.rows[ifrom].cells[colNum].childNodes[0].data > parNode.rows[ito].cells[colNum].childNodes[0].data) {
                    parNode.moveRow(ifrom, ito); //from-to
                }
            }
            else {
                if (parNode.rows[ifrom].cells[colNum].childNodes[0].data < parNode.rows[ito].cells[colNum].childNodes[0].data) {
                    parNode.moveRow(ifrom, ito); //from-to
                }
            }
        }
    }
    sorttype = 0 - sorttype; //asc
}

//�����˵�
function menuFix(right_nav){
    var sfEls = document.getElementById(right_nav).getElementsByTagName("li");
    for (var i = 0; i < sfEls.length; i++) {
        sfEls[i].onmouseover = function(){
            this.className += (this.className.length > 0 ? " " : "") + "sfhover";
        }
        sfEls[i].onMouseDown = function(){
            this.className += (this.className.length > 0 ? " " : "") + "sfhover";
        }
        sfEls[i].onMouseUp = function(){
            this.className += (this.className.length > 0 ? " " : "") + "sfhover";
        }
        sfEls[i].onmouseout = function(){
            this.className = this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
        }
    }
}

//��ӡ
function Print(){
    parent.rightFrame.focus();
    parent.rightFrame.print();
}

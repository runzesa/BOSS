<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>���ݱ༭</title>
<%@include file="../jspheader/insert_header.jsp" %>
<link rel="stylesheet" type="text/css" media="all"
href="../css/aqua/theme.css" title="theme" />
<script type="text/javascript" src="../css/calendar.js"></script>
<script type="text/javascript" src="../css/calendar-cn.js"></script>
<script type="text/javascript" src="../css/calendar-setup.js"></script>

<script src="insert.js" type="text/javascript"></script>

<script language="JavaScript">
<!--
var actiontype="<%=request.getParameter("actiontype")%>";
var id="<%=request.getParameter("id")%>";

var url = "<%=request.getQueryString()%>";
url = decodeURI(url);
-->
</script>

</head>
<body class="right_date_body" onload="pageLoad()">
<div id="message_box"></div>
<div class="right_date_top">
    <div>
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">ҽ���û�����</a></h1>
    	<div id="opendiv">��ǰλ�ã�</div>
		<div class="right_date_top_nav">
			<ul>
			<li style="display: block;" class="new"><a id="new" href="javascript:newData()">����</a></li>
			<li style="display: block;" class="edit"><a id="update" href="javascript:editData()">�༭</a></li>
			<li style="display: block;" class="del"><a id="delete" href="javascript:messageBox.confirm('�����Ҫɾ��������?',deleteData)">ɾ��</a></li>
			<li style="display: block;" class="undo"><a id="undo" href="javascript:undo()">����</a></li>
			<li style="display: block;" class="save"><a id="save" href="javascript:saveData()">����</a></li>   
			<li style="display: block;" class="export"><a id="export" href="#">����</a>
				<ul>
					<li class="print"><a href="javascript:insertPrint()">��ӡԤ��</a></li>
				</ul>
			</li>
			<li style="display: block;" class="back"><a id="back" href="javascript:finalResult()" target="_self">����</a></li>
			</ul>
		</div>
	</div>
</div>

<div>
<div>
	<form name="b_userform" action="">
	  <table width="100%" border="1" cellspacing="0" cellpadding="1" bordercolordark="#FFFFFF" bordercolorlight="#FFFFFF">
	    <tr>
	      <td height="170" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="6%" height="175" valign="top"><table width="100%" height="170" border="0" cellpadding="0" cellspacing="0">
	            <tr>
	              <td width="96" height="138" align="center"> <span id="head_imgshow"></span></td>
	              </tr>
	            <tr>
	              <td height="32" align="center">      <input type="hidden" id="head_img" name="head_img" />
      <input type="button" value="�ϴ�ͷ��" onclick="openwindow('../util/upload.jsp?nameinput=head_imgshow&amp;valueinput=head_img','fileupload','428','246')" /></td>
	              </tr>
	            </table></td>
	          <td width="94%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td height="32" align="right">&nbsp;</td>
	              <td align="left">&nbsp;</td>
	              <td align="right">&nbsp;</td>
	              <td align="left">&nbsp;</td>
	              <td align="right">&nbsp;</td>
	              <td align="left">&nbsp;</td>
	              </tr>
	            <tr>
	              <td width="7%" height="32" align="right">��ɫ��</td>
	              <td width="13%" align="left"><select id="role" name="role">
	                <option value="9">��ר��</option>
	                <option value="3">ҽѧ��ʦ</option>
	                <option value="5">ҽѧ����Ա</option>
	                <option value="6">ȫ��ҽ��</option>
	                <option value="2">��֤ҽ��</option>
	                <option value="1">δ��֤ҽ��</option>
	                <option value="0">��ͨ�û�</option>
	                </select></td>
	              <td width="7%" align="right">������</td>
	              <td width="16%" align="left"><input type="text" id="name"  fieldmaxlength="50"/></td>
	              <td width="6%" align="right">�绰��</td>
	              <td width="51%" align="left"><input type="text" id="phone_no"  fieldmaxlength="30"/></td>
	              </tr>
	            <tr>
	              <td height="33" align="right">�˺ţ�</td>
	              <td align="left"><input type="text" id="account"  fieldmaxlength="50"/></td>
	              <td align="right">�Ա�</td>
	              <td align="left">
	                   <select id="sex" name="sex">
			                <option value="0">δ֪</option>
			                <option value="1">��</option>
			                <option value="2">Ů</option>
	                   </select>
	              </td>
	              <td align="right">E-mail��</td>
	              <td align="left"><input type="text" id="email"  fieldmaxlength="50"/></td>
	              </tr>
	            <tr>
	              <td height="34" align="right">���룺</td>
	              <td align="left"><input type="text" id="password"  fieldmaxlength="50"/></td>
	              <td align="right">���գ�</td>
	              <td align="left"> <input type="text" name="birthday" id="birthday"  fieldmaxlength="200" fieldstyle="date"/>
	                <span><img src="../images/icon/data.png" id="birthdaydate" /></span>
	                <script type="text/javascript">
	Calendar.setup({
		inputField     :    "birthday",
		ifFormat       :    "%Y-%m-%d",
		button         :    "birthdaydate",
		singleClick    :    false
 	});
  </script></td>
	              <td>&nbsp;</td>
	              <td>&nbsp;</td>
	              </tr>
	            <tr>
	              <td height="40" align="right">״̬��</td>
	              <td align="left"><select id="status" name="status">
	                <option value="0">����</option>
	                <option value="-1">��ɾ��</option>
	                </select></td>
	              <td align="right">����ʡ��</td>
	              <td colspan="3" align="left"><select id="area_s" name="area_s" onchange="area_sChange()">
	                </select>	               
	                &nbsp; �У�
	                <select id="areask" name="areask" onchange="cityChange()">
	                  </select></td>
	              </tr>
	            </table></td>
	          </tr>
          </table></td>
        </tr>
	    <tr>
	      <td height="272" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="13%" height="32" align="right">����ҽԺ��</td>
	          <td width="8%" align="left"><select id="hospital" name="hospital" >
	            </select></td>
	          <td width="10%" align="right">ְ�ƣ�</td>
	          <td width="15%" align="left"><select id="job_title" name="job_title">
	            </select></td>
	          <td width="6%" align="right">ѧ�ƹ�����</td>
	          <td width="48%" align="left"><select id="section" name="section">
	            </select></td>
	          </tr>
	        <tr>
	          <td height="33" align="right">���ң�</td>
	          <td align="left"><input type="text" id="department"  fieldmaxlength="50"/></td>
	          <td align="right">��ҵԺУ��</td>
	          <td align="left"><input type="text" id="college"  fieldmaxlength="50"/></td>
	          <td align="right">����ѧ�᣺</td>
	          <td align="left"><input type="text" id="society"  fieldmaxlength="100"/></td>
	          </tr>
	        <tr>
	          <td height="31" align="right">�ó�����</td>
	          <td colspan="2" align="left"><input type="text" id="skilled_fields"  fieldmaxlength="50"/></td>
	          <td>&nbsp;</td>
	          <td align="right">ƫ��ѧ�ƣ�</td>
	          <td align="left"><input type="text" id="preference"  fieldmaxlength="255"/></td>
	          </tr>
	        <tr>
	          <td height="176" align="right" valign="top"><p>&nbsp;</p>
	            <p>��飺</p></td>
	          <td colspan="5" align="left" valign="top"><p>&nbsp;</p>
	            <p>
	              <textarea name="brief" cols="100" rows="10" id="brief" fieldmaxlength="2000"></textarea>
	           &nbsp; </p></td>
	          </tr>
          </table></td>
        </tr>
	    <tr>
	      <td height="66" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="13%" height="32" align="right">����ֵ��</td>
	          <td width="11%" align="left"><input type="text" id="point"  notnull="true" fieldmaxlength="200" fieldstyle="float" value="0.0" disabled="disabled"/></td>
	          <td width="7%" align="right">ע��ʱ�䣺</td>
	          <td width="16%" align="left">&nbsp;
	            <input type="text" name="register_time" id="register_time" value="<%=(new java.util.Date()).toLocaleString()%>"  notnull="true" fieldmaxlength="200" fieldstyle="datetime" disabled="disabled"/>
	            <span><img src="../images/icon/data.png" id="register_timedate" /></span>
	            <script type="text/javascript">
	Calendar.setup({
		inputField     :    "register_time",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "register_timedate",
		singleClick    :    false,
		step           :    1
 	});
                </script>
  &nbsp;</td>
	          <td width="5%" align="right">�������룺</td>
	          <td width="48%" align="left"><input type="text" id="old_password"  fieldmaxlength="50" disabled="disabled"/></td>
	          </tr>
	        <tr>
	          <td height="33" align="right">ѧ��ֵ��</td>
	          <td align="left"><input type="text" id="credit" value="0.0" disabled="disabled"  notnull="true" fieldmaxlength="10" fieldstyle="float"/></td>
	          <td align="right">��Ϣ�޸�ʱ�䣺</td>
	          <td align="left">&nbsp;
	            <input type="text" name="modify_time" id="modify_time"  fieldmaxlength="200" fieldstyle="datetime" disabled="disabled"/>
	            <span><img src="../images/icon/data.png" id="modify_timedate" /></span>
	            <script type="text/javascript">
	Calendar.setup({
		inputField     :    "modify_time",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "modify_timedate",
		singleClick    :    false,
		step           :    1
 	});
                </script>
  &nbsp;&nbsp;</td>
	          <td align="right">&nbsp;</td>
	          <td>&nbsp;</td>
	          </tr>
          </table></td>
        </tr>
	    <tr>
	      <td height="258" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="13%" height="32" align="right">���֤�ţ�</td>
	          <td width="11%" align="left"><input type="text" id="id_card_no"  fieldmaxlength="20"/></td>
	          <td width="6%" align="right">��֤�����</td>
	          <td width="14%" align="left"><select id="is_identify" name="is_identify">
	                <option value="0">��</option>
			                <option value="1">�����</option>
			                <option value="2">����֤</option>
	              </select>
	          </td>
	          <td width="8%" align="right">����Ա������</td>
	          <td width="48%" align="left"><select id="liaisons" name="liaisons">
	            </select></td>
	          </tr>
	        <tr>
	          <td height="128" align="right">�ϴ����֤ͼƬ��</td>
	          <td> <input type="hidden" id="idcard_img" name="idcard_img" />
	            <input type="button" value="�ϴ����֤��Ƭ" onclick="openwindow('../util/upload.jsp?nameinput=idcard_imgshow&amp;valueinput=idcard_img','fileupload','428','246')" />
	            </input>
	            </td>
	          <td colspan="4" align="right"><span id="idcard_imgshow"></span></td>
	          </tr>
	        <tr>
	          <td height="146" align="right">�ϴ�֤��ͼƬ��</td>
	          <td>      <input type="hidden" id="cert_img" name="cert_img" />
	            <input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=cert_imgshow&amp;valueinput=cert_img','fileupload','428','246')" />
	            </input>
	            </td>
	          <td colspan="4" align="right"><span id="cert_imgshow"></span></td>
	          </tr>
          </table></td>
        </tr>
      </table>
	</form>
</div></div>
</body>
</html>


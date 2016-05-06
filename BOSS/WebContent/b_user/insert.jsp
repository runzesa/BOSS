<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据编辑</title>
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
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">医生用户管理</a></h1>
    	<div id="opendiv">当前位置：</div>
		<div class="right_date_top_nav">
			<ul>
			<li style="display: block;" class="new"><a id="new" href="javascript:newData()">新增</a></li>
			<li style="display: block;" class="edit"><a id="update" href="javascript:editData()">编辑</a></li>
			<li style="display: block;" class="del"><a id="delete" href="javascript:messageBox.confirm('您真的要删除数据吗?',deleteData)">删除</a></li>
			<li style="display: block;" class="undo"><a id="undo" href="javascript:undo()">撤销</a></li>
			<li style="display: block;" class="save"><a id="save" href="javascript:saveData()">保存</a></li>   
			<li style="display: block;" class="export"><a id="export" href="#">导出</a>
				<ul>
					<li class="print"><a href="javascript:insertPrint()">打印预览</a></li>
				</ul>
			</li>
			<li style="display: block;" class="back"><a id="back" href="javascript:finalResult()" target="_self">返回</a></li>
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
      <input type="button" value="上传头像" onclick="openwindow('../util/upload.jsp?nameinput=head_imgshow&amp;valueinput=head_img','fileupload','428','246')" /></td>
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
	              <td width="7%" height="32" align="right">角色：</td>
	              <td width="13%" align="left"><select id="role" name="role">
	                <option value="9">大专家</option>
	                <option value="3">医学导师</option>
	                <option value="5">医学联络员</option>
	                <option value="6">全科医生</option>
	                <option value="2">认证医生</option>
	                <option value="1">未认证医生</option>
	                <option value="0">普通用户</option>
	                </select></td>
	              <td width="7%" align="right">姓名：</td>
	              <td width="16%" align="left"><input type="text" id="name"  fieldmaxlength="50"/></td>
	              <td width="6%" align="right">电话：</td>
	              <td width="51%" align="left"><input type="text" id="phone_no"  fieldmaxlength="30"/></td>
	              </tr>
	            <tr>
	              <td height="33" align="right">账号：</td>
	              <td align="left"><input type="text" id="account"  fieldmaxlength="50"/></td>
	              <td align="right">性别：</td>
	              <td align="left">
	                   <select id="sex" name="sex">
			                <option value="0">未知</option>
			                <option value="1">男</option>
			                <option value="2">女</option>
	                   </select>
	              </td>
	              <td align="right">E-mail：</td>
	              <td align="left"><input type="text" id="email"  fieldmaxlength="50"/></td>
	              </tr>
	            <tr>
	              <td height="34" align="right">密码：</td>
	              <td align="left"><input type="text" id="password"  fieldmaxlength="50"/></td>
	              <td align="right">生日：</td>
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
	              <td height="40" align="right">状态：</td>
	              <td align="left"><select id="status" name="status">
	                <option value="0">正常</option>
	                <option value="-1">已删除</option>
	                </select></td>
	              <td align="right">所在省：</td>
	              <td colspan="3" align="left"><select id="area_s" name="area_s" onchange="area_sChange()">
	                </select>	               
	                &nbsp; 市：
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
	          <td width="13%" height="32" align="right">所在医院：</td>
	          <td width="8%" align="left"><select id="hospital" name="hospital" >
	            </select></td>
	          <td width="10%" align="right">职称：</td>
	          <td width="15%" align="left"><select id="job_title" name="job_title">
	            </select></td>
	          <td width="6%" align="right">学科归属：</td>
	          <td width="48%" align="left"><select id="section" name="section">
	            </select></td>
	          </tr>
	        <tr>
	          <td height="33" align="right">科室：</td>
	          <td align="left"><input type="text" id="department"  fieldmaxlength="50"/></td>
	          <td align="right">毕业院校：</td>
	          <td align="left"><input type="text" id="college"  fieldmaxlength="50"/></td>
	          <td align="right">所属学会：</td>
	          <td align="left"><input type="text" id="society"  fieldmaxlength="100"/></td>
	          </tr>
	        <tr>
	          <td height="31" align="right">擅长领域：</td>
	          <td colspan="2" align="left"><input type="text" id="skilled_fields"  fieldmaxlength="50"/></td>
	          <td>&nbsp;</td>
	          <td align="right">偏好学科：</td>
	          <td align="left"><input type="text" id="preference"  fieldmaxlength="255"/></td>
	          </tr>
	        <tr>
	          <td height="176" align="right" valign="top"><p>&nbsp;</p>
	            <p>简介：</p></td>
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
	          <td width="13%" height="32" align="right">积分值：</td>
	          <td width="11%" align="left"><input type="text" id="point"  notnull="true" fieldmaxlength="200" fieldstyle="float" value="0.0" disabled="disabled"/></td>
	          <td width="7%" align="right">注册时间：</td>
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
	          <td width="5%" align="right">曾用密码：</td>
	          <td width="48%" align="left"><input type="text" id="old_password"  fieldmaxlength="50" disabled="disabled"/></td>
	          </tr>
	        <tr>
	          <td height="33" align="right">学分值：</td>
	          <td align="left"><input type="text" id="credit" value="0.0" disabled="disabled"  notnull="true" fieldmaxlength="10" fieldstyle="float"/></td>
	          <td align="right">信息修改时间：</td>
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
	          <td width="13%" height="32" align="right">身份证号：</td>
	          <td width="11%" align="left"><input type="text" id="id_card_no"  fieldmaxlength="20"/></td>
	          <td width="6%" align="right">认证情况：</td>
	          <td width="14%" align="left"><select id="is_identify" name="is_identify">
	                <option value="0">否</option>
			                <option value="1">审核中</option>
			                <option value="2">已认证</option>
	              </select>
	          </td>
	          <td width="8%" align="right">联络员姓名：</td>
	          <td width="48%" align="left"><select id="liaisons" name="liaisons">
	            </select></td>
	          </tr>
	        <tr>
	          <td height="128" align="right">上传身份证图片：</td>
	          <td> <input type="hidden" id="idcard_img" name="idcard_img" />
	            <input type="button" value="上传身份证照片" onclick="openwindow('../util/upload.jsp?nameinput=idcard_imgshow&amp;valueinput=idcard_img','fileupload','428','246')" />
	            </input>
	            </td>
	          <td colspan="4" align="right"><span id="idcard_imgshow"></span></td>
	          </tr>
	        <tr>
	          <td height="146" align="right">上传证件图片：</td>
	          <td>      <input type="hidden" id="cert_img" name="cert_img" />
	            <input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=cert_imgshow&amp;valueinput=cert_img','fileupload','428','246')" />
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


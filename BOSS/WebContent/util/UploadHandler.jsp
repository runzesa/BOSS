<%@ page import="org.apache.commons.fileupload.*"  pageEncoding="GBK"%>
<%@page import="org.genius.data.ConfigParse"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="com.scand.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
	//�惦·��
	//String uploadFolder = "D:\\Temp";
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
	String filePath = ConfigParse.getFilePath();
	SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
	String dateStr = sf.format(new Date());
	String folderL1 = dateStr.substring(0, 2);
	String folderL2 = dateStr.substring(2, 4);
	String folderL3 = dateStr.substring(4, 6);
	
	File folderFileL1 = new File(filePath + "/" + folderL1);
	File folderFileL2 = new File(filePath + "/" + folderL1 + "/" + folderL2);
	File folderFileL3 = new File(filePath + "/" + folderL1 + "/" + folderL2 + "/" + folderL3);
	if (!folderFileL1.exists()) {
		folderFileL1.mkdir();
		//System.out.println(folderFileL1 + "�ļ��гɹ�");
	}
	if (!folderFileL2.exists()) {
		folderFileL2.mkdir();
		//System.out.println(folderFileL2 + "�ļ��гɹ�");
	}
	if (!folderFileL3.exists()) {
		folderFileL3.mkdir();
		//System.out.println(folderFileL3 + "�ļ��гɹ�");
	}
	// Check that we have a file upload request
	boolean isMultipart = FileUpload.isMultipartContent(request);

	String files = "";
	if (!isMultipart) {
		out.println("Use multipart form to upload a file!");
	} else {
		String fileId = request.getParameter("sessionId").toString().trim();

		//�������ݹ���
		FileItemFactory factory = new ProgressMonitorFileItemFactory(request, fileId);
		ServletFileUpload upload = new ServletFileUpload(factory);

		//����������л��Ҫ�ϴ�����
		List /* FileItem */items = upload.parseRequest(request);

		//���������ϴ���FileItem
		Iterator iter = items.iterator();
		String filedir = folderL1 + folderL2 + folderL3;
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			if (item.isFormField()) {
				//����Ǳ������ٴ˴�����
			} else {
				//�����ϴ��ļ�
				String fieldName = item.getFieldName();
	
				String fileName = item.getName();

				System.out.println(URLDecoder.decode(fileName,"GBK"));
				//System.out.println(URLDecoder.decode(fileName,"utf-8"));
				//System.out.println(URLDecoder.decode(fileName,"iso-8859-1"));
				fileName = URLDecoder.decode(fileName,"GBK");
				
				
				int i2 = fileName.lastIndexOf("\\");
				if (i2 > -1)
					fileName = fileName.substring(i2 + 1);
				File dirs = folderFileL3;

				String tems = fileName.substring(0, fileName.lastIndexOf("."));
				String houzhui = fileName.substring(fileName.lastIndexOf("."));
				//�ļ���
				fileName = tems + houzhui;
				//��Ҫ�жϺ�׺����ȡ�����˴�������else��ע��,�޸��ж�����
				//if(houzhui.equals(".jpg") || houzhui.equals(".gif") || houzhui.equals(".png") || houzhui.equals(".bmp") || houzhui.equals(".JPG") || houzhui.equals(".GIF") || houzhui.equals(".PNG") || houzhui.equals(".BMP")){
				File uploadedFile = new File(dirs, fileName);
				
				if(uploadedFile.exists()){
					File checkFile = null;
					for(int i = 1; i < 2000; i++){
						checkFile = new File(dirs, tems + " " + i + houzhui);
						if(!checkFile.exists()){
							uploadedFile.renameTo(new File(dirs, tems + " " + i + houzhui));
							fileName = tems + " " + i + houzhui;
							break;
						}
					}
				}
				
				//System.out.println("prototype :" + uploadedFile.getName() + " - " + uploadedFile.exists());
				item.write(uploadedFile);
				session.setAttribute("FileUpload.Progress." + fileId, "-1");
				files += fileName + "," + filedir + ";";
				//}else{
				//����׺����������ִ�д˴�����
				//session.setAttribute("FileUpload.Progress."+fileId,"-2");
				//}
			}
		}
	}
%>

<%@page import="java.net.URLDecoder"%>
<script type="text/javascript">
var nameinput = "<%=request.getParameter("nameinput")%>";
var valueinput = "<%=request.getParameter("valueinput")%>";
	window.parent.opener.document.getElementById(valueinput).value += "<%=files%>";
	window.parent.opener.document.getElementById(nameinput).innerHTML += "<span id=\"<%=files%>\"><br/>"+
		"&nbsp;<a href=\"#\" onclick=\"window.open('../util/download.jsp?path=<%=files%>','','location=no,toolbar=no,status=no');\"><%=files.split(",")[0]%></a> &nbsp;&nbsp;"+ 
		"<a href=\"#\" onclick=\"var val = document.getElementById('"+valueinput+"').value;document.getElementById('"+valueinput+"').value=val.substr(0,val.indexOf('<%=files%>'))+''+val.substr(val.indexOf('<%=files%>')+'<%=files%>'.length);document.getElementById('<%=files%>').style.display='none';\" title=\"ɾ��\"><img src='../images/upload/upload_del.png'></img></a></span>"
	;
</script>

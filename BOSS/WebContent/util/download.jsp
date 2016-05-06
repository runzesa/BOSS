<%@ page contentType="text/html; charset=gb2312"%>
<%@ page language="java" import="java.util.*,java.io.*"%>
<%@ page language="java" import="org.genius.data.ConfigParse" %>
<%
	request.setCharacterEncoding("gb2312");

	String pathFolder = new String(request.getParameter("path")) ;

	String[] fileName = pathFolder.split(",");
	String PathHead = ConfigParse.getFilePath();
	String folderL1 = fileName[1].substring(0,2);
	String folderL2 = fileName[1].substring(2,4);
	String folderL3 = fileName[1].substring(4,6);
	String realPath = PathHead + "/" + folderL1 + "/" + folderL2 + "/" + folderL3 + "/" + fileName[0];
	String realPathFix = new String(realPath.getBytes("iso-8859-1"),"gbk");
	File file = null;
	try{
		file = new File(realPathFix);
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream os = response.getOutputStream();
    	response.setContentType("application/octet-stream");
	    response.setHeader("Content-disposition", "attachment; filename=" 
	    		+ new String(file.getName().getBytes("GBK"),"iso-8859-1"));
	    byte[] buffer = new byte[1024];
	    try{
 		   	while(bis.read(buffer) != -1){
 		   		os.write(buffer);
	    	}
		}catch(Exception e){}
		try{
			os.flush();
		}catch(Exception e){}
			bis.close();
			os=null;
		try{
 			response.flushBuffer();
		}catch(Exception e){}
		out.clear();
		out = pageContext.pushBody();
	}catch(Exception e){
		System.out.println("\""+realPathFix+"\" 文件下载失败");
		response.getWriter().print("下载失败，未找到指定资源.");
	}
%>

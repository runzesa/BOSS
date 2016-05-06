package com.genius.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.genius.data.ConfigParse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadFile implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	
		String nameInput=request.getParameter("nameinput");
		String valueInput=request.getParameter("valueinput");
		
		String filePath = ConfigParse.getFilePath();
		int fileMax = 3 * 20 * 1024 * 1024;
		
		SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
		String dateStr = sf.format(new Date());
		String folderL1 = dateStr.substring(0,2);
		String folderL2 = dateStr.substring(2,4);
		String folderL3 = dateStr.substring(4,6);
		
		File folderFileL1 = new File(filePath + "/" + folderL1);
		File folderFileL2 = new File(filePath + "/" + folderL1 + "/" + folderL2);
		File folderFileL3 = new File(filePath + "/" + folderL1 + "/" + folderL2 + "/" + folderL3);
		
		if(!folderFileL1.exists()){
			folderFileL1.mkdir();
			System.out.println(folderFileL1+"文件夹成功");
		}
		if(!folderFileL2.exists()){
			folderFileL2.mkdir();
			System.out.println(folderFileL2+"文件夹成功");
		}
		if(!folderFileL3.exists()){
			folderFileL3.mkdir();
			System.out.println(folderFileL3+"文件夹成功");
		}
		
		MultipartRequest multi = new MultipartRequest(request, folderFileL3.toString(),
				fileMax, "GBK", new DefaultFileRenamePolicy());
		String oldFileStr = "";
		String oldFileName[] = multi.getParameterValues("file0show");
		if(oldFileName!=null){
			for(int i=0;i<oldFileName.length;++i){
				oldFileStr = oldFileStr + oldFileName[i] + ";";
			}
		}
		String fileName = "";
		String file0value[] = multi.getParameterValues("file0");
		if(file0value!=null){
			for(int i = 0;i<file0value.length;++i){
				fileName = fileName + file0value[i] + ";";
			}
		}
		ArrayList fileList = new ArrayList();
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			FileBean fileBean = new FileBean();
			String name = (String) files.nextElement();
			String filename = multi.getFilesystemName(name);
			String originalFilename = multi.getOriginalFileName(name);
			String type = multi.getContentType(name);
			File f = multi.getFile(name);
			if (f != null) {
				fileBean.setName(filename);
				fileBean.setOriginalName(originalFilename);
				fileBean.setType(type);
				fileBean.setLength(String.valueOf(f.length()));
				fileBean.setFolder(dateStr);
				fileList.add(fileBean);
			}
		}

		request.setAttribute("fileName", fileName);
		request.setAttribute("oldFile", oldFileStr);
		request.setAttribute("fileList", fileList);
		request.setAttribute("nameinput", nameInput);
		request.setAttribute("valueinput", valueInput);

		return new ModelAndView("uploadok.jsp");
	}
}

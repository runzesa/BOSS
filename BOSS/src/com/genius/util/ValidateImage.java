package com.genius.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public final class ValidateImage implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//在内存中创建图象   
		int iWidth = 65, iHeight = 25;
		BufferedImage image = new BufferedImage(iWidth, iHeight,
				BufferedImage.TYPE_INT_RGB);
		//获取图形上下文   
		Graphics g = image.getGraphics();
		//设定背景色   
		g.setColor(getRandColor(230,255));
		g.fillRect(0, 0, iWidth, iHeight);
		//画边框   
		g.setColor(Color.black);
		g.drawRect(0, 0, iWidth - 1, iHeight - 1);
		//取随机产生的认证码(4位数字)   
		String rand = request.getParameter("rand");
		rand = rand.substring(0, rand.indexOf("."));
		switch (rand.length()) {
		case 1:
			rand = "000" + rand;
			break;
		case 2:
			rand = "00" + rand;
			break;
		case 3:
			rand = "0" + rand;
			break;
		default:
			rand = rand.substring(0, 4);
			break;
		}
		//将认证码存入SESSION   
		session.setAttribute("rand", rand);
		//将认证码显示到图象中   
		
		g.setFont(new Font("Times New Roman", Font.PLAIN, 22));
		for(int i=0;i<4;++i){
			char rchar = rand.charAt(i);
			Random random = new Random();
			g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
			g.drawString(String.valueOf(rchar), 10+i*11+random.nextInt(3), 18+random.nextInt(6));
		}
		
		//随机产生200个干扰点,使图象中的认证码不易被其它程序探测到   
		Random random = new Random();
		for (int iIndex = 0; iIndex < 150; iIndex++) {
			int x = random.nextInt(iWidth);
			int y = random.nextInt(iHeight);
			g.drawLine(x, y, x, y);
		}
		//图象生效   
		g.dispose();
		//输出图象到页面   
		ImageIO.write(image, "JPEG", response.getOutputStream());

		return null;
	}
	
	//给定范围获得随机颜色
	private Color getRandColor(int fc,int bc){	
		Random random = new Random();
		if(fc>255) fc=255;
		if(bc>255) bc=255;
		int r=fc+random.nextInt(bc-fc);
		int g=fc+random.nextInt(bc-fc);
		int b=fc+random.nextInt(bc-fc);
		return new Color(r,g,b);
	}
}

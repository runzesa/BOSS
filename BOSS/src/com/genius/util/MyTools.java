/*
 * @version  2016-3-30
 *
 * @author LiuRunze
 * 
 * Copyright LiuRunze . All rights reserved.
 * 
 */
package com.genius.util;

import java.util.*;
public class MyTools
{
	public String uploadName(String name)
	{
		String rname = "";
		
		if(name.equals(""))
		{
			
		}else{
			
			String[] temp = name.split(";");
			
			for( int i = 0;i < temp.length;i++)
			{
				String[] dh = temp[i].split(",");
				String dh11 = dh[1].substring(0,2);
				String dh12 = dh[1].substring(2,4);
				String dh13 = dh[1].substring(4,6);
				String dhNew = "20" +dh11 +"/" + dh12 + "/" + dh13 + "/";
				String newVel = dhNew + dh[0];
				rname = rname + newVel + ",";
			}
			
		}
		//去掉字符创最后的逗号
	    rname = rname.substring(0,rname.length()-1);
		return rname;
	}
}
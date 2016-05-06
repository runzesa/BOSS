package com.workflow.util.bak;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间转换类
 */
public class ChangeDatetime {
	
	public static String getDuration(Long duration){
		String result = "";
		if(duration==0L)
			return "--";
		Long du = duration / 1000;
		long day = du / (24 * 3600);
	    long hour = du % (24 * 3600) / 3600;
	    long minute = du % 3600 / 60;
//	    long second = du % 60 / 60;
	    if(day != 0)
	    	result = day + "天";
	    if(hour != 0)
	    	result += hour + "小时";
	    if(minute != 0)
	    	result += minute + "分";
	    if(result == "")
	    	result = "少于1分钟";
		return result;
	}
	
	public static String showDatetime(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss");
		if(date!=null)
			return sdf.format(date);
		else
			return "";
	}
	
	public static void main(String[] args){
		String a = getDuration(89603961L);
		System.out.println(a);
	}
}


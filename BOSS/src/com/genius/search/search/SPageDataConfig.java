/*
 * Copyright GuanHui . All rights reserved.
 */
package com.genius.search.search;
import org.genius.data.*;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 该类用于分页时的数据连接
 * 
 */
public class SPageDataConfig extends DataConfig implements IPageDataConfig {

	public static final int DEFAULT_PAGE_SIZE = 20;

	private int pageSize = DEFAULT_PAGE_SIZE; // 每页记录数

	private int totalSize; // 数据库中总记录条数

	private int start; // 本页数据在数据库中的起始位置

	private int pageNo; // 当前页码

	private int totalPageCount; // 总页数

	/**
	 * @return 返回 数据库中总记录条数
	 */
	public int getTotalSize() {
		return totalSize;
	}
	
	/**
	 * @return 返回 总页数
	 */
	public int getTotalPageCount() {
		if(pageSize == 0){
			return 0;
		}else{
			return (totalSize + pageSize - 1) / pageSize;
		}
	}

	/**
	 * 空构造方法，用于使用Spring时初始化
	 * 
	 */
	public SPageDataConfig() {

	}

	/**
	 * 构造方法，用于在逻辑类中使用分页的地方调用，以替代DataConfig
	 * 
	 * @param pageSize
	 *            每页记录数
	 * @param pageNo
	 *            当前页码
	 */
	public SPageDataConfig(int pageSize, int pageNo) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		start = (pageNo - 1) * pageSize + 1;
		if (start < 1) {
			start = 1;
		}
	}

	/**
	 * 构造方法，用于在使用分页显示的类中调用，以初始化参数
	 * 
	 * @param totalSize
	 *            数据库中总记录条数
	 * @param pageSize
	 *            每页记录数
	 * @param pageNo
	 *            当前页码
	 */
	public SPageDataConfig(int totalSize, int pageSize, int pageNo) {
		this.totalSize = totalSize;
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPageCount = (totalSize + pageSize - 1) / pageSize;
	}

	/**
	 * 相当于构造函数，用于使用接口编程时调用， 用于在逻辑类中使用分页的地方调用，以替代DataConfig
	 * 
	 * @param pageSize
	 *            每页记录数
	 * @param pageNo
	 *            当前页码
	 */
	public void init(int pageSize, int pageNo) {
		super.init();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		start = (pageNo - 1) * pageSize + 1;
		if (start < 1) {
			start = 1;
		}
	}

	/**
	 * 相当于构造函数，用于使用接口编程时调用， 用于在使用分页显示的类中调用，以初始化参数
	 * 
	 * @param totalSize
	 *            数据库中总记录条数
	 * @param pageSize
	 *            每页记录数
	 * @param pageNo
	 *            当前页码
	 */
	public void init(int totalSize, int pageSize, int pageNo) {
		this.totalSize = totalSize;
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPageCount = (totalSize + pageSize - 1) / pageSize;

	}

	/*
	 * （非 Javadoc） 覆写DataConfig中的executeQuery类
	 * 
	 * @see org.genius.data.DataConfig#executeQuery(java.lang.String)
	 */
	public ResultSet executeQuery(String sql) throws SQLException {
		String countSql;
		StringBuffer querySql = new StringBuffer();

		countSql = "select count(*) as count from ( " + sql + ") ";
		
		countSql+=" r";
//		System.out.println("555555555555"+countSql);
		
		
		ResultSet countRs = super.executeQuery(countSql);
		while (countRs.next()) {
			totalSize = countRs.getInt("count");
		}
		countRs.close();


		querySql.append(
				"select * from (select my_table.*,Row_Number() over(order by (select top 1 a.name from syscolumns a,sysobjects b where a.id=b.id and b.name='my_table')) as my_rownum from(")
				.append(sql).append(") my_table )u where my_rownum between ")
				.append(start).append(" and ").append(start + pageSize -1);
		
	//	System.out.println("ERROR:"+querySql.toString());
		ResultSet rs = super.executeQuery(querySql.toString());
		return rs;
	}
   //TODO:hh
	
	/**
	 * 专用于SqlServer数据库的分页方法
	 * 
	 * @param sql
	 *            sql语句中不能出现order by子句
	 * @param key
	 *            主键
	 * @param order
	 *            排序字段
	 * @param asc
	 *            true为正序，false为倒序
	 * @return
	 * @throws SQLException
	 */
	public ResultSet executeQueryForSqlServer(String sql, String key,
			String order, boolean asc) throws SQLException {
		String countSql;
		StringBuffer querySql = new StringBuffer();

		countSql = "select count(*) as count from ( " + sql + ") my_table ";
		ResultSet countRs = super.executeQuery(countSql);
		while (countRs.next()) {
			totalSize = countRs.getInt("count");
		}
		countRs.close();

		if (pageSize * pageNo > totalSize) {
			pageSize = totalSize % pageSize;
		}
		if (order == null || order.equals(key)) {
			if (asc == true) {
				querySql.append("select top ").append(pageSize).append(
						" * from (select top ").append(pageSize).append(
						" * from (select top ").append(start + pageSize - 1)
						.append(" * from (").append(sql).append(
								") my_table order by ").append(key).append(
								" asc) my_table1 order by ").append(order)
						.append(" desc) my_table2 order by ").append(key)
						.append(" asc");
			} else {
				querySql.append("select top ").append(pageSize).append(
						" * from (select top ").append(pageSize).append(
						" * from (select top ").append(start + pageSize - 1)
						.append(" * from (").append(sql).append(
								") my_table order by ").append(key).append(
								" desc) my_table1 order by ").append(order)
						.append(" asc) my_table2 order by ").append(key)
						.append(" desc");
			}
		} else {
			if (asc == true) {
				querySql.append("select top ").append(pageSize).append(
						" * from (select top ").append(pageSize).append(
						" * from (select top ").append(start + pageSize - 1)
						.append(" * from (").append(sql).append(
								") my_table order by ").append(order).append(
								" asc,").append(key).append(
								" asc) my_table1 order by ").append(order)
						.append(" desc,").append(key).append(
								" desc) my_table2 order by ").append(order)
						.append(" asc,").append(key).append(" asc");
			} else {
				querySql.append("select top ").append(pageSize).append(
						" * from (select top ").append(pageSize).append(
						" * from (select top ").append(start + pageSize - 1)
						.append(" * from (").append(sql).append(
								") my_table order by ").append(order).append(
								" desc,").append(key).append(
								" asc) my_table1 order by ").append(order)
						.append(" asc,").append(key).append(
								" desc) my_table2 order by ").append(order)
						.append(" desc,").append(key).append(" asc");
			}
		}

		ResultSet rs = super.executeQuery(querySql.toString());
		return rs;
	}

	/**
	 * 生成分页显示的字符串
	 * 
	 * @param url
	 * @return
	 */
	public String getToolbar(String url) {
		StringBuffer toolbar = new StringBuffer();

		toolbar.append("共计" + totalSize + "条，" + totalPageCount + "页  ");
		if (totalPageCount == 0) {
			toolbar.append("当前第0页  首页  | 上一页 | 下一页 | 末页");
		} else {
			toolbar.append("当前第" + pageNo + "页  ");

			if (pageNo == 1) {
				toolbar.append("首页  | 上一页 | ");
			} else {
				toolbar.append("<a href='" + url + "&pageNo=1'>首页</a> | ");
				toolbar.append("<a href='" + url + "&pageNo=" + (pageNo - 1)
						+ "'>上一页</a> | ");
			}

			if (pageNo == totalPageCount) {
				toolbar.append("下一页 | 末页");
			} else {
				toolbar.append("<a href='" + url + "&pageNo=" + (pageNo + 1)
						+ "'>下一页</a> |");
				toolbar.append("<a href='" + url + "&pageNo=" + totalPageCount
						+ "'>末页</a>");
			}
		}
		return toolbar.toString();
	}

	/**
	 * 生成ajax下翻页的字符串
	 * 
	 * @param url
	 * @return
	 */
	public String getPageBar(String url) {
		StringBuffer pageBar = new StringBuffer();

		pageBar.append("每页" + pageSize + "条/共" + totalSize + "条 ");
		if (totalPageCount == 0) {
			pageBar
					.append("第0页/共" + totalPageCount
							+ "页  首页  | 上一页 | 下一页 | 末页");
		} else {
			pageBar.append("第" + pageNo + "页/共" + totalPageCount + "页  ");

			if (pageNo == 1) {
				pageBar.append("首页  | 上一页 | ");
			} else {
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=1')\">首页</a> | ");
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=" + (pageNo - 1) + "')\">上一页</a> | ");
			}

			if (pageNo == totalPageCount) {
				pageBar.append("下一页 | 末页");
			} else {
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=" + (pageNo + 1) + "')\">下一页</a> | ");
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=" + totalPageCount + "')\">末页</a>");
			}
		}
		return pageBar.toString();
	}

	/**
	 * 生成ajax下使用图片形式翻页的字符串
	 * 
	 * @param url
	 * @return
	 */
	public String getImagePageBar(String url) {
		StringBuffer pageBar = new StringBuffer();

		String fieldCount = "&nbsp;每页" + pageSize + "条/共" + totalSize + "条 ";
		if (pageNo > totalPageCount) {
			pageNo = totalPageCount;
		}
		//System.out.println("123123123123");
		String pageCount = "&nbsp;第" + pageNo + "页/共" + totalPageCount + "页  ";

		if (totalPageCount == 0) {
			pageBar
					.append(
							"<img src='../images/blue/page-first.gif' style='margin:-2px;' title='首页'>")
					.append(
							"&nbsp;<img src='../images/blue/page-prev.gif' style='margin:-2px;' title='上一页'>")
					.append(fieldCount)
					.append("&nbsp;第0页/共" + totalPageCount + "页 ")
					.append(
							"&nbsp;<img src='../images/blue/page-next.gif' style='margin:-2px;' title='下一页'>")
					.append(
							"&nbsp;<img src='../images/blue/page-last.gif' style='margin:-2px;' title='末页'>");
		} else {

			if (pageNo == 1) {
				pageBar
						.append(
								"<img src='../images/blue/page-first.gif' style='margin:-2px;' title='首页'>")
						.append(
								"&nbsp;<img src='../images/blue/page-prev.gif' style='margin:-2px;' title='上一页'>");
			} else {
				pageBar
						.append(
								"<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo=1')\"><img src='../images/blue/page-first.gif' style='margin:-2px;' title='首页'></a>")
						.append(
								"&nbsp;<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo="
										+ (pageNo - 1)
										+ "')\"><img src='../images/blue/page-prev.gif' style='margin:-2px;' title='上一页'></a>");

			}
			pageBar.append(fieldCount);
			pageBar.append(pageCount);

			if (pageNo == totalPageCount) {
				pageBar
						.append(
								"&nbsp;<img src='../images/blue/page-next.gif' style='margin:-2px;' title='下一页'>")
						.append(
								"&nbsp;<img src='../images/blue/page-last.gif' style='margin:-2px;' title='末页'>");
			} else {
				pageBar
						.append(
								"&nbsp;<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo="
										+ (pageNo + 1)
										+ "')\"><img src='../images/blue/page-next.gif' style='margin:-2px;' title='下一页'></a>")
						.append(
								"&nbsp;<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo="
										+ totalPageCount
										+ "')\"><img src='../images/blue/page-last.gif' style='margin:-2px;' title='末页'></a>");
			}
		}
		return pageBar.toString();
	}

}
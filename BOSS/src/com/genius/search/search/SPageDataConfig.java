/*
 * Copyright GuanHui . All rights reserved.
 */
package com.genius.search.search;
import org.genius.data.*;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * �������ڷ�ҳʱ����������
 * 
 */
public class SPageDataConfig extends DataConfig implements IPageDataConfig {

	public static final int DEFAULT_PAGE_SIZE = 20;

	private int pageSize = DEFAULT_PAGE_SIZE; // ÿҳ��¼��

	private int totalSize; // ���ݿ����ܼ�¼����

	private int start; // ��ҳ���������ݿ��е���ʼλ��

	private int pageNo; // ��ǰҳ��

	private int totalPageCount; // ��ҳ��

	/**
	 * @return ���� ���ݿ����ܼ�¼����
	 */
	public int getTotalSize() {
		return totalSize;
	}
	
	/**
	 * @return ���� ��ҳ��
	 */
	public int getTotalPageCount() {
		if(pageSize == 0){
			return 0;
		}else{
			return (totalSize + pageSize - 1) / pageSize;
		}
	}

	/**
	 * �չ��췽��������ʹ��Springʱ��ʼ��
	 * 
	 */
	public SPageDataConfig() {

	}

	/**
	 * ���췽�����������߼�����ʹ�÷�ҳ�ĵط����ã������DataConfig
	 * 
	 * @param pageSize
	 *            ÿҳ��¼��
	 * @param pageNo
	 *            ��ǰҳ��
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
	 * ���췽����������ʹ�÷�ҳ��ʾ�����е��ã��Գ�ʼ������
	 * 
	 * @param totalSize
	 *            ���ݿ����ܼ�¼����
	 * @param pageSize
	 *            ÿҳ��¼��
	 * @param pageNo
	 *            ��ǰҳ��
	 */
	public SPageDataConfig(int totalSize, int pageSize, int pageNo) {
		this.totalSize = totalSize;
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPageCount = (totalSize + pageSize - 1) / pageSize;
	}

	/**
	 * �൱�ڹ��캯��������ʹ�ýӿڱ��ʱ���ã� �������߼�����ʹ�÷�ҳ�ĵط����ã������DataConfig
	 * 
	 * @param pageSize
	 *            ÿҳ��¼��
	 * @param pageNo
	 *            ��ǰҳ��
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
	 * �൱�ڹ��캯��������ʹ�ýӿڱ��ʱ���ã� ������ʹ�÷�ҳ��ʾ�����е��ã��Գ�ʼ������
	 * 
	 * @param totalSize
	 *            ���ݿ����ܼ�¼����
	 * @param pageSize
	 *            ÿҳ��¼��
	 * @param pageNo
	 *            ��ǰҳ��
	 */
	public void init(int totalSize, int pageSize, int pageNo) {
		this.totalSize = totalSize;
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPageCount = (totalSize + pageSize - 1) / pageSize;

	}

	/*
	 * ���� Javadoc�� ��дDataConfig�е�executeQuery��
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
	 * ר����SqlServer���ݿ�ķ�ҳ����
	 * 
	 * @param sql
	 *            sql����в��ܳ���order by�Ӿ�
	 * @param key
	 *            ����
	 * @param order
	 *            �����ֶ�
	 * @param asc
	 *            trueΪ����falseΪ����
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
	 * ���ɷ�ҳ��ʾ���ַ���
	 * 
	 * @param url
	 * @return
	 */
	public String getToolbar(String url) {
		StringBuffer toolbar = new StringBuffer();

		toolbar.append("����" + totalSize + "����" + totalPageCount + "ҳ  ");
		if (totalPageCount == 0) {
			toolbar.append("��ǰ��0ҳ  ��ҳ  | ��һҳ | ��һҳ | ĩҳ");
		} else {
			toolbar.append("��ǰ��" + pageNo + "ҳ  ");

			if (pageNo == 1) {
				toolbar.append("��ҳ  | ��һҳ | ");
			} else {
				toolbar.append("<a href='" + url + "&pageNo=1'>��ҳ</a> | ");
				toolbar.append("<a href='" + url + "&pageNo=" + (pageNo - 1)
						+ "'>��һҳ</a> | ");
			}

			if (pageNo == totalPageCount) {
				toolbar.append("��һҳ | ĩҳ");
			} else {
				toolbar.append("<a href='" + url + "&pageNo=" + (pageNo + 1)
						+ "'>��һҳ</a> |");
				toolbar.append("<a href='" + url + "&pageNo=" + totalPageCount
						+ "'>ĩҳ</a>");
			}
		}
		return toolbar.toString();
	}

	/**
	 * ����ajax�·�ҳ���ַ���
	 * 
	 * @param url
	 * @return
	 */
	public String getPageBar(String url) {
		StringBuffer pageBar = new StringBuffer();

		pageBar.append("ÿҳ" + pageSize + "��/��" + totalSize + "�� ");
		if (totalPageCount == 0) {
			pageBar
					.append("��0ҳ/��" + totalPageCount
							+ "ҳ  ��ҳ  | ��һҳ | ��һҳ | ĩҳ");
		} else {
			pageBar.append("��" + pageNo + "ҳ/��" + totalPageCount + "ҳ  ");

			if (pageNo == 1) {
				pageBar.append("��ҳ  | ��һҳ | ");
			} else {
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=1')\">��ҳ</a> | ");
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=" + (pageNo - 1) + "')\">��һҳ</a> | ");
			}

			if (pageNo == totalPageCount) {
				pageBar.append("��һҳ | ĩҳ");
			} else {
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=" + (pageNo + 1) + "')\">��һҳ</a> | ");
				pageBar.append("<a href='#' onclick=\"pageTurn('" + url
						+ "&pageNo=" + totalPageCount + "')\">ĩҳ</a>");
			}
		}
		return pageBar.toString();
	}

	/**
	 * ����ajax��ʹ��ͼƬ��ʽ��ҳ���ַ���
	 * 
	 * @param url
	 * @return
	 */
	public String getImagePageBar(String url) {
		StringBuffer pageBar = new StringBuffer();

		String fieldCount = "&nbsp;ÿҳ" + pageSize + "��/��" + totalSize + "�� ";
		if (pageNo > totalPageCount) {
			pageNo = totalPageCount;
		}
		//System.out.println("123123123123");
		String pageCount = "&nbsp;��" + pageNo + "ҳ/��" + totalPageCount + "ҳ  ";

		if (totalPageCount == 0) {
			pageBar
					.append(
							"<img src='../images/blue/page-first.gif' style='margin:-2px;' title='��ҳ'>")
					.append(
							"&nbsp;<img src='../images/blue/page-prev.gif' style='margin:-2px;' title='��һҳ'>")
					.append(fieldCount)
					.append("&nbsp;��0ҳ/��" + totalPageCount + "ҳ ")
					.append(
							"&nbsp;<img src='../images/blue/page-next.gif' style='margin:-2px;' title='��һҳ'>")
					.append(
							"&nbsp;<img src='../images/blue/page-last.gif' style='margin:-2px;' title='ĩҳ'>");
		} else {

			if (pageNo == 1) {
				pageBar
						.append(
								"<img src='../images/blue/page-first.gif' style='margin:-2px;' title='��ҳ'>")
						.append(
								"&nbsp;<img src='../images/blue/page-prev.gif' style='margin:-2px;' title='��һҳ'>");
			} else {
				pageBar
						.append(
								"<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo=1')\"><img src='../images/blue/page-first.gif' style='margin:-2px;' title='��ҳ'></a>")
						.append(
								"&nbsp;<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo="
										+ (pageNo - 1)
										+ "')\"><img src='../images/blue/page-prev.gif' style='margin:-2px;' title='��һҳ'></a>");

			}
			pageBar.append(fieldCount);
			pageBar.append(pageCount);

			if (pageNo == totalPageCount) {
				pageBar
						.append(
								"&nbsp;<img src='../images/blue/page-next.gif' style='margin:-2px;' title='��һҳ'>")
						.append(
								"&nbsp;<img src='../images/blue/page-last.gif' style='margin:-2px;' title='ĩҳ'>");
			} else {
				pageBar
						.append(
								"&nbsp;<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo="
										+ (pageNo + 1)
										+ "')\"><img src='../images/blue/page-next.gif' style='margin:-2px;' title='��һҳ'></a>")
						.append(
								"&nbsp;<a href='#' onclick=\"pageTurn('"
										+ url
										+ "&pageNo="
										+ totalPageCount
										+ "')\"><img src='../images/blue/page-last.gif' style='margin:-2px;' title='ĩҳ'></a>");
			}
		}
		return pageBar.toString();
	}

}
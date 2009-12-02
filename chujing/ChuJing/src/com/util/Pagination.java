package com.util;

public class Pagination {
	private static int currentPage;
	private static int pageCount;
	public static int pageSize;
	private static int totalCount;
	public static int beginIndex;
	public static int endIndex;
	public static int next;
	public static int prev;
	
	public static boolean first;
	public static boolean last;

	public static void init(String current, int total,int size) {
		currentPage = (current == null)?1:Integer.parseInt(current);
		totalCount = total; 
		pageSize = size;
		pageCount = (int)Math.ceil((double)(totalCount)/pageSize);
		beginIndex = currentPage>1?(currentPage-1)*pageSize:0;
		endIndex = (currentPage*pageSize)>=totalCount?totalCount-1:(currentPage*pageSize-1);
		prev = currentPage>1?currentPage-1:1;
		next = endIndex == totalCount?currentPage:currentPage+1;
		first = currentPage>1?false:true;
		last = (currentPage*pageSize)>=totalCount?true:false;
	}
	
	/*
	 * url exmaple news.jsp
	 */
	public static String getURL(String url) {
		StringBuffer paginationStr = new StringBuffer("<div class='badoo'>");
		if(first)
			paginationStr.append("<span class='disabled'>< 上一页</span>");
		else
			paginationStr.append("<a href='#?page=qwer'>< 上一页 </a>");
		
		for(int i=1;i<pageCount+1;i++){
			if(currentPage == i){
				paginationStr.append("<span class='current'>");
				paginationStr.append(i);
				paginationStr.append("</span>");
			}else{
				paginationStr.append("<a href='#?page=");
				paginationStr.append(i);
				paginationStr.append("'>");
				paginationStr.append(i);
				paginationStr.append("</a>");
			}
		}
		paginationStr.append("");
		
		if(last)
			paginationStr.append("<span class='disabled'>下一页 > </span>");
		else
			paginationStr.append("<a href='#?page=uiop'>下一页 > </a>");
		paginationStr.append("</div>");
		/*String str ="<div class='badoo'><span class='disabled'>< Prev</span><span
		class='current'>1</span><a href='#?page=2' _fcksavedurl='#?page=2'>2</a><a
		href='#?page=3' _fcksavedurl='#?page=3'>3</a><a href='#?page=4'
		_fcksavedurl='#?page=4'>4</a><a href='#?page=5' _fcksavedurl='#?page=5'>5</a><a
		href='#?page=6' _fcksavedurl='#?page=6'>6</a><a href='#?page=7'
		_fcksavedurl='#?page=7'>7</a>...<a href='#?page=199'
		_fcksavedurl='#?page=199'>199</a><a href='#?page=200'
		_fcksavedurl='#?page=200'>200</a><a href='#?page=2'
		_fcksavedurl='#?page=2'>Next > </a></div>";
*/		
		String returnStr = paginationStr.toString();
		returnStr = returnStr.replaceAll("qwer", String.valueOf(prev));
		returnStr = returnStr.replaceAll("uiop", String.valueOf(next));
		return returnStr.replaceAll("#", url);
	}
	
	
	public static String getBackURL(String url) {
		StringBuffer paginationStr = new StringBuffer("<div class='badoo'>");
		if(first)
			paginationStr.append("<span class='disabled'>< 上一页</span>");
		else
			paginationStr.append("<a href='#&page=qwer'>< 上一页 </a>");
		
		for(int i=1;i<pageCount+1;i++){
			if(currentPage == i){
				paginationStr.append("<span class='current'>");
				paginationStr.append(i);
				paginationStr.append("</span>");
			}else{
				paginationStr.append("<a href='#&page=");
				paginationStr.append(i);
				paginationStr.append("'>");
				paginationStr.append(i);
				paginationStr.append("</a>");
			}
		}
		paginationStr.append("");
		
		if(last)
			paginationStr.append("<span class='disabled'>下一页 > </span>");
		else
			paginationStr.append("<a href='#&page=uiop'>下一页 > </a>");
		paginationStr.append("</div>");
		/*String str ="<div class='badoo'><span class='disabled'>< Prev</span><span
		class='current'>1</span><a href='#?page=2' _fcksavedurl='#?page=2'>2</a><a
		href='#?page=3' _fcksavedurl='#?page=3'>3</a><a href='#?page=4'
		_fcksavedurl='#?page=4'>4</a><a href='#?page=5' _fcksavedurl='#?page=5'>5</a><a
		href='#?page=6' _fcksavedurl='#?page=6'>6</a><a href='#?page=7'
		_fcksavedurl='#?page=7'>7</a>...<a href='#?page=199'
		_fcksavedurl='#?page=199'>199</a><a href='#?page=200'
		_fcksavedurl='#?page=200'>200</a><a href='#?page=2'
		_fcksavedurl='#?page=2'>Next > </a></div>";
*/		
		String returnStr = paginationStr.toString();
		returnStr = returnStr.replaceAll("qwer", String.valueOf(prev));
		returnStr = returnStr.replaceAll("uiop", String.valueOf(next));
		return returnStr.replaceAll("#", url);
	}
}

<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	
	<head>
		<title>销售记录</title>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
	</head>

	<body>
		<table id="table1">
	  <tr>
	    <td align="center">
	    	<%@include file="/WEB-INF/jsp/admin/top.jsp" %>
			<table id="table2">
	        <tr>
	          <td valign="top"><table width="494">
	            <tr>
	              <td width="45" height="25">&nbsp;</td>
	              <td width="437" valign="bottom"><font color="green">销售记录</font></td>
	            </tr>
	          </table></td>
	        </tr>
	      </table>
	      <table id="table3" height="436">
	        <tr>
	          <td height="243">
	            <div align="center">
		              <div>
		              	<table align="center" width="500">
		              	  <tr height="30">
		              	  	<th>序号</th>
		              	  	<th>已售书籍</th>
		              	  	<th>书籍价格</th>
		              	  	<th>售出数量</th>
		              	  	<th>总够价格</th>
		              	  </tr>
		              	  
			              <s:iterator value="sellbooks" id="sb" status="st">
			              <s:if test="#st.odd"><tr bgcolor="#99FFCC"></s:if>
			              <s:else><tr bgcolor="#CCFFFF"></s:else>
			              	<td align="center"><s:property value="#st.count"/>.</td>
			              	<td align="center"><a href="ProdSellCensus_toSellBook?id=${sb.bid }">${sb.sellbname }</a></td>
			              	<td align="center"><span>${sb.price }</span></td>
			              	<td align="center"><span>${sb.sellAmount }</span></td>
			              	<td align="center"><span>${sb.allprice }</span></td>
			              </tr>
			              </s:iterator>
			              <tr bgcolor="#99FFFF">
			              	<td colspan="2" align="right"><span>总够售出价格：</span></td>
			              	<td colspan="3" align="right"><span>${totalprice }</span></td>
			              </tr>
			            </table><br>
		              </div>
		              <div align="center">
		              <s:if test="page>1">
						<span class='list_r_title_text3a'>
							<a name=link_page_next
								href="ProdSellCensus_toSellBList?page=1">&nbsp;
							首页</a>
							<a name=link_page_next
								href="ProdSellCensus_toSellBList?page=${page-1}">
							上一页</a>
						</span>&nbsp;
						</s:if>
						<s:else>
						<span class='list_r_title_text3a'>首页&nbsp;上一页</span>&nbsp;
						</s:else>
							
						<span class='list_r_title_text3b'>
							第${page }页/共${maxPage }页
						</span>&nbsp;
							
						<s:if test="page < maxPage">
						<span class='list_r_title_text3a'>
							<a name=link_page_next
								href="ProdSellCensus_toSellBList?page=${page+1}">
								下一页</a>&nbsp;
							<a name=link_page_next
								href="ProdSellCensus_toSellBList?page=${maxPage }">
								尾页</a>
						</span>&nbsp;
						</s:if>
			
						<s:else>
						<span class='list_r_title_text3a'>下一页&nbsp;尾页</span>
						</s:else>
		              </div>
		         </div>
	          </td>
	        </tr>
	      </table>
	    </td>
	  </tr>
	</table>
	</body>
</html>

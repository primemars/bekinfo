<!--#include file="conn.asp" -->
<link rel="stylesheet" href="style.CSS">
<%
if request.cookies("username")="" then
   response.redirect "login.asp"
end if

dim pmcount,pageno
dim havecheck
pmcount=25

dim rs,sql
set rs=server.createobject("adodb.recordset")

if request("action")="del" then

		sql="delete from words where announceid="&request("id")
		conn.execute sql
		response.write "<center>留言成功删除了...</cetner>"

end if

if request("action")="check" then

		sql="update words set check=1 where announceid="&request("id")
		conn.execute sql
		response.write "<center>审核成功...</cetner>"

end if

if request("action")="uncheck" then

		sql="update words set check=0 where announceid="&request("id")
		conn.execute sql
		response.write "<center>取消成功...</cetner>"

end if

%>
<script language="JavaScript">
function ccheck(id,page){
var id;
if (confirm("你要审核这条留言吗？")){
	document.location.href="manage.asp?action=check&id="+id+"&pageno="+page;
	}
}
</script>
<script language="JavaScript">
function unccheck(id,page){
var id;
if (confirm("你要审核这条留言吗？")){
	document.location.href="manage.asp?action=uncheck&id="+id+"&pageno="+page;
	}
}
</script>
 <script language="JavaScript">
function cdel(id,page){
var id;
if (confirm("你真的要删除这条留言吗？")){
	document.location.href="manage.asp?action=del&id="+id+"&pageno="+page;
	}
}
</script>
<BR><BR>
<center><a href=logout.asp>注销我的登录</a></center><BR><BR>
<table width=90% align=center>
<tr bgcolor="DEE3F7"><td>ID</td><td width=90%>留言标题</td><td width="17">作者</td><td width="28">添加时间</td><TD width="16">管理</td></tr></tr>
 <%

	sql="select * from words order by announceid desc"

rs.open sql,conn,1,1

if pmcount="" or isempty(pmcount) or pmcount<1 then
        pmcount=25
end if
rs.pagesize=pmcount   	'设置每页数
mpage=rs.pagecount    	'得到总页数
pageno=request("pageno")
if isempty(pageno) or cint(pageno)<1 or cint(pageno)>mpage then
	pageno=1
end if


if rs.bof and rs.eof then
	response.write "<tr><td colspan='5'><div align='center'>没有新闻</div></td></tr>"
else

rs.absolutepage=pageno	'将指针移至指定页的第一条记录
loopno=pmcount

do while not rs.eof and loopno>0
%>

<TR><td><font size=3>·</font>
<%

if rs("check")=1 then
%>
<input type=checkbox checked>
<% else %>
<input type=checkbox>
<%
end if
%>
<%=rs("announceid")%>&nbsp;&nbsp;</td><td>
  <a href="list.asp?id=<%=rs("announceid")%>" target=_self><%=rs("body")%></a></td><td> [<%=rs("author")%>] </td><td>  <%=rs("adddate")%>&nbsp;<%=rs("addtime")%></td><td>
  <a href="javascript:cdel('<%=rs("announceid")%>','<%=pageno%>')">删除</a></td></tr>


  <%
rs.movenext
loopno=loopno-1
loop
end if
rs.close
set rs=Nothing
endconnection
%>
      </table>
      <table width="90%" border="0" cellspacing="2" cellpadding="2" align=center>
        <tr align="right"> 
          <td> 
            <%
if cint(pageno)>1 then%>
            [<a href='manage.asp?cataid=<%=cataid%>&pageno=<%=pageno-1%>'>上一页</a>] 
            <%
end if
if cint(pageno)<cint(mpage) then
%>
            [<a href='manage.asp?cataid=<%=cataid%>&pageno=<%=pageno+1%>'>下一页</a>] 
            <%end if%>
            共<%=cstr(pageno)&"/"&cstr(mpage)%>页 </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td colspan="2" valign="top"> 
     
    </td>
  </tr>
</table>                                                                    

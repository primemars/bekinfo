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
		response.write "<center>���Գɹ�ɾ����...</cetner>"

end if

if request("action")="check" then

		sql="update words set check=1 where announceid="&request("id")
		conn.execute sql
		response.write "<center>��˳ɹ�...</cetner>"

end if

if request("action")="uncheck" then

		sql="update words set check=0 where announceid="&request("id")
		conn.execute sql
		response.write "<center>ȡ���ɹ�...</cetner>"

end if

%>
<script language="JavaScript">
function ccheck(id,page){
var id;
if (confirm("��Ҫ�������������")){
	document.location.href="manage.asp?action=check&id="+id+"&pageno="+page;
	}
}
</script>
<script language="JavaScript">
function unccheck(id,page){
var id;
if (confirm("��Ҫ�������������")){
	document.location.href="manage.asp?action=uncheck&id="+id+"&pageno="+page;
	}
}
</script>
 <script language="JavaScript">
function cdel(id,page){
var id;
if (confirm("�����Ҫɾ������������")){
	document.location.href="manage.asp?action=del&id="+id+"&pageno="+page;
	}
}
</script>
<BR><BR>
<center><a href=logout.asp>ע���ҵĵ�¼</a></center><BR><BR>
<table width=90% align=center>
<tr bgcolor="DEE3F7"><td>ID</td><td width=90%>���Ա���</td><td width="17">����</td><td width="28">���ʱ��</td><TD width="16">����</td></tr></tr>
 <%

	sql="select * from words order by announceid desc"

rs.open sql,conn,1,1

if pmcount="" or isempty(pmcount) or pmcount<1 then
        pmcount=25
end if
rs.pagesize=pmcount   	'����ÿҳ��
mpage=rs.pagecount    	'�õ���ҳ��
pageno=request("pageno")
if isempty(pageno) or cint(pageno)<1 or cint(pageno)>mpage then
	pageno=1
end if


if rs.bof and rs.eof then
	response.write "<tr><td colspan='5'><div align='center'>û������</div></td></tr>"
else

rs.absolutepage=pageno	'��ָ������ָ��ҳ�ĵ�һ����¼
loopno=pmcount

do while not rs.eof and loopno>0
%>

<TR><td><font size=3>��</font>
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
  <a href="javascript:cdel('<%=rs("announceid")%>','<%=pageno%>')">ɾ��</a></td></tr>


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
            [<a href='manage.asp?cataid=<%=cataid%>&pageno=<%=pageno-1%>'>��һҳ</a>] 
            <%
end if
if cint(pageno)<cint(mpage) then
%>
            [<a href='manage.asp?cataid=<%=cataid%>&pageno=<%=pageno+1%>'>��һҳ</a>] 
            <%end if%>
            ��<%=cstr(pageno)&"/"&cstr(mpage)%>ҳ </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td colspan="2" valign="top"> 
     
    </td>
  </tr>
</table>                                                                    

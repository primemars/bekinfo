<!--#include file="conn.asp" -->
<%
dim rs,sql

sql="update words set hits=hits+1 where announceid="&cstr(request("id"))
conn.execute sql






set rs=server.createobject("adodb.recordset")
sql="select * from words where announceid="&cstr(request("id"))
rs.open sql,conn,1,1
if rs.bof and rs.eof then
	response.write "���������Ѿ�ɾ��..."
else
session("id")=rs("rootid")
session("orders")=rs("orders")
%>

<html>
<link rel="stylesheet" href="style.CSS">
<head>
<title>���Բ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FEF7ED" topmargin=0>
<TABLE bgColor=#2f6790 border=0 cellPadding=2 cellSpacing=2 width="100%">
  <TR>
    <TD>
     <font color=ffffff><a href=manage.asp><font color=ffffff>�������Բ�</a> -> �鿴����</font></TD>
  </TD></TR></TABLE></CENTER><BR>
   <TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%">
        
        <TR>
          <TD width=100%>
		  <table width=100%><TR><TD>
           ��ҵ��<%=rs("industry")%></td></tr>
		   <TR><TD>
		   ������<%=rs("name")%></td></tr>
		   <TR><TD>
		   ��ϵ�绰��<%=rs("tel")%></td></tr>
		   <TR><TD>
		   �����ʼ���<%=rs("email")%></td></tr>
		   <TR><TD>
		  ְλ��<%=rs("title")%></td></tr>
		   <TR><TD>
		  ��˾��<%=rs("company")%></td></tr>

       <tr>
          <TD><BR><center><table width=98% border=1 cellspacing=0 bgcolor=ffffff height=160><tr><td valign=top>            
          <BR><%=rs("body")%> 
<br>
<br><BR><BR></td></tr></table></TD></TR></TABLE>
<BR>
<BR>
 <center>[<a href=index.html>������ҳ</a>]
<BR><BR>
</body>
</html>
<%
rs.close
set rs=Nothing
end if
endconnection
%>                                                                    

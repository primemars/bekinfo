<!--#include file="conn.asp" -->

<%
dim rs_word,sql_word
dim rs,sql

function htmlencode(str)
	htmlencode=replace(replace(str,chr(13),"<br>"),"'","''")
end function


if request("action")="add" then

  set rs_words=server.createobject("adodb.recordset")

            sql_words="select * from words where announceid is null"
            rs_words.open sql_words,conn,1,3
			rs_words.addnew
			rs_words("industry")=request("industry")
			rs_words("name")=request("name")
			rs_words("tel")=request("tel")
			rs_words("email")=request("email")
			rs_words("title")=request("title")
			rs_words("company")=request("company")
			rs_words("body")=htmlencode(request("content"))
			rs_words("adddate")=date()
			rs_words("addtime")=time()
			rs_words.update
            rs_words("rootid")=rs_words("announceid")
			rs_words.update
			rs_words.close
  
			rs.close
			set rs=Nothing
			endconnection
			
           response.write("<meta http-equiv='refresh' content='1;URL=../contact.html'><br><br><center>谢谢您的留言，1秒钟内自动返回<br><br>如不能自动返回，请按<a href=contact.html>此处返回</a></center>")
            'response.redirect "index.htm"
end if
%>                                                                    

   <%
   dim conn   
  dim connstr   
   'on error resume next
   call conn_init()

   sub conn_init()
       'on error resume next

          connstr = "DBQ=" + server.mappath("#gbook.mdb") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
       set conn=server.createobject("ADODB.CONNECTION")
       if err.number<>0 then 
           err.clear
           set conn=nothing
		   response.write "数据库连接出错！"
		   Response.End
       else
		   'response.write connstr
		   conn.open connstr
           if err then 
              err.clear
              set conn=nothing
			   response.write "数据库连接出错！"
              Response.End 
           end if
       end if   
  end sub
	

Dim Ft_Post,Ft_Get,Ft_In,Ft_Inf,Ft_Xh,Ft_db,Ft_dbstr,Kill_IP,WriteSql
Ft_In = "'|exec |insert |delete |count |chr |mid |truncate |char |declare "
Kill_IP=True
WriteSql=True
Ft_Inf = split(Ft_In,"|")
If Request.Form<>"" Then
	For Each Ft_Post In Request.Form
		For Ft_Xh=0 To Ubound(Ft_Inf)
			If Instr(LCase(Request.Form(Ft_Post)),Ft_Inf(Ft_Xh))<>0 Then
				If WriteSql=True Then
					Response.Write "<Script Language=JavaScript>alert('请不要在参数中包含非法字符尝试注入！');</Script>"
					Response.Write "<Script Language=JavaScript>history.go(-1);</Script>"
					Response.End
				End If
			End If
		Next
	Next
End If
If Request.QueryString<>"" Then
	For Each Ft_Get In Request.QueryString
		For Ft_Xh=0 To Ubound(Ft_Inf)
			If Instr(replace(LCase(Request.QueryString(Ft_Get)),"<br><li>",""),Ft_Inf(Ft_Xh))<>0 Then
				If WriteSql=True Then
					Response.Write "<Script Language=JavaScript>alert('请不要在参数中包含非法字符尝试注入！');</Script>"
					Response.Write "<Script Language=JavaScript>history.go(-1);</Script>"
					Response.End
				End If
			End If
		Next
	Next
End If


sub endConnection()
      conn.close
      set conn=nothing
end sub
  
%>                                                                    

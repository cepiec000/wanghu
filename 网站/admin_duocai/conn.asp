<%
'---------------------------------------------flashack防止非法字符尝试注入---------------------------------------------------
	Dim flashack_Post,flashack_Get,flashack_In,flashack_Inf,flashack_Xh,flashack_db,flashack_dbstr,str
	flashack_In = "'※;※and※exec※insert※select※delete※update※count※*※%※chr※mid※master※truncate※char※declare" 
	flashack_Inf = split(flashack_In,"※") 
	'str=request.Form &Request.QueryString
	'response.Write str
	If Request.QueryString<>"" Then 
	For Each flashack_Get In Request.QueryString 
	For flashack_Xh=0 To Ubound(flashack_Inf) 
	If Instr(LCase(Request.QueryString(flashack_Get)),flashack_Inf(flashack_Xh))<>0 Then 
	Response.Write "<Script Language=JavaScript>alert('flashack防注入系统提示你↓\n\n请不要在参数中包含非法字符尝试注入');</Script>" 
	Response.Write "非法操作！flashack已经给你做了如下记录↓<br>" 
	Response.Write "操作IP："&Request.ServerVariables("REMOTE_ADDR")&"<br>" 
	Response.Write "操作时间："&Now&"<br>" 
	Response.Write "操作页面："&Request.ServerVariables("URL")&"<br>" 
	Response.Write "提交方式：GET<br>" 
	Response.Write "提交参数："&flashack_Get&"<br>" 
	Response.Write "提交数据："&Request.QueryString(flashack_Get) 
	Response.End 
	End If 
	Next 
	Next 
	End If
'-----------------------------------------------------完毕-----------------------------------------------------------------










'---------------------------------------------------数据库连接--------------------------------------------------------
	dim strconn,conn,rs
	set conn=server.createobject("adodb.connection")
	strconn="provider=Microsoft.jet.oledb.4.0;data source="&_
		server.MapPath("../database/#TFXK_.asa")
		conn.Open strconn
	set rs=server.CreateObject("adodb.recordset")
'----------------------------------------------------完毕-------------------------------------------------------------
%>   s2
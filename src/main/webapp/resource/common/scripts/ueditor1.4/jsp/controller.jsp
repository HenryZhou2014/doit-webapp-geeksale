<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.baidu.ueditor.ActionEnter" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );

	//String rootPath = application.getRealPath("D://zp16888/upload");

	String temp = new ActionEnter( request, rootPath ).exec();
	
	out.write( temp );

%>
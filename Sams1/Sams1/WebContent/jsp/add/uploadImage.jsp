<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.org.uta.sams.controller.ProgramController,java.org.uta.sams.beans.*,java.io.*"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <style type="text/css">
<!--
.formtable {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}
.width1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: normal;
	width: 180px;
}
.errorcode {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #FF0000;
}
.previousvalues {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #009900;
}
.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }
-->
</style>
    </head>
    <script>
        function yesFunction()
        {
        
        
        
        window.location.href = "uploadImage_Form.jsp?prg=<%=request.getParameter("prg")%>&term=<%=request.getParameter("term")%>";
        }
        
        function noFunction()
        {
        
        window.location.href = "../../jsp/user/welcome.jsp";
        
        }
    </script>
    <body>
<table valign="top" cellpadding="0"align="center" cellspacing="0" width='759'>
    <tr><td>
          <jsp:include page="/jsp/commons/header.jsp"/>
    </td></tr>
</table>    
 <table valign="top" align="center" width="759" cellspacing="0" cellpadding="0"><tr>
<td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="331">
 <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
              <jsp:include page="/jsp/commons/left.jsp"/>
            
 </td>
<td style="padding-left:5px">
    
  
    
    <%
 
    response.setContentType("text/html");
    response.setHeader("Cache-control","no-cache");
 
    String err = "";
 
    String lastFileName = "";
    String path = request.getContextPath();
    String contentType = request.getContentType();
    String boundary = "";
    final int BOUNDARY_WORD_SIZE = "boundary=".length();
    if(contentType == null || !contentType.startsWith("multipart/form-data")) {
      err = "Ilegal ENCTYPE : must be multipart/form-data\n";
      err += "ENCTYPE set = " + contentType;
    }else{
      boundary = contentType.substring(contentType.indexOf("boundary=") + BOUNDARY_WORD_SIZE);
      boundary = "--" + boundary;
      try {
        javax.servlet.ServletInputStream sis = request.getInputStream();
        byte[] b = new byte[1024];
        int x=0;
        int state=0;
        String name=null,fileName=null,contentType2=null;
        java.io.FileOutputStream buffer = null;
        while((x=sis.readLine(b,0,1024))>-1) {
          String s = new String(b,0,x);
          if(s.startsWith(boundary)) {
            state = 0;
            //out.println("name="+name+"<br>");
            //out.println(fileName+"<br>");
 
            name = null;
            contentType2 = null;
            fileName = null;
 
 
          }else if(s.startsWith("Content-Disposition") && state==0) {
            state = 1;
            if(s.indexOf("filename=") == -1)
              name = s.substring(s.indexOf("name=") + "name=".length(),s.length()-2);
            else {
              name = s.substring(s.indexOf("name=") + "name=".length(),s.lastIndexOf(";"));
              fileName = s.substring(s.indexOf("filename=") + "filename=".length(),s.length()-2);
              if(fileName.equals("\"\"")) {
                fileName = null;
              }else {
                String userAgent = request.getHeader("User-Agent");
                String userSeparator="/";  // default
                if (userAgent.indexOf("Windows")!=-1)
                  userSeparator="\\";
                if (userAgent.indexOf("Linux")!=-1)
                  userSeparator="/";
                fileName = fileName.substring(fileName.lastIndexOf(userSeparator)+1,fileName.length()-1);
                if(fileName.startsWith( "\""))
                  fileName = fileName.substring( 1);
              }
            }
            name = name.substring(1,name.length()-1);
            if (name.equals("file")) {
              if (buffer!=null)
                buffer.close();
              lastFileName = fileName;
              String img_path = session.getServletContext().getRealPath("/jsp/search/images");
              File fl = new File(img_path+"/"+fileName);
              buffer = new java.io.FileOutputStream(fl);
            }
          }else if(s.startsWith("Content-Type") && state==1) {
            state = 2;
            contentType2 = s.substring(s.indexOf(":")+2,s.length()-2);
          }else if(s.equals("\r\n") && state != 3) {
            state = 3;
          }else {
            if (name.equals("file")){
              buffer.write(b,0,x);
              System.out.println("Writing to file");
            }
          }
        }
        sis.close();
        buffer.close();
      }catch(java.io.IOException e) {
        err = e.toString();
      }
    }
    boolean ok = err.equals("");
    if(!ok) {
      out.println(err);
    }else{
    %>
<SCRIPT language="javascript">
  
</SCRIPT>
    


    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
   <table width="100%" border="0" cellspacing="5" name="formTable">
    <caption align="top" class="style1">
       <tr >
            <% String name=""; 
			if(session.getAttribute("user")!=null)name=((UserBean)session.getAttribute("user")).getUsername(); 
            name=request.getRemoteUser();
            %>
        <td  width="50%" bgcolor="#FFFFFF" ><span class="style1">Welcome <%=name%></span><span class="style2">.</span> </td>
        <td  width="50%" bgcolor="#FFFFFF" align="right" class="style1"><a href="/Sams/jsp/user/logoff.jsp">Sign Out </a></td>
      </tr>
	  <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>

    <tr><td align="center" colspan="2" class="style1">
      Image Upload Form
      </td></tr>
       <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
    </caption>
    <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
       <tr> <td colspan="2" class="style1">Sucessfully Uploaded <%      }    out.println(lastFileName); %> Image </td> </tr>
       
       
       <%
            
            ProgramController pc = new ProgramController();
            pc.addImage(request.getParameter("prg"),request.getParameter("term"),request.getParameter("position"),lastFileName);
            
            
            
            
      
%>
        <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
        <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
        </tr>
    
        <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
        <tr>  <td colspan="2" class="formtable">  Do you want to upload another image </td></tr>
        <tr>
              <td align="right">
              <input type="button" value="Yes" onclick="yesFunction();">
              </td>
              <td align="left">
              <input type="button" value="No" onclick="noFunction();">
              </td>
        </tr>
    </table>
    </td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.servlet.*,org.apache.commons.fileupload.disk.*,java.io.*,java.util.*" %>
<%
	System.out.println("go..");
	String path = "C:\\Work\\3.Temp\\upload\\";
	
    if (ServletFileUpload.isMultipartContent(request))
    {
    	FileItemFactory factory = new DiskFileItemFactory();
    	ServletFileUpload fileUpload = new ServletFileUpload(factory);
        fileUpload.setSizeMax(1024*1024*500);
        List fileItemList = fileUpload.parseRequest(request);
        
        System.out.println("file cnt:"+fileItemList.size());
        for (int i = 0; i < fileItemList.size(); i++){
        	FileItem fileItem = (FileItem)fileItemList.get(i);
        	File tmpFile = new File(path + System.currentTimeMillis()+ "_" + fileItem.getName());
        	fileItem.write(tmpFile);
        }
    }else{
    	//IE10+, FF3.6+, Chrome6.0+, Safari6.0+, Opera11.1+ 
    	String image = request.getParameter("image");
    	image = image.replace("data:image/jpeg;base64,", "").replaceAll(" ", "+");
    	//System.out.println(image);
    	byte[] imageByte = org.apache.commons.net.util.Base64.decodeBase64(image.getBytes());
    	FileOutputStream fs = new FileOutputStream(new File(path + System.currentTimeMillis() + "_test.jpg"));
    	fs.write(imageByte);
    	fs.close();
    	fs.flush();
    }
%>	    

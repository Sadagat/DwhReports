<%-- 
    Document   : ExpressoDebForm.jsp
    Created on : Jul 3, 2017, 10:53:05 PM
    Author     : emin.mustafayev
--%>

<%@page import="java.util.Properties"%>
<%@page import="ReadProperitesFile.ReadPropFile"%>
<%@page import="ExcelUtility.WorkExcel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DWH Reports</title>
    </head>
    <body bgcolor=#E0EBEA>
        <%
            if (request.getParameter("RepType") != null) 
            {
                Object[] array = new Object[5];
                WorkExcel we = new WorkExcel();
                
                ReadPropFile rf = new ReadPropFile();
                Properties properties = null;    
                properties = rf.ReadConfigFile("StoredProcedureName.properties");
                
                String FileNamePath = null;
                int RepType = Integer.parseInt(request.getParameter("RepType"));
                String TrDateB = request.getParameter("TrDateB");  
                String TrDateE =request.getParameter("TrDateE");
                String username = request.getParameter("uname");
                
                String ParamsValue = "dates=to_date('" + TrDateB.trim() + "','dd.mm.yyyy') and to_date('" + TrDateE.trim() + "','dd.mm.yyyy')";
                
                
                array[0] = 66;
                array[1] = 1;
                array[2] = 1;
                array[3] = ParamsValue;
                array[4] = username;
                
                switch (RepType) 
                {
                    case 0: {
        %>
        <jsp:forward page="DisplayReportsData.jsp">    
            <jsp:param name="PageId" value="66"/> 
            <jsp:param name="QueryStatus" value="1"/>
            <jsp:param name="CondStatus" value="1"/>
            <jsp:param name="Params" value="<%=ParamsValue%>"/> 
            <jsp:param name="UserName" value="<%=username%>"/>
        </jsp:forward>
        <%
                break;
            }
            case 1: {
                     FileNamePath = we.ExportDataToExcel(array, properties.getProperty("ProcName"),0);
        %>
        <jsp:forward page="DownloadsFile">    
            <jsp:param name="fileNamePath" value="<%=FileNamePath%>"/> 
        </jsp:forward>
        <% break;
                    }
                }
            }
        %>
    </body>
</html>

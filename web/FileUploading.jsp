<%-- 
    Document   : Məlumat Mərkəzi
    Created on : Jan 25, 2018, 15:52:16 PM
    Author     : j.gazikhanov
--%>

<%@page import="java.util.Properties"%>
<%@page import="ReadProperitesFile.ReadPropFile"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.PrDict"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="main.DB"%>
<link rel="stylesheet" href="styles/css_style.css" type="text/css">
<!DOCTYPE html>
<html>
    <head>
        <%
            ReadPropFile rf = new ReadPropFile();
            Properties properties = null;
            properties = rf.ReadConfigFile("FileUploading.properties");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=properties.getProperty("DWHRep")%></title>
    <!--    <link rel="stylesheet" href="jqueryui191cust/development-bundle/themes/cupertino/jquery.ui.all.css">-->
        <script src="jqueryui191cust/development-bundle/jquery-1.8.2.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.core.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.widget.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.datepicker.js"></script>
      <!--  <link rel="stylesheet" href="jqueryui191cust/development-bundle/demos/demos.css">-->

        <link href="resource/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="resource/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
        <link href="resource/css/jasny-bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="resource/js/jquery-1.12.3.js"></script>
        <script src="resource/js/jquery.min.js"></script>
       <!-- <script src="resource/js/bootstrap.min.js"></script>-->
        <script src="resource/js/jquery.dataTables.min.js"></script>
        <script src="resource/js/jasny-bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#myTable').dataTable();

            });
        </script>

        <script>
           /* $(function () {
                $("#from").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1,
                    onClose: function (selectedDate) {
                        $("#to").datepicker("option", "minDate", selectedDate);
                    }
                });
                $("#to").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1,
                    onClose: function (selectedDate) {
                        $("#from").datepicker("option", "maxDate", selectedDate);
                    }
                });

            });
            function validateForm()
            {
                var x = document.forms["post"]["DateFrom"].value;
                var y = document.forms["post"]["DateTo"].value;
                if (x === null || x === "")
                {
                    alert("Başlanğıc tarix daxil edilməlidir!");
                    return false;
                }
                if (y === null || y === "")
                {
                    alert("Son tarix daxil edilməlidir!");
                    return false;
                }
                if ((a === "") & (b === ""))
                {
                    alert("Debt və ya Kredit filiallardan biri seçilməlidir!");
                    return false;
                }
            }*/
        </script>
    </head>
    <body bgcolor=#E0EBEA>
        <%
           /* Date d = new Date();
            Format formatter;
            String s;
            formatter = new SimpleDateFormat("dd-MM-yyyy");
            s = formatter.format(d);*/

            PrDict footer = new PrDict();

            String user_name = request.getParameter("uname");
            String br = request.getParameter("br");
        %>  
        <table border="0" width="100%" height="100%"> 
            <col width="250">
            <tr>
                <td width="200" height="60">  
                    <font face="Times new roman" size="5"> 
                    <%=properties.getProperty("FileUp")%>
                    </font> </td>
                <td align="right">
                    <img src="images/logo_t.gif" width='160' height='60'>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <%  out.println(footer.lMenu(user_name, br));%>
                </td>
                <td valign="top">    

                    <!-- <div align="left" > --> 
                    <form method="post" action="FileUploadingForm.jsp" target="_blank" name="post" enctype="multipart/form-data" >
                        
                        <input  type="hidden"  name="username"  value="<%=user_name%>"/> 
                        <font size="4" face='Times New Roman'>
                        <!-- </div> -->
                        <table width="540" height="120" border="1" >
                            <tr>
                                <td>
                                    <table width="535" height="101" border="0" bgcolor=#EBF9F9>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("LoadFile")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="report_id" style="width: 155px">
                                                    <%=footer.UserLoadFile(user_name)%>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                        <div class="form-group">
                                            <label for="file"><%=properties.getProperty("ChooseFile")%></label>
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <span class="btn btn-default btn-file"><span><%=properties.getProperty("ChFile")%></span><input type="file" name="file" /></span>
                                                <span class="fileinput-filename"></span><span class="fileinput-new"><%=properties.getProperty("FileIsNChoos")%></span>
                                            </div>
                                            <input type="submit" value="Faylı yüklə" class="btn btn-success"/>
                                        </div> 
                            </tr>


                        </table> 
                </td>
            </tr>
        </table>
        <%
        %>
        </font >
    </form>
</td>
</tr>
<tr>
    <td>  
    </td>
    <td height="40">
        <div align="right">

            <%
                out.println(footer.ftSign());
            %>
        </div>
    </td>
</tr>

</table>
</body>
</html>

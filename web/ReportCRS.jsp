<%-- 
    Document   : ReprotCRS
    Created on : 18.04.2018
    Author     : C.Qazixanov
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
            properties = rf.ReadConfigFile("ReportCRS.properties"); 
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=properties.getProperty("DWHRep")%></title>
        <link rel="stylesheet" href="jqueryui191cust/development-bundle/themes/cupertino/jquery.ui.all.css">
        <script src="jqueryui191cust/development-bundle/jquery-1.8.2.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.core.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.widget.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.datepicker.js"></script>
        <link rel="stylesheet" href="jqueryui191cust/development-bundle/demos/demos.css">
        <script>
            $(function () {
                $("#from").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1
                });
            });
            function validateForm()
            {
                var x = document.forms["post"]["TrDateB"].value;
                if (x == null || x == "")
                {
                    alert("Tarix daxil edilməlidir!");
                    return false;
                }
            }
            $(function () {
                $("#f1").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1
                });
            });

            $(function () {
                $("#f2").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1
                });
            });

            $(function () {
                $("#f3").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1
                });
            });

            $(function () {
                $("#f4").datepicker({
                    dateFormat: "dd-mm-yy",
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    firstDay: 1
                });
            });
        </script>
    </head>
    <body bgcolor=#E0EBEA>
        <%
             Date d = new Date(); 
             Format formatter;
             String s;
             formatter = new SimpleDateFormat("dd-MM-yyyy");
             s = formatter.format(d);
               
             String user_name = request.getParameter("uname");
              String br = request.getParameter("br"); 
                PrDict footer = new PrDict();
               
        %>  
        <table border="0" width="100%" height="100%"> 
            <col width="250">
            <tr>
                <td width="200" height="60">  
                    <font face="Times new roman" size="5"> 
                    <%=properties.getProperty("RepCRS")%>
                    </font> </td>
                <td align="right">
                    <img src="images/logo_t.gif" width='160' height='60'>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <% out.println(footer.lMenu(user_name,br)); %>
                </td>
                <td valign="top">    

                    <!-- <div align="left" > --> 
                    <form method="post" action="ReportCRSForm.jsp" target="_blank" name="post" onsubmit="return validateForm()" >
                        <font size="4" face='Times New Roman'>
                        <!-- </div> -->
                        <table width="540" height="120" border="1" >
                            <tr>
                                <td>
                                    <table width="535" height="101" border="0" bgcolor=#EBF9F9>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("TypeCustomer")%></td>
                                            <td colspan="2">

                                                <input type="radio" name="CustomerType" value="1" checked><%=properties.getProperty("CustNatural")%> 
                                                <input type="radio" name="CustomerType" value="2"><%=properties.getProperty("CustLegal")%>  
                                                <input type="radio" name="CustomerType" value="3"><%=properties.getProperty("CustNaturalS")%> 
                                                <input type="radio" name="CustomerType" value="4"><%=properties.getProperty("CustAll")%>  
                                            </td>
                                        </tr> 
                                        <tr>
                                            <td width="150"  height="33"><%=properties.getProperty("DateFrom")%></td>
                                            <td width="110">
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td width="130"> 
                                                <input type="text" id="f1"  name="DateFrom" value= <% out.print('"'+s+'"'); %> />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="150"  height="33"><%=properties.getProperty("DateTo")%></td>
                                            <td width="110">
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td width="130"> 
                                                <input type="text" id="f2" name="DateTo" value= <% out.print('"'+s+'"'); %> />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("CustomerId")%></td>
                                            <td>
                                                <select style="width: 150px" >
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="text" name="CustomerId"  id ="custid"  value=""  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("PinCode")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="text" name="PinCode" value="" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("TPN")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="text" name="TaxPayId" value="" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("Citizenship")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td> 
                                            <td>
                                                <select name="citizenship_id" style="width: 155px">
                                                    <option value="ALL"> Hamısı </option>
                                                    <option value="ISNULL"> Olmayan </option>
                                                    <%
                                                        out.println(footer.SelCitizenship());
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27"><%=properties.getProperty("TypeReport")%></td>
                                            <td>
                                                <font size="3"> <input type="radio" name="RepType" value="0" checked><%=properties.getProperty("View")%><br> </font>
                                            </td>
                                            <td>
                                                <font size="3"> <input type="radio" name="RepType" value="1"><%=properties.getProperty("ExcelFile")%></font>
                                            </td>
                                        </tr>

                                        <input type="hidden" name="uname" value="<%=user_name%>" >
                                        <tr>
                                            <td height="27">&nbsp;</td>
                                            <td><center> <input type="submit" name="go" value=<%=properties.getProperty("Submit")%>> </center></td>
                                <td>&nbsp;</td>
                            </tr>     

                        </table> 
                </td>
            </tr>
        </table>
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

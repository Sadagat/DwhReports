<%-- 
    Document   : CarPricing
    Created on : Oct 13, 2014, 12:18:16 PM
    Author     : d.daşdəmirov
--%>

<%@page import="java.util.Properties"%>
<%@page import="ReadProperitesFile.ReadPropFile"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="main.PrDict"%>
<%@page import="main.Card_type"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="main.DB"%>
<link rel="stylesheet" href="styles/css_style.css" type="text/css">
<!DOCTYPE html>
<html>
    <%
        ReadPropFile rf = new ReadPropFile();
        Properties properties = null;
        properties = rf.ReadConfigFile("CardOper.properties");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=properties.getProperty("DWHRep")%></title>
        <link rel="stylesheet" href="jqueryui191cust/development-bundle/themes/cupertino/jquery.ui.all.css">
        <script src="jqueryui191cust/development-bundle/jquery-1.8.2.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.core.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.widget.js"></script>
        <script src="jqueryui191cust/development-bundle/ui/jquery.ui.datepicker.js"></script>
        <link rel="stylesheet" href="jqueryui191cust/development-bundle/demos/demos.css">
        <script>

            $(document).ready(function () {
                //called when key is pressed in textbox
                $("#custid").keypress(function (e) {
                    //if the letter is not digit then display error and don't type anything
                    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                        //display error message
                        $("#errmsg").html("Rəqəm").show().fadeOut("slow");
                        return false;
                    }
                });

                $("#amount").keypress(function (e) {
                    //if the letter is not digit then display error and don't type anything
                    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                        //display error message
                        $("#errmsg1").html("Rəqəm").show().fadeOut("slow");
                        return false;
                    }
                });
            });



            $(function () {
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
                var x = document.forms["post"]["DateB"].value;
                var z = document.forms["post"]["DateE"].value;
                var y = document.forms["post"]["DebFilial"];
                var type_checked = false;

                if (x == null || x == "")
                {
                    alert("Başlanğıc tarix daxil edilməlidir!");
                    return false;
                }

                if (z == null || z == "")
                {
                    alert("Son tarix daxil edilməlidir!");
                    return false;
                }


                for (i = 0; i < y.length; i++) {
                    if (y[i].checked)
                        type_checked = true;

                }


                if (type_checked == false) {
                    alert("Kart tipi secilməlidir!");
                    return false;
                }
            }

            function checkDebAll(field)
            {
                var z = document.forms["post"]["ALLCARD"].checked;

                if (z == true)
                {
                    for (i = 0; i < field.length; i++)
                        field[i].checked = true;
                }
                else
                {
                    for (i = 0; i < field.length; i++)
                        field[i].checked = false;
                }

            }
        </script>
        <style>
            .container { border:2px solid #ccc; 
                         width:300px; 
                         height: 100px; 
                         overflow-y: scroll;
                         font-size: 10px;
            }
        </style>
    </head>
    <body bgcolor=#E0EBEA>
        <%
            Date d = new Date();
            Format formatter;
            formatter = new SimpleDateFormat("dd-MM-yyyy");
            String s = formatter.format(d);

            String user_name = request.getParameter("uname");
            String br = request.getParameter("br");
            PrDict footer = new PrDict();
             Card_type card_type1=new Card_type();
        %>  
        <table border="0" width="100%" height="100%"> 
            <col width="250">
            <tr>
                <td width="200" height="60">  
                    <font face="Times new roman" size="5"> 
                    <%=properties.getProperty("CardOper")%>
                    </font> </td>
                <td align="right">
                    <img src="images/logo_t.gif" width='160' height='60'>
                </td>
            </tr>
            <tr>
                <td valign="top">

                    <%=footer.lMenu(user_name, br)%>

                </td>
                <td valign="top">    
                    <!-- <div align="left" > -->
                    <form method="post" action="CardOperForm.jsp" target="_blank" name="post" onsubmit="return validateForm()" >
                        <font size="4" face='Times New Roman'>
                        <!-- </div> -->
                        <table width="540" height="120" border="1" >
                            <tr>
                                <td>
                                    <table width="535" height="101" border="0" bgcolor=#EBF9F9>
                                        <tr>
                                            <td width="150" height="33"><%=properties.getProperty("DateFrom")%></td>
                                            <td width="110">
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td width="130"> 
                                                <input type="text" id="from" name="TrDateB" value= <% out.print('"'+s+'"'); %> />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="31"><%=properties.getProperty("DateTo")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td width="130">
                                                <input type="text" id="to" name="TrDateE" value= <% out.print('"'+s+'"'); %> />
                                            </td>
                                        </tr>


                                        <tr>
                                            <td height="27"><%=properties.getProperty("FilialCode")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="Filial" style="width: 150px">
                                                    <%  
                                                    out.println(footer.SelFilial(Integer.parseInt(br),0));
                             
                                                    %>
                                                </select>
                                            </td>
                                        </tr> 
                                        <tr>
                                            <td height="27"><%=properties.getProperty("Tariff")%></td>
                                            <td>
                                                <select style="width: 150px">
                                                    <option value="1">equals</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="cardType" style="width: 150px">
                                                    <option value="0"><%=properties.getProperty("All")%></option>
                                                    <option value="D"><%=properties.getProperty("Deb")%></option> 
                                                    <option value="C"><%=properties.getProperty("Kred")%></option>  
                                                    <option value="D-C"><%=properties.getProperty("Dc")%></option> 
                                                </select>
                                            </td>
                                        </tr> 

                                        <tr>
                                            <td>
                                                <%=properties.getProperty("CardType")%>
                                                <br>
                                                <div class="container">      
                                                    <%= (card_type1.ChkTypeCard(Integer.parseInt(br),1))
                    
                                                    %>         
                                                </div>
                                            </td>
                                        </tr>
                                        <input type="hidden" name="uname" value="<%=user_name%>" >
                                        <tr>
                                            <td height="27">&nbsp;</td>
                                            <td><center> <input type="submit" name="go" value="Qəbul"> </center></td>
                                <td>  </td>
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

            <%=footer.ftSign()%>
        </div>
    </td>
</tr>

</table>
</body>
</html>

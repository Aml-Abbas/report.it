<%@ page import="java.util.ArrayList" %>
<%@ page import="report.it.models.TimeReport" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: Li Zhu
  Date: 2020-03-05
  Time: 10:42
  @author Li Zhu, Nils Olen & Fatima Doussi
  @version: 0.3
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="global.css">
    <link rel="stylesheet" href="timeReport.css">
    <title>TimeReporting</title>

</head>
<body>

<div class="container">
<h2 >Your Time Reports</h2>

<table>
    <tr>
        <th>Date Submitted</th>
        <th>Week Number</th>
        <th>Total Minutes</th>
        <th>Project</th>
        <th>Edit</th>
    </tr>

    <c:forEach items="${timeReports}" var="timeReport">
        <tr>
            <td>
                    ${timeReport.getSubmitted()}
            </td>
            <td>
                    ${timeReport.getWeek()}
            </td>
            <td>
                    ${timeReport.getMinutes_sum()}
            </td>
            <td>
                    ${timeReport.getProjectName()}
            </td>

            <td>


                <c:set var = "signed" scope = "session" value = "${timeReport.getSigned()}"/>
                <c:if test = "${!signed}">
                    <form action="TimeReporting" method="post">
                        <input type="hidden" name="timeReportId" value="${timeReport.getId()}"/>
                        <input type="hidden" name="action" value="editTimeReport">
                        <button><i class="material-icons">edit</i></button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
</div>

<div class="container">
<c:set var = "editable" scope = "session" value = "${editable}"/>
<c:if test = "${!editable}">
<h2 >New Report</h2>


<form action="TimeReporting" method="post">
    <input type="text" name="week" placeholder="Week Number"/>
    <input type="text" name="time" placeholder="Total Minutes"/>
    <select name="projectName">
        <c:forEach items="${projects}" var="project">
            <option  value="${project}">${project}</option>
        </c:forEach>
    </select>
    <input type="hidden" name="action" value="submit">
    <button>Submit Report</button>
</form>
</c:if>

<c:set var = "invalidText" scope = "session" value = "${invalidText}"/>
<c:if test = "${invalidText}">
    <p>Please check if you choose a project or input invalid text</p>
</c:if>

<c:set var = "editable" scope = "session" value = "${editable}"/>
<c:if test = "${editable}">
    <h2 >Edit Your Time Report</h2>
    <form action="TimeReporting" method="post">
        <input type="text" name="week" value="${editReport.getWeek()}"/>
        <input type="text" name="time" value="${editReport.getMinutes_sum()}"/>

        <select name="projectName">
            <c:forEach items="${projects}" var="project">
            <option  value="${project}">${project}</option>
            </c:forEach>
        </select>
        <input type="hidden" name="reportId" value="${editReport.getId()}">
        <input type="hidden" name="action" value="update">
        <button><i class="material-icons">update</i></button>
    </form>
    <form action="TimeReporting" method="post">
        <input type="hidden" name="reportId" value="${editReport.getId()}">
        <input type="hidden" name="action" value="delete">
        <button><i class="material-icons">delete</i></button>
    </form>
</c:if>
</div>
<br>
<br>
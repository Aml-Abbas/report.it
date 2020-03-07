<%@ page import="java.util.ArrayList" %>
<%@ page import="report.it.models.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: abdusalamapps
  Date: 2020-02-22
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<h3>Registered users</h3>
<table>
    <tr>
        <th>Username</th>
        <th>Name</th>
        <th>Email</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>
                    ${user.getUsername()}
            </td>
            <td>
                    ${user.getName()}
            </td>
            <td>
                    ${user.getEmail()}
            </td>
            <td class="table-button-column">
                <form action="Administration" method="post">
                    <input type="hidden" name="username" value="${user.getUsername()}"/>
                    <input type="hidden" name="action" value="delete">
                    <button>Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>



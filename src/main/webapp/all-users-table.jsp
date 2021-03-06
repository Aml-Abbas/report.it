<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: abdusalamapps
  Date: 2020-02-22
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container">
    <h3>Users</h3>

    <div class="cards-container">
        <c:forEach items="${users}" var="user">
            <div class="card">

                <div class="card-main-content">
                    <h4><b>${user.getName()}</b></h4>
                    <p>${user.getUsername()}</p>
                    <a>${user.getEmail()}</a>
                </div>

                <div class="card-bottom">
                    <form action="Administration" method="post">
                        <input type="hidden" name="username" value="${user.getUsername()}"/>
                        <input type="hidden" name="action" value="delete">
                        <button id="delete-button">
                            <i class="material-icons">delete</i>
                        </button>
                    </form>
                </div>

            </div>
        </c:forEach>
    </div>



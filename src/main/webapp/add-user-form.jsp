<%--
  Created by IntelliJ IDEA.
  User: abdusalamapps
  Date: 2020-02-23
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3 id="new-user-title">New User</h3>

<form class="new-user-form" action="Administration" method="POST">
    <input type="text" name="username" placeholder="Username">
    <input type="text" name="name" placeholder="Full Name">
    <input type="text" name="email" placeholder="Email">
    <input type="hidden" name="action" value="add">
    <button  class="text-button">Create User</button>
    <p> New User Password: ${password}</p>
</form>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>


<br/>
<br/>

<h1>Book List</h1>

<c:if test="${!empty listBooks}"><div class = "container">
    <div class="row">
        <div class = "col-md-12">
            <div class = "panel panel-default">
                <div class = "panel-heading">Site</div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>

        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
                        </thead>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td><a href="/bookdata/${book.mId}" target="_blank">${book.mTitle}</a></td>
                <td>${book.mAuthor}</td>
                <td>${book.mPrice}</td>
                <td><a href="<c:url value='/edit/${book.mId}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.mId}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</c:if>


<h1>Add a Book</h1>

<c:url var="addAction" value="/books/add"/>

<form:form action="${addAction}" commandName="book">
    <table>
        <c:if test="${!empty book.mTitle}">
            <tr>
                <td>
                    <form:label path="mId">
                        <spring:message text="ID"/>
                    </form:label>
                </td>

            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="mTitle">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>
                <form:input path="mTitle"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="mAuthor">
                    <spring:message text="Author"/>
                </form:label>
            </td>
            <td>
                <form:input path="mAuthor"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="mPrice">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="mPrice"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.mTitle}">
                    <input type="submit"
                           value="<spring:message text="Edit Book"/>"/>
                </c:if>
                <c:if test="${empty book.mTitle}">
                    <input type="submit"
                           value="<spring:message text="Add Book"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>

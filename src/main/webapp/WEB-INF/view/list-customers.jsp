<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Customers</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css " type="text/css">

</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">
    <div id="content">

        <input type="button" value="Add Customer"
               onclick="window.location.href='showFormForAdd'; return false;"
               class="add-button">

        <table>
            <tbody>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
            </tr>

            <c:forEach var="tempCustomers" items="${customers}">

                <tr>
                    <td>${tempCustomers.firstName}</td>
                    <td>${tempCustomers.lastName}</td>
                    <td>${tempCustomers.email}</td>
                </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>
</div>


</body>
</html>

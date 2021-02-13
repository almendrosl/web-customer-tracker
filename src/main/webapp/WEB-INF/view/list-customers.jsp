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

        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
            </tr>

            <c:forEach var="tempCustomers" items="${customers}">

                <tr>
                    <th>${tempCustomers.firstName}</th>
                    <th>${tempCustomers.lastName}</th>
                    <th>${tempCustomers.email}</th>
                </tr>

            </c:forEach>
        </table>

    </div>
</div>


</body>
</html>

<%--<%@tag description="Overall Page template" pageEncoding="UTF-8"%>--%>
<%--<%@attribute name="header" fragment="true" %>--%>
<%--<%@attribute name="footer" fragment="true" %>--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%= getServletContext().getContextPath() %>/css/bootstrap.min.css"
          media="all"/>
    <link rel="stylesheet" type="text/css" href="<%= getServletContext().getContextPath() %>/css/style.css"
          media="all"/>
    <script src="<%= getServletContext().getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Liste des étudiants</title>
</head>
<body>
    <%--<rapid:block name="head">--%>
    <%--base_head_content--%>
    <%--</rapid:block>--%>
    <%--</head>--%>
    <body>
    <br />
    <rapid:block name="content">
        base_body_content
    </rapid:block>
    </body>
</html>
<div id="page-header">
    <h1>header</h1>
    <%--<jsp:invoke fragment="header"/>--%>
</div>
<div id="body">
    {% block content %}
    {% endblock %}
</div>
<div id="page-footer">
    <h1>footer</h1>
    <%--<jsp:invoke fragment="footer"/>--%>
</div>
</body>
</html>
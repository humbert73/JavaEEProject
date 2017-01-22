<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- Directives de page import --%>
<%--<%@ page import="projet.data.GestionFactory"%>--%>
<%@ page import="projet.data.Etudiant" %>
<%@ page import="projet.data.Groupe" %>

<jsp:useBean id="etudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<projet.data.Groupe>" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="container-fluid">
    <h1>Page d'ajout d'un groupe</h1>
</div>
</body>
</html>
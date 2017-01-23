<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- Directives de page import --%>
<%--<%@ page import="util.GestionFactory"%>--%>
<%@ page import="util.entities.Etudiant" %>
<%@ page import="util.entities.Groupe" %>

<jsp:useBean id="etudiants" type="java.util.Collection<util.entities.Etudiant>" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<util.entities.Groupe>" scope="request"/>
<jsp:useBean id="groupe" type="util.entities.Groupe" scope="request"/>

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
    <title>Groupe</title>
</head>
<body>
<div class="container-fluid">
    <h1>Liste des étudiants du groupe <%= groupe.getLibelle() %></h1>
    <div class="dropdown">
        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Groupes
            <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <% for (Groupe groupeNav : groupes) { %>
            <li>
                <a href="<%= getServletContext().getContextPath() %>/do/listGroupe?libelle=<%= groupeNav.getLibelle() %>"><%= groupe.getLibelle() %>
                </a></li>
            <% } %>
        </ul>
    </div>
    <button class="btn btn-xs">Ajouter un étudiant</button>
    <table class="table table-striped table-hover" id="table-liste-etudiants">
        <thead>
        <tr>
            <th><a href='#'>Id</a></th>
            <th>Nom</th>
            <th>Prenom</th>
        </tr>
        </thead>
        <tbody>
            <tr class="tr-header">
                <td>Groupe : <%= groupe.getLibelle() %></td>
                <td></td>
                <td></td>
            </tr>
            <% for (Etudiant etudiant : groupe.getEtudiants()) { %>
            <tr onclick="document.location='<%= getServletContext().getContextPath() %>/do/details?id=<%= etudiant.getId() %>'">
                <td>
                    <a href="<%= getServletContext().getContextPath() %>/do/details?id=<%= etudiant.getId() %>"><%= etudiant.getId()  %>
                    </a></td>
                <td><%= etudiant.getNom() %></td>
                <td><%= etudiant.getPrenom() %></td>
            <% } %>
            </tr>
        </tbody>
    </table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%-- Directives de page import --%>
<%@ page import="util.entities.*" %>

<jsp:useBean id="etudiant" class="util.entities.Etudiant" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<util.entities.Groupe>" scope="request"/>
<jsp:useBean id="nbAbsences" type="java.lang.Integer" scope="request"/>

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
    <title>Détails étudiant</title>
</head>
<body>
<div class="container">
    <h1>Fiche détaillée de l'élève
        <jsp:getProperty name="etudiant" property="prenom"/>
        <jsp:getProperty name="etudiant" property="nom"/>
    </h1>
    <hr>
    <div class="container-fluid">
        <table class="table" id="table-liste-etudiants">
            <thead>
            <tr>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Groupe</th>
                <th>Nombre d'absences</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><jsp:getProperty name="etudiant" property="nom"/></td>
                <td><jsp:getProperty name="etudiant" property="prenom"/></td>
                <td><%= etudiant.getGroupe().getLibelle() %></td>
                <td><%= nbAbsences %></td>
                <td>
                    <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modal-edit">Editer</button>
                    <jsp:include page="modals/editEtudiant.jsp"/>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- Directives de page import --%>
<%--<%@ page import="util.GestionFactory"%>--%>
<%@ page import="util.entities.Groupe" %>

<jsp:useBean id="groupes" type="java.util.Collection<util.entities.Groupe>" scope="request"/>

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
    <h1>Page d'ajout d'un étudiant</h1>
    <form class="form-horizontal" method="post" action="<%= getServletContext().getContextPath() %>/do/addEtudiant">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nom">Nom :</label>
            <div class="col-sm-4">
                <input name="nom" type="text" class="form-control" id="nom" placeholder="Dupont">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="prenom">Prénom :</label>
            <div class="col-sm-4">
                <input name="prenom" type="text" class="form-control" id="prenom" placeholder="Jean">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="groupe">Groupe :</label>
            <div class="col-sm-1">
                <select name="groupe" class="form-control" id="groupe">
                    <% for (Groupe groupe : groupes) { %>
                    <option><%= groupe.getLibelle() %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>Ajouter</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
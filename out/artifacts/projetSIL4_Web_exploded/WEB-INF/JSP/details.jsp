<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%-- Directives de page import --%>
<%@ page import="util.entities.*" %>

<jsp:useBean id="etudiant" class="util.entities.Etudiant" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<util.entities.Groupe>" scope="request"/>
<jsp:useBean id="modules" type="java.util.Collection<util.entities.Module>" scope="request"/>


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
        <table class="table">
            <legend>Détails</legend>
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
                <td>
                    <jsp:getProperty name="etudiant" property="nom"/>
                </td>
                <td>
                    <jsp:getProperty name="etudiant" property="prenom"/>
                </td>
                <td><span class="label label-primary"><%= etudiant.getGroupe().getLibelle() %></span></td>
                <td><span class="badge"><jsp:getProperty name="etudiant" property="nbAbsences"/></span></td>
                <td>
                    <button type="button" class="btn btn-info btn-xs"
                            data-toggle="modal" data-target="#modal-etudiant-edit">
                        <span class="glyphicon glyphicon-pencil"></span> Editer
                    </button>
                    <jsp:include page="modals/etudiant/edit.jsp"/>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="container-fluid">
        <table class="table">
            <legend>Notes</legend>
            <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#modal-note-add">
                <span class="glyphicon glyphicon-plus"></span> Ajouter une note
            </button>
            <jsp:include page="modals/note/add.jsp"/>
            <button type="button" class="btn btn-sm btn-info" data-toggle="modal"
                    data-target="#modal-module-add">
                <span class="glyphicon glyphicon-plus"></span> Ajouter un module
            </button>
            <jsp:include page="modals/module/add.jsp"/>
            <thead>
            <tr>
                <th></th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Note note : etudiant.getNotes()) { %>
            <tr>
                <td><%= note.getValue() %>/20 <span class="badge">coef : <%= note.getCoefficient() %></span></td>
                <td>
                    <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                            data-target="#modal-note-edit-<%= note.getId() %>">
                        <span class="glyphicon glyphicon-pencil"></span> Editer
                    </button>
<!-- Modal Edit Note -->
<div id="modal-note-edit-<%= note.getId() %>" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal Edit Note content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edition d'une note</h4>
            </div>
            <form method="post" action="<%= getServletContext().getContextPath() %>/do/editNote">
                <div class="modal-body form-horizontal">
                    <input name="id" value="<jsp:getProperty name="etudiant" property="id"/>"
                           type="hidden">
                    <input name="noteId" value="<%= note.getId() %>" type="hidden">

                    <input name="noteId" value="<%= note.getModule() %>" type="hidden">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="module">Module :</label>
                        <div class="col-sm-3">
                            <select name="module-id" class="form-control" id="module">
                                <option selected="selected" value="<%= note.getModule().getId() %>">
                                    <%= note.getModule().getLibelle() %>
                                </option>
                                <% for (Module module : modules) { %>
                                <option value="<%= module.getId() %>"><%= module.getLibelle() %>
                                </option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="note">Note :</label>
                        <div class="col-sm-3">
                            <input type="number" name="note" id="note" class="form-control"
                                   min="0" max="20" step="1" value="<%= note.getValue() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="note">Coefficient :</label>
                        <div class="col-sm-3">
                            <input type="number" name="coefficient" id="coefficient"
                                   class="form-control"
                                   min="0" step="1" value="<%= note.getCoefficient() %>">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-floppy-disk"></span> Confirmer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Fin modal note edit -->
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
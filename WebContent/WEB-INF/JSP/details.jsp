<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<%-- Directives de page import --%>
<%@ page import="projet.data.*" %>

<jsp:useBean id="etudiant" class="projet.data.Etudiant" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<projet.data.Groupe>" scope="request"/>
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
                <td><button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modal-edit">Editer</button>
                    <!-- Modal -->
                    <div id="modal-edit" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Modal Header</h4>
                                </div>
                                <form class="form-horizontal" method="post" action="<%= getServletContext().getContextPath() %>/do/editEtudiant">
	                                <div class="modal-body">
	                                    <input name="id" value="<jsp:getProperty name="etudiant" property="id"/>" hidden></input>
                                        <div class="form-group">
								            <label class="control-label col-sm-4" for="groupe">Groupe :</label>
								            <div class="col-sm-3">
								                <select name="groupe" class="form-control" id="groupe">
								                	<option selected="selected" value="<%= etudiant.getGroupe().getLibelle() %>"><%= etudiant.getGroupe().getLibelle() %></option>
								                    <% for (Groupe groupe : groupes) { %>
								                    	<option value="<%= groupe.getLibelle() %>"><%= groupe.getLibelle() %></option>
								                    <% } %>
								                </select>
								            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="nom">Nom :</label>
                                            <div class="col-sm-6">
                                                <input name="nom" class="form-control" id="nom" placeholder="<jsp:getProperty name="etudiant" property="nom"/>"
                                                	value="<jsp:getProperty name="etudiant" property="nom"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="prenom">Prénom :</label>
                                            <div class="col-sm-6">
                                                <input name="prenom" class="form-control" id="prenom" placeholder="<jsp:getProperty name="etudiant" property="prenom"/>"
                                                	value="<jsp:getProperty name="etudiant" property="prenom"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="absence">Nombre d'absence :</label>
                                            <div class="col-sm-2">
                                                <input name="nbAbsences" type="number" class="form-control" id="absence"
                                                	value="<jsp:getProperty name="etudiant" property="nbAbsences"/>">
                                            </div>
                                        </div>
	                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-default">Confirmer</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
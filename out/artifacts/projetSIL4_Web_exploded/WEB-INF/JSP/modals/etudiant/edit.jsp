<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="util.entities.*" %>

<jsp:useBean id="etudiant" class="util.entities.Etudiant" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<util.entities.Groupe>" scope="request"/>
<jsp:useBean id="nbAbsences" type="java.lang.Integer" scope="request"/>

<!-- Modal -->
<div id="modal-etudiant-edit" class="modal fade" role="dialog">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="util.entities.*" %>

<jsp:useBean id="etudiant" class="util.entities.Etudiant" scope="request"/>
<jsp:useBean id="groupes" type="java.util.Collection<util.entities.Groupe>" scope="request"/>
<jsp:useBean id="modules" type="java.util.Collection<util.entities.Module>" scope="request"/>


<!-- Modal -->
<div id="modal-note-add" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Ajout d'une note</h4>
            </div>
            <form method="post" action="<%= getServletContext().getContextPath() %>/do/addNote">
                <div class="modal-body form-horizontal">
                    <input name="id" value="<jsp:getProperty name="etudiant" property="id"/>" type="hidden">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="module">Module :</label>
                        <div class="col-sm-3">
                            <select name="module-id" class="form-control" id="module">
                                <% for (Module module : modules) { %>
                                <option value="<%= module.getId() %>"><%= module.getLibelle() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="note">Note :</label>
                        <div class="col-sm-3">
                            <input type="number" name="note" id="note" class="form-control"
                                   min="0" max="20" step="1" value="10">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="coefficient">Coefficient :</label>
                        <div class="col-sm-3">
                            <input type="number" name="coefficient" id="coefficient" class="form-control"
                                   min="0" step="1" value="10">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> Ajouter
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
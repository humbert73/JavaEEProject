<!-- Modal -->
<div id="modal-note-edit-<%= note.getId() %>" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edition d'une note</h4>
            </div>
            <form class="form-horizontal" method="post" action="<%= getServletContext().getContextPath() %>/do/editNote">
                <div class="modal-body">
                    <input name="id" value="<jsp:getProperty name="etudiant" property="id"/>" type="hidden">
                    <input name="noteId" value="<%= note.getId() %>" type="hidden">
                    noteId
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="note">Note :</label>
                        <div class="col-sm-3">
                            <input type="number" name="note" id="note" class="form-control" min="0" max="20" step="1"
                                   value="<%= note.getValue() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="coefficient">Coefficient :</label>
                        <div class="col-sm-3">
                            <input type="number" name="coefficient" id="coefficient" class="form-control" min="0" max="20" step="1"
                                   value="<%= note.getCoefficient() %>">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                    <button type="submit" class="btn btn-primary">
                        <span class="glyphicon glyphicon-floppy-disk"></span> Confirmer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Fin modal note edit -->
<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>Activity Type Management</h1></div>
<div class="card"><h2>Create activity</h2><form method="post" action="<%=ctx%>/admin/activities" class="field-grid"><div><label>Name</label><input name="name" required></div><div><label>Description</label><input name="description"></div><div><button>Create</button></div></form></div>
<div class="table-wrap"><table><thead><tr><th>Name</th><th>Description</th><th>Active</th><th>Update</th><th>Deactivate</th></tr></thead><tbody>
<c:forEach var="a" items="${activities}"><tr><td colspan="4"><form method="post" action="<%=ctx%>/admin/activities" class="small-form"><input type="hidden" name="action" value="update"><input type="hidden" name="id" value="${a.id}"><input name="name" value="${a.name}" required><input name="description" value="${a.description}"><select name="active"><option value="true">true</option><option value="false">false</option></select><button>Save</button></form></td><td><form method="post" action="<%=ctx%>/admin/activities" onsubmit="return confirmAction('Deactivate this activity?')"><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="${a.id}"><button type="submit" class="danger">Deactivate</button></form></td></tr></c:forEach>
</tbody></table></div>
<%@ include file="../partials/footer.jspf" %>

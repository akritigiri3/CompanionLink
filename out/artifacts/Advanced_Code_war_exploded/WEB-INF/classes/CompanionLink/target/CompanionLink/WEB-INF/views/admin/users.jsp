<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>User Management</h1><span class="badge">Approve and deactivate users</span></div>
<div class="table-wrap"><table><thead><tr><th>Name</th><th>Email</th><th>Role</th><th>Status</th><th>Phone</th><th>Action</th></tr></thead><tbody>
<c:forEach var="u" items="${users}"><tr><td>${u.fullName}</td><td>${u.email}</td><td>${u.role}</td><td><span class="badge">${u.status}</span></td><td>${u.phone}</td><td><form method="post" action="<%=ctx%>/admin/users" class="small-form"><input type="hidden" name="id" value="${u.id}"><select name="status"><option>ACTIVE</option><option>PENDING</option><option>INACTIVE</option><option>REJECTED</option></select><button type="submit">Update</button></form></td></tr></c:forEach>
</tbody></table></div>
<%@ include file="../partials/footer.jspf" %>

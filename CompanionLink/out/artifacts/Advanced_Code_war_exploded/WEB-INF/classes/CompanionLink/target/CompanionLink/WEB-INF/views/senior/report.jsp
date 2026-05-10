<%@ include file="../partials/header.jspf" %>
<div class="card form-card"><h1>Submit Safety Report</h1><form method="post" action="<%=ctx%>/senior/report"><label>Volunteer involved</label><select name="volunteerId"><option value="">Not sure / general concern</option><c:forEach var="v" items="${volunteers}"><option value="${v.id}">${v.fullName}</option></c:forEach></select><label>Description</label><textarea name="description" required></textarea><button class="danger">Submit Report</button></form></div>
<%@ include file="../partials/footer.jspf" %>

<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>Volunteer Wishlist</h1><span class="badge">Stored in HTTP Session</span></div><p class="muted">This wishlist is not saved in the database and clears after logout/session expiry.</p>
<div class="grid two"><c:forEach var="v" items="${volunteers}"><div class="card"><h2>${v.fullName}</h2><p>${v.skills}</p><p>${v.availability}</p><form method="post" action="<%=ctx%>/senior/wishlist"><input type="hidden" name="id" value="${v.id}"><input type="hidden" name="action" value="remove"><button class="danger">Remove</button></form></div></c:forEach></div>
<%@ include file="../partials/footer.jspf" %>

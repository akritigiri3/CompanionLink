<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>Admin Dashboard</h1><a class="btn" href="<%=ctx%>/admin/monitoring">Open Monitoring</a></div>
<div class="grid four"><div class="card"><div class="stat">${summary.totalUsers}</div><p>Total users</p></div><div class="card"><div class="stat">${summary.totalSeniors}</div><p>Seniors</p></div><div class="card"><div class="stat">${summary.totalVolunteers}</div><p>Volunteers</p></div><div class="card"><div class="stat">${summary.pendingVolunteers}</div><p>Pending volunteers</p></div></div>
<div class="grid two"><div class="card"><h2>Top volunteers</h2><c:forEach var="i" items="${summary.topVolunteers}"><p>⭐ ${i}</p></c:forEach></div><div class="card"><h2>Popular activities</h2><c:forEach var="i" items="${summary.popularActivities}"><p>${i}</p></c:forEach></div></div>
<div class="grid two"><div class="card"><h2>Open requests</h2><div class="stat">${summary.openRequests}</div></div><div class="card"><h2>Completed visits this month</h2><div class="stat">${summary.completedVisitsThisMonth}</div></div></div>
<%@ include file="../partials/footer.jspf" %>

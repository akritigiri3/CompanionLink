<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>Browse Open Requests</h1></div>
<div class="card"><form method="get" action="<%=ctx%>/volunteer/requests" class="field-grid"><input name="q" value="${keyword}" placeholder="Search activity, area, notes"><button>Search</button></form></div>
<div class="grid two"><c:forEach var="r" items="${requests}"><div class="card"><h2>${r.activityName}</h2><p><b>Senior:</b> ${r.seniorName}</p><p><b>Date:</b> ${r.preferredDateTime}</p><p><b>Area:</b> ${r.locationArea}</p><p>${r.notes}</p><form method="post" action="<%=ctx%>/volunteer/requests"><input type="hidden" name="requestId" value="${r.id}"><button>Accept Request</button></form></div></c:forEach></div>
<%@ include file="../partials/footer.jspf" %>

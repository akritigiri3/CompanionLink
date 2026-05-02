<%@ include file="../partials/header.jspf" %>
<div class="page-title">
    <h1>Volunteer Dashboard</h1>
    <a class="btn" href="<%=ctx%>/volunteer/requests">Browse Open Requests</a>
</div>
<div class="grid two">
    <div class="card">
        <h2>Open Requests</h2>
        <p>Accept companionship requests from seniors.</p>
    </div>
    <div class="card">
        <h2>My Schedule</h2>
        <p>View accepted and completed visits.</p>
        <a href="<%=ctx%>/volunteer/schedule">Open schedule</a>
    </div>
</div>
<div class="card">
    <h2>Latest open requests</h2>
    <div class="table-wrap">
        <table>
            <thead>
            <tr>
                <th>Senior</th>
                <th>Activity</th>
                <th>Date</th>
                <th>Area</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="r" items="${requests}">
                <tr>
                    <td>${r.seniorName}</td>
                    <td>${r.activityName}</td>
                    <td>${r.preferredDateTime}</td>
                    <td>${r.locationArea}</td>
                    <td><form method="post" action="<%=ctx%>/volunteer/requests">
                        <input type="hidden" name="requestId" value="${r.id}">
                        <button>Accept</button></form></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="../partials/footer.jspf" %>

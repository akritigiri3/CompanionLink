<%@ include file="../partials/header.jspf" %>
<div class="page-title">
    <h1>Senior Dashboard</h1>
    <a class="btn" href="<%=ctx%>/senior/requests">Post New Request</a>
</div>
<div class="grid">
    <div class="card">
        <h2>Companion Requests</h2>
        <p>Create companionship requests.</p>
        <a href="<%=ctx%>/senior/requests">Manage requests</a>
    </div>
    <div class="card">
        <h2>Approved Volunteers</h2>
        <p>Browse volunteers, ratings, skills and availability.</p>
        <a href="<%=ctx%>/senior/volunteers">Browse volunteers</a>
    </div>
    <div class="card">
        <h2>Safety</h2>
        <p>Report any concern to admins.</p>
        <a href="<%=ctx%>/senior/report">Submit safety report</a>
    </div>
</div>
<div class="card">
    <h2>Recent requests</h2>
    <div class="table-wrap">
        <table>
            <thead>
            <tr>
                <th>Activity</th>
                <th>Date</th>
                <th>Area</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="r" items="${requests}">
                <tr>
                    <td>${r.activityName}</td>
                    <td>${r.preferredDateTime}</td>
                    <td>${r.locationArea}</td>
                    <td>${r.status}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="../partials/footer.jspf" %>

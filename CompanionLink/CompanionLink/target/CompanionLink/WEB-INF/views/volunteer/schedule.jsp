<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>Volunteer Schedule</h1>
</div>
<div class="table-wrap">
    <table>
        <thead>
        <tr>
            <th>Senior</th>
            <th>Activity</th>
            <th>Scheduled</th>
            <th>Status</th>
            <th>Duration</th>
            <th>Rating</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
<c:forEach var="v" items="${visits}">
    <tr>
        <td>${v.seniorName}</td>
        <td>${v.activityName}</td>
        <td>${v.scheduledAt}</td>
        <td>${v.status}</td>
        <td>${v.actualDurationMinutes}</td>
        <td>${v.ratingStars}</td>
        <td><c:if test="${v.status == 'ACCEPTED'}">
            <a class="btn" href="<%=ctx%>/volunteer/complete?visitId=${v.id}">Log Completed</a>
        </c:if>
        </td>
    </tr></c:forEach>
</tbody>
    </table>
</div>
<%@ include file="../partials/footer.jspf" %>

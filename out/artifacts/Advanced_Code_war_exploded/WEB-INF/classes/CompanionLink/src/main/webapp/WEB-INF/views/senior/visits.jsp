<%@ include file="../partials/header.jspf" %>
<div class="page-title">
    <h1>My Visits</h1>
</div>
<div class="table-wrap">
    <table><thead><tr><th>Volunteer</th>
        <th>Activity</th><th>Scheduled</th>
        <th>Status</th>
        <th>Duration</th>
        <th>Rating</th>
        <th>Action</th>
    </tr>
    </thead>
        <tbody>
<c:forEach var="v" items="${visits}">
    <tr>
        <td>${v.volunteerName}</td>
        <td>${v.activityName}</td>
        <td>${v.scheduledAt}</td>
        <td>${v.status}</td>
        <td>${v.actualDurationMinutes}</td>
        <td><c:choose><c:when test="${v.ratingStars != null}">${v.ratingStars} stars</c:when>
            <c:otherwise>Not rated</c:otherwise>
        </c:choose>
        </td>
        <td>
            <c:if test="${v.status == 'COMPLETED' && v.ratingStars == null}">
                <a class="btn" href="<%=ctx%>/senior/rate?visitId=${v.id}">Rate</a>
            </c:if>
        </td>
    </tr>
</c:forEach>
</tbody>
    </table>
</div>
<%@ include file="../partials/footer.jspf" %>

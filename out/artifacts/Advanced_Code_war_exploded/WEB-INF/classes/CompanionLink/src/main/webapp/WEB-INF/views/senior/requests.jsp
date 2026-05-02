<%@ include file="../partials/header.jspf" %>
<div class="page-title">
    <h1>Request a Companion</h1>
</div>
<div class="card form-card">
    <form method="post" action="<%=ctx%>/senior/requests">
        <label>Activity type</label>
        <select name="activityTypeId" required><c:forEach var="a" items="${activities}">
            <option value="${a.id}">${a.name}</option>
        </c:forEach></select>
        <label>Preferred date and time</label>
        <input type="datetime-local" name="preferredDateTime" required>
        <label>Approximate location / area</label>
        <input name="locationArea" required placeholder="Enter your address">
        <label>Notes</label>
        <textarea name="notes">
        </textarea>
        <button type="submit">Post Request</button>
    </form>
</div>
<div class="card">
    <h2>My Requests</h2>
    <div class="table-wrap">
        <table>
            <thead>
            <tr>
                <th>Activity</th>
                <th>Date</th>
                <th>Area</th>
                <th>Notes</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody><c:forEach var="r" items="${requests}">
                <tr>
                    <td>${r.activityName}</td>
                    <td>${r.preferredDateTime}</td>
                    <td>${r.locationArea}</td>
                    <td>${r.notes}</td>
                    <td>${r.status}</td>
                </tr>
            </c:forEach></tbody>
        </table>
    </div>
</div>
<%@ include file="../partials/footer.jspf" %>

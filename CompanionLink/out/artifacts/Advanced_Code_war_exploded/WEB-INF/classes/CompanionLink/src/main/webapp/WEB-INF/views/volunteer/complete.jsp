<%@ include file="../partials/header.jspf" %>
<div class="card form-card">
    <h1>Log Completed Visit</h1>
    <p>Senior: <b>${visit.seniorName}</b> | Activity: ${visit.activityName}</p>
    <form method="post" action="<%=ctx%>/volunteer/complete">
        <input type="hidden" name="visitId" value="${visit.id}">
        <label>Actual duration in minutes</label>
        <input type="number" name="duration" min="1" required>
        <label>Volunteer notes</label>
        <textarea name="notes"></textarea>
        <button>Save Completed Visit</button>
    </form>
</div>
<%@ include file="../partials/footer.jspf" %>

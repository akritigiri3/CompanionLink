<%@ include file="../partials/header.jspf" %>
<div class="card form-card">
    <h1>Rate Volunteer</h1>
    <p>Volunteer: <b>${visit.volunteerName}</b> | Activity: ${visit.activityName}</p>
    <form method="post" action="<%=ctx%>/senior/rate">
        <input type="hidden" name="visitId" value="${visit.id}">
        <label>Rating</label>
        <select name="stars">
            <option value="5">5 - Excellent</option>
            <option value="4">4 - Good</option>
            <option value="3">3 - Average</option>
            <option value="2">2 - Poor</option>
            <option value="1">1 - Very poor</option>
        </select>
        <label>Comment</label>
        <textarea name="comment">
        </textarea><button>Submit Rating</button>
    </form>
</div>
<%@ include file="../partials/footer.jspf" %>

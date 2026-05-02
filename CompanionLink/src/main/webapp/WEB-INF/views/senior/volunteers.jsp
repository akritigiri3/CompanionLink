<%@ include file="../partials/header.jspf" %>
<div class="page-title">
    <h1>Browse Approved Volunteers</h1>
    <a class="btn secondary" href="<%=ctx%>/senior/wishlist">Session Wishlist</a>
</div>
<div class="card">
    <form method="get" action="<%=ctx%>/senior/volunteers" class="field-grid">
        <input name="q" value="${keyword}" placeholder="Search skills, availability, name">
        <button>Search</button>
    </form>
</div>
<div class="grid two">
    <c:forEach var="v" items="${volunteers}">
        <div class="card"><h2>${v.fullName}</h2>
            <p class="stars">Average rating: ${v.averageRating}</p>
            <p><b>Skills:</b> ${v.skills}</p>
            <p><b>Availability:</b> ${v.availability}</p>
            <p>${v.bio}</p><form method="post" action="<%=ctx%>/senior/wishlist">
                <input type="hidden" name="id" value="${v.id}">
                <button>Add to Wishlist</button>
            </form>
        </div></c:forEach></div>
<%@ include file="../partials/footer.jspf" %>

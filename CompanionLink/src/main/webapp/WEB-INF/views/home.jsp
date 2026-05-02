<%@ include file="partials/header.jspf" %>
<section class="hero">
    <div>
        <h1>Safe companionship for elderly people.</h1>
        <p>CompanionLink helps seniors request friendly support such as walks, tea conversation, smartphone help, reading, and grocery companionship. Approved volunteers can accept requests and admins monitor safety.</p>
        <div class="actions">
            <a class="btn" href="<%=ctx%>/register">Create Account</a>
            <a class="btn secondary" href="<%=ctx%>/login">Login</a>
        </div>
    </div>
    <div class="card">
        <h2>Three portals</h2>
        <p><b>Seniors:</b> requests, volunteers, visits, ratings, reports.</p>
        <p><b>Volunteers:</b> requests, schedule, completed visit logs.</p>
        <p><b>Admins:</b> approval, CRUD, monitoring, analytics.</p>
    </div>
</section>
<div class="grid">
    <div class="card">
        <h3>Trust first</h3>
        <p>Volunteer approval gate blocks unapproved volunteers.</p>
    </div>
    <div class="card">
        <h3>Elder-friendly</h3>
        <p>Large readable text and simple forms.</p>
    </div>
    <div class="card">
        <h3>MVC Java</h3>
        <p>Servlets, DAOs, models, JSP, MySQL and filter.</p>
    </div>
</div>
<%@ include file="partials/footer.jspf" %>

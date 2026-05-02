<%@ include file="../partials/header.jspf" %>
<div class="card form-card"><h1>Login</h1><form method="post" action="<%=ctx%>/login"><label>Email</label><input type="email" name="email" required><label>Password</label><input type="password" name="password" required><div class="actions"><button type="submit">Login</button><a href="<%=ctx%>/register">Create account</a></div></form><hr><p class="muted"><b>Demo:</b> admin@companionlink.local / Admin123, senior@companionlink.local / Senior123, volunteer@companionlink.local / Volunteer123</p></div>
<%@ include file="../partials/footer.jspf" %>

<%@ include file="../partials/header.jspf" %>
<div class="card"><h1>Something went wrong</h1><p>Please check your input, database connection, or Tomcat logs.</p><p class="muted">${pageContext.exception.message}</p><a class="btn" href="<%=ctx%>/home">Back home</a></div>
<%@ include file="../partials/footer.jspf" %>

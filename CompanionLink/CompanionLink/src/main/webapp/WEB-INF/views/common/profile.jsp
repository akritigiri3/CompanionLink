<%@ include file="../partials/header.jspf" %>
<div class="page-title"><h1>My Profile</h1>
</div>
<div class="grid two">
    <div class="card">
        <h2>Update profile</h2>
        <form method="post" action="<%=ctx%>/profile">
            <label>Full name</label>
            <input name="fullName" value="${currentUser.fullName}" required>
            <label>Phone</label>
            <input name="phone" value="${currentUser.phone}" required>
            <label>Address / Area</label>
            <input name="address" value="${currentUser.address}">
<c:if test="${currentUser.role == 'SENIOR'}">
    <label>Health notes</label>
    <textarea name="healthNotes">${currentUser.healthNotes}</textarea>
    <label>Emergency contact</label>
    <input name="emergencyContact" value="${currentUser.emergencyContact}">
</c:if>
<c:if test="${currentUser.role == 'VOLUNTEER'}">
    <label>Bio</label>
    <textarea name="bio">${currentUser.bio}</textarea>
    <label>Skills</label>
    <input name="skills" value="${currentUser.skills}">
    <label>Availability</label>
    <input name="availability" value="${currentUser.availability}">
</c:if>
<button type="submit">Save profile</button>
        </form></div><div class="card">
    <h2>Change password</h2>
    <form method="post" action="<%=ctx%>/profile">
        <input type="hidden" name="action" value="password">
        <label>Current password</label>
        <input type="password" name="oldPassword" required>
        <label>New password</label><input type="password" name="newPassword" required>
        <button type="submit">Change password</button>
    </form>
</div>
</div>
<%@ include file="../partials/footer.jspf" %>

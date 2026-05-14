<%@ include file="../partials/header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login – CompanionLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --blue: #2B5CE6; --blue-dark: #1a3fbf;
            --dark: #0f172a; --text: #374151; --muted: #6B7280;
            --border: #E5E7EB; --white: #ffffff; --bg: #F8FAFC;
        }
        body { font-family: 'Manrope', sans-serif; color: var(--text); background: var(--bg); }

        /* MAIN */
        .page-wrap { padding: 60px 5%; min-height: calc(100vh - 72px - 180px); display: flex; align-items: flex-start; justify-content: center; }
        .login-card {
            background: var(--white); border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,.07);
            padding: 48px 44px; width: 100%; max-width: 560px;
        }
        .card-logo { text-align: center; margin-bottom: 10px; }
        .card-logo svg { width: 48px; height: 48px; stroke: var(--blue); fill: none; stroke-width: 1.8; }
        .card-logo h2 { font-size: 1.6rem; font-weight: 800; color: var(--dark); margin-top: 12px; }
        .card-logo p { font-size: 0.9rem; color: var(--muted); margin-top: 6px; }

        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 0.9rem; font-weight: 600; color: var(--dark); margin-bottom: 8px; }
        .form-group input, .form-group select {
            width: 100%; padding: 12px 16px; border: 1.5px solid var(--border);
            border-radius: 8px; font-size: 0.95rem; font-family: inherit;
            color: var(--dark); transition: border-color .2s; outline: none;
        }
        .form-group input:focus, .form-group select:focus { border-color: var(--blue); }
        .form-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .checkbox-label { display: flex; align-items: center; gap: 8px; font-size: 0.9rem; color: var(--text); cursor: pointer; }
        .checkbox-label input { width: auto; }
        .forgot-link { font-size: 0.9rem; color: var(--blue); text-decoration: none; font-weight: 500; }
        .forgot-link:hover { text-decoration: underline; }
        .btn-signin {
            width: 100%; background: var(--blue); color: var(--white); padding: 14px;
            border: none; border-radius: 8px; font-size: 1rem; font-weight: 700;
            cursor: pointer; transition: background .2s; font-family: inherit;
            display: flex; align-items: center; justify-content: center; gap: 8px;
        }
        .btn-signin:hover { background: var(--blue-dark); }
        .btn-signin svg { width: 18px; height: 18px; stroke: white; fill: none; stroke-width: 2; }

        /* DEMO BOX */
        .demo-box { background: #EFF6FF; border: 1px solid #BFDBFE; border-radius: 10px; padding: 20px; margin: 20px 0; }
        .demo-box h4 { font-size: 0.95rem; font-weight: 700; color: var(--blue); margin-bottom: 6px; }
        .demo-box p { font-size: 0.88rem; color: #1E40AF; line-height: 1.6; }

        /* DIVIDER */
        .divider { border: none; border-top: 1px solid var(--border); margin: 20px 0; }

        .signup-text { text-align: center; font-size: 0.9rem; color: var(--muted); margin-bottom: 12px; }
        .signup-text a { color: var(--blue); font-weight: 700; text-decoration: none; }
        .signup-text a:hover { text-decoration: underline; }
        .support-text { text-align: center; font-size: 0.9rem; color: var(--muted); }
        .support-text a { color: var(--blue); font-weight: 500; text-decoration: none; }
        .support-text a:hover { text-decoration: underline; }

        /* MODAL */
        .modal-overlay {
            display: none; position: fixed; inset: 0;
            background: rgba(0,0,0,.45); z-index: 999;
            align-items: center; justify-content: center;
        }
        .modal-overlay.active { display: flex; }
        .modal {
            background: var(--white); border-radius: 16px; padding: 40px 36px;
            text-align: center; max-width: 420px; width: 90%;
            animation: popIn .3s ease;
        }
        @keyframes popIn { from { transform: scale(.85); opacity: 0; } to { transform: scale(1); opacity: 1; } }
        .modal-icon { width: 64px; height: 64px; background: #D1FAE5; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px; }
        .modal-icon svg { width: 32px; height: 32px; stroke: #059669; fill: none; stroke-width: 2.5; }
        .modal h3 { font-size: 1.3rem; font-weight: 800; color: var(--dark); margin-bottom: 10px; }
        .modal p { font-size: 0.92rem; color: var(--muted); margin-bottom: 24px; line-height: 1.6; }
        .modal-btn { background: var(--blue); color: var(--white); padding: 11px 28px; border: none; border-radius: 8px; font-weight: 700; cursor: pointer; font-family: inherit; font-size: 0.95rem; }

    </style>
</head>
<body>

<div class="page-wrap">
    <div class="login-card">
        <div class="card-logo">
            <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            <h2>Welcome Back</h2>
            <p>Sign in to access your CompanionLink account</p>
        </div>

        <div style="height:28px"></div>

        <div class="form-group">
            <label>I am a...</label>
            <select id="loginRole">
                <option>Senior (Elderly Person)</option>
                <option>Volunteer</option>
                <option>Administrator</option>
            </select>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <input type="email" id="loginEmail" placeholder="your.email@example.com"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" id="loginPassword" placeholder="Enter your password"/>
        </div>

        <div class="form-row">
            <label class="checkbox-label">
                <input type="checkbox"/> Remember me
            </label>
        </div>

        <button class="btn-signin" onclick="handleLogin()">
            <svg viewBox="0 0 24 24"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
            Sign In
        </button>

        <div class="demo-box">
            <h4>Demo Credentials</h4>
            <p>Use any email and password to explore the demo dashboards</p>
            <p>Select your role above and click Sign In</p>
        </div>

        <hr class="divider"/>

        <p class="signup-text">Don't have an account? <a href="<%=ctx%>/register">Sign up here</a></p>
        <p class="support-text">Need help signing in? <a href="<%=ctx%>/contact">Contact our support team</a></p>
    </div>
</div>

<!-- SUCCESS MODAL -->
<div class="modal-overlay" id="loginModal">
    <div class="modal">
        <div class="modal-icon">
            <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
        </div>
        <h3>You have successfully logged in!</h3>
        <p>Welcome back to CompanionLink. You are now signed in to your account.</p>
        <button class="modal-btn" onclick="closeLoginModal()">Continue</button>
    </div>
</div>

<script>

    let selectedRole = "";

    function handleLogin() {

        const email = document.getElementById("loginEmail").value.trim();
        const password = document.getElementById("loginPassword").value.trim();

        selectedRole = document.getElementById("loginRole").value;

        if(email === "" || password === "") {
            alert("Please enter email and password");
            return;
        }

        // Show success modal
        document.getElementById("loginModal").classList.add("active");
    }

    function closeLoginModal() {

        document.getElementById("loginModal").classList.remove("active");

        // Redirect according to role

        if(selectedRole === "Senior (Elderly Person)") {

            window.location.href = "<%=ctx%>/senior/dashboard.jsp";

        }
        else if(selectedRole === "Volunteer") {

            window.location.href = "<%=ctx%>/volunteer/dashboard.jsp";

        }
        else if(selectedRole === "Administrator") {

            window.location.href = "<%=ctx%>/admin/dashboard.jsp";

        }
    }

</script>
</body>
</html>

<%@ include file="../partials/footer.jspf" %>

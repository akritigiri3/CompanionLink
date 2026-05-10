<!DOCTYPE html>
<%@ include file="../partials/header.jspf" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Register – CompanionLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800\&display=swap" rel="stylesheet"/>
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
        .register-card {
            background: var(--white); border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,.07);
            padding: 48px 44px; width: 100%; max-width: 600px;
        }
        .card-logo { text-align: center; margin-bottom: 28px; }
        .card-logo svg { width: 48px; height: 48px; stroke: var(--blue); fill: none; stroke-width: 1.8; }
        .card-logo h2 { font-size: 1.6rem; font-weight: 800; color: var(--dark); margin-top: 12px; }
        .card-logo p { font-size: 0.9rem; color: var(--muted); margin-top: 6px; }

        /* STEPPER */
        .stepper { display: flex; align-items: center; justify-content: center; margin-bottom: 36px; gap: 0; }
        .step-circle {
            width: 40px; height: 40px; border-radius: 50%; display: flex;
            align-items: center; justify-content: center; font-weight: 700; font-size: 0.95rem;
            transition: background .3s, color .3s;
        }
        .step-circle.active { background: var(--blue); color: var(--white); }
        .step-circle.inactive { background: #E5E7EB; color: var(--muted); }
        .step-line { flex: 0 0 80px; height: 2px; background: #E5E7EB; margin: 0 4px; }
        .stepper-labels { display: flex; justify-content: space-between; margin-top: 8px; max-width: 200px; margin-left: auto; margin-right: auto; }
        .stepper-labels span { font-size: 0.78rem; color: var(--muted); font-weight: 500; }

        /* FORM */
        .step-panel { display: none; }
        .step-panel.active { display: block; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 0.9rem; font-weight: 600; color: var(--dark); margin-bottom: 8px; }
        .required { color: var(--blue); }
        .form-group input, .form-group select {
            width: 100%; padding: 12px 16px; border: 1.5px solid var(--border);
            border-radius: 8px; font-size: 0.95rem; font-family: inherit;
            color: var(--dark); transition: border-color .2s; outline: none;
        }
        .form-group input:focus, .form-group select:focus { border-color: var(--blue); }
        input[type="date"] { color: var(--muted); }

        /* STEP 2 */
        .password-hint { font-size: 0.78rem; color: var(--muted); margin-top: 6px; }

        /* BUTTONS */
        .btn-continue, .btn-register {
            width: 100%; background: var(--blue); color: var(--white); padding: 14px;
            border: none; border-radius: 8px; font-size: 1rem; font-weight: 700;
            cursor: pointer; transition: background .2s; font-family: inherit; margin-top: 4px;
        }
        .btn-continue:hover, .btn-register:hover { background: var(--blue-dark); }
        .btn-back {
            width: 100%; background: transparent; color: var(--text); padding: 12px;
            border: 1.5px solid var(--border); border-radius: 8px; font-size: 0.95rem;
            font-weight: 600; cursor: pointer; transition: border-color .2s; font-family: inherit;
            margin-bottom: 12px;
        }
        .btn-back:hover { border-color: var(--blue); color: var(--blue); }

        .divider { border: none; border-top: 1px solid var(--border); margin: 20px 0; }
        .signin-text { text-align: center; font-size: 0.9rem; color: var(--muted); }
        .signin-text a { color: var(--blue); font-weight: 700; text-decoration: none; }
        .signin-text a:hover { text-decoration: underline; }

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


        @media(max-width: 600px) {
            .register-card { padding: 32px 20px; }
            .footer-grid { grid-template-columns: 1fr; gap: 32px; }
        }
    </style>
</head>
<body>

<div class="page-wrap">
    <div class="register-card">
        <div class="card-logo">
            <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            <h2>Join CompanionLink</h2>
            <p>Create your account to get started</p>
        </div>

        <!-- STEPPER -->
        <div class="stepper">
            <div class="step-circle active" id="stepCircle1">1</div>
            <div class="step-line"></div>
            <div class="step-circle inactive" id="stepCircle2">2</div>
        </div>
        <div class="stepper-labels">
            <span>Basic Info</span>
            <span>Account Details</span>
        </div>

        <!-- STEP 1 -->
        <div class="step-panel active" id="step1" style="margin-top:24px">
            <div class="form-group">
                <label>I am registering as a...</label>
                <select id="regRole">
                    <option>Senior (Elderly Person)</option>
                    <option>Volunteer</option>
                </select>
            </div>
            <div class="form-group">
                <label>Full Name <span class="required">*</span></label>
                <input type="text" id="regName" placeholder="Enter your full name"/>
            </div>
            <div class="form-group">
                <label>Email Address <span class="required">*</span></label>
                <input type="email" id="regEmail" placeholder="your.email@example.com"/>
            </div>
            <div class="form-group">
                <label>Phone Number <span class="required">*</span></label>
                <input type="tel" id="regPhone" placeholder="+977 98XXXXXXXX"/>
            </div>
            <div class="form-group">
                <label>Date of Birth</label>
                <input type="date" id="regDob"/>
            </div>
            <div class="form-group">
                <label>Address/Location</label>
                <input type="text" id="regAddress" placeholder="City, District"/>
            </div>
            <button class="btn-continue" onclick="goToStep2()">Continue</button>
            <hr class="divider" style="margin-top:20px"/>
            <p class="signin-text">Already have an account? <a href="login.html">Sign in here</a></p>
        </div>

        <!-- STEP 2 -->
        <div class="step-panel" id="step2" style="margin-top:24px">
            <div class="form-group">
                <label>Create Password <span class="required">*</span></label>
                <input type="password" id="regPassword" placeholder="Create a strong password"/>
                <p class="password-hint">Minimum 8 characters with at least one number</p>
            </div>
            <div class="form-group">
                <label>Confirm Password <span class="required">*</span></label>
                <input type="password" id="regConfirm" placeholder="Re-enter your password"/>
            </div>
            <div class="form-group">
                <label>How did you hear about us?</label>
                <select id="regSource">
                    <option value="">Select an option</option>
                    <option>Friend or Family</option>
                    <option>Social Media</option>
                    <option>Hospital / Clinic</option>
                    <option>Community Center</option>
                    <option>Other</option>
                </select>
            </div>
            <button class="btn-back" onclick="goToStep1()">&#8592; Back</button>
            <button class="btn-register" onclick="handleRegister()">Create Account</button>
            <hr class="divider"/>
            <p class="signin-text">Already have an account? <a href="login.html">Sign in here</a></p>
        </div>
    </div>
</div>


<!-- SUCCESS MODAL -->
<div class="modal-overlay" id="registerModal">
    <div class="modal">
        <div class="modal-icon">
            <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
        </div>
        <h3>You have successfully registered!</h3>
        <p>Welcome to CompanionLink! Your account has been created. You can now sign in to your account.</p>
        <button class="modal-btn" onclick="closeRegisterModal()">Go to Login</button>
    </div>
</div>

<script>

    &#x20; function goToStep2() {

    &#x20;   const name = document.getElementById('regName').value.trim();

    &#x20;   const email = document.getElementById('regEmail').value.trim();

    &#x20;   const phone = document.getElementById('regPhone').value.trim();

    &#x20;   if (!name || !email || !phone) {

        &#x20;     alert('Please fill in Full Name, Email Address, and Phone Number to continue.');

        &#x20;     return;

        &#x20;   }

    &#x20;   document.getElementById('step1').classList.remove('active');

    &#x20;   document.getElementById('step2').classList.add('active');

    &#x20;   document.getElementById('stepCircle1').classList.remove('active');

    &#x20;   document.getElementById('stepCircle1').classList.add('inactive');

    &#x20;   document.getElementById('stepCircle2').classList.remove('inactive');

    &#x20;   document.getElementById('stepCircle2').classList.add('active');

    &#x20; }



    &#x20; function goToStep1() {

    &#x20;   document.getElementById('step2').classList.remove('active');

    &#x20;   document.getElementById('step1').classList.add('active');

    &#x20;   document.getElementById('stepCircle2').classList.remove('active');

    &#x20;   document.getElementById('stepCircle2').classList.add('inactive');

    &#x20;   document.getElementById('stepCircle1').classList.remove('inactive');

    &#x20;   document.getElementById('stepCircle1').classList.add('active');

    &#x20; }



    &#x20; function handleRegister() {

    &#x20;   const password = document.getElementById('regPassword').value.trim();

    &#x20;   const confirm = document.getElementById('regConfirm').value.trim();

    &#x20;   if (!password || !confirm) {

        &#x20;     alert('Please enter and confirm your password.');

        &#x20;     return;

        &#x20;   }

    &#x20;   if (password.length < 8) {

        &#x20;     alert('Password must be at least 8 characters long.');

        &#x20;     return;

        &#x20;   }

    &#x20;   if (password !== confirm) {

        &#x20;     alert('Passwords do not match. Please try again.');

        &#x20;     return;

        &#x20;   }

    &#x20;   document.getElementById('registerModal').classList.add('active');

    &#x20; }



    &#x20; function closeRegisterModal() {

    &#x20;   document.getElementById('registerModal').classList.remove('active');

    &#x20;   window.location.href = 'login.html';

    &#x20; }

    </body>
    </html>
    <%@ include file="../partials/footer.jspf" %>

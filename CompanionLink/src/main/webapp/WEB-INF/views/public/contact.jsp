<%@ include file="../partials/header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Contact – CompanionLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800\&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --blue: #2B5CE6; --blue-dark: #1a3fbf;
            --dark: #0f172a; --text: #374151; --muted: #6B7280;
            --border: #E5E7EB; --white: #ffffff; --bg: #F8FAFC;
            --red: #DC2626; --red-bg: #FEF2F2;
        }
        body { font-family: 'Manrope', sans-serif; color: var(--text); background: var(--white); }


        /* HERO */
        .page-hero {
            background: linear-gradient(135deg, var(--blue) 0%, #1a3fbf 100%);
            text-align: center; padding: 80px 5%;
        }
        .page-hero h1 { font-size: clamp(2rem, 4vw, 2.8rem); font-weight: 800; color: var(--white); margin-bottom: 16px; }
        .page-hero p { color: rgba(255,255,255,.85); font-size: 1.05rem; }

        /* EMERGENCY BANNER */
        .emergency-banner {
            background: var(--red-bg); border-left: 4px solid var(--red);
            padding: 24px 5%; display: flex; align-items: flex-start; gap: 16px;
        }
        .emergency-banner svg { width: 28px; height: 28px; stroke: var(--red); fill: none; stroke-width: 2; flex-shrink: 0; margin-top: 2px; }
        .emergency-banner h3 { font-size: 1rem; font-weight: 700; color: var(--red); margin-bottom: 4px; }
        .emergency-banner p { font-size: 0.9rem; color: var(--red); }
        .emergency-banner .phone { font-size: 1.2rem; font-weight: 800; color: var(--red); }

        /* MAIN CONTENT */
        .contact-body { display: grid; grid-template-columns: 1fr 1.4fr; gap: 64px; padding: 72px 5%; max-width: 1100px; margin: 0 auto; }

        /* LEFT */
        .contact-info h2 { font-size: 1.8rem; font-weight: 800; color: var(--dark); margin-bottom: 12px; }
        .contact-info > p { font-size: 0.95rem; color: var(--muted); line-height: 1.7; margin-bottom: 36px; }
        .info-item { display: flex; gap: 16px; align-items: flex-start; margin-bottom: 28px; }
        .info-icon { width: 48px; height: 48px; border-radius: 50%; background: var(--bg); display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .info-icon svg { width: 22px; height: 22px; stroke: var(--blue); fill: none; stroke-width: 2; }
        .info-item h4 { font-size: 1rem; font-weight: 700; color: var(--dark); margin-bottom: 4px; }
        .info-item p { font-size: 0.88rem; color: var(--muted); line-height: 1.6; }
        .info-item a { color: var(--blue); text-decoration: none; font-size: 0.9rem; }
        .info-item a:hover { text-decoration: underline; }

        /* RIGHT – FORM */
        .contact-form-wrap { background: var(--white); border: 1px solid var(--border); border-radius: 16px; padding: 36px; }
        .contact-form-wrap h3 { font-size: 1.4rem; font-weight: 800; color: var(--dark); margin-bottom: 24px; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 0.9rem; font-weight: 600; color: var(--dark); margin-bottom: 8px; }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%; padding: 12px 16px; border: 1.5px solid var(--border);
            border-radius: 8px; font-size: 0.95rem; font-family: inherit;
            color: var(--dark); transition: border-color .2s; outline: none; background: var(--white);
        }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus { border-color: var(--blue); }
        .form-group textarea { resize: vertical; min-height: 140px; }
        .btn-send {
            width: 100%; background: var(--blue); color: var(--white); padding: 14px;
            border: none; border-radius: 8px; font-size: 1rem; font-weight: 700;
            cursor: pointer; transition: background .2s; font-family: inherit;
        }
        .btn-send:hover { background: var(--blue-dark); }

        /* HELP BOX */
        .help-box { background: #EFF6FF; border: 1px solid #BFDBFE; border-radius: 12px; padding: 24px; margin-top: 28px; }
        .help-box h4 { font-size: 0.95rem; font-weight: 700; color: var(--blue); margin-bottom: 8px; }
        .help-box p { font-size: 0.88rem; color: #1E40AF; line-height: 1.6; }


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

        @media(max-width: 820px) {
            .contact-body { grid-template-columns: 1fr; padding: 48px 5%; }
            .footer-grid { grid-template-columns: 1fr; gap: 32px; }
        }
    </style>
</head>
<body>


<div class="page-hero">
    <h1>Contact Us</h1>
    <p>We're here to help. Reach out with any questions or concerns.</p>
</div>

<!-- EMERGENCY -->
<div class="emergency-banner">
    <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
    <div>
        <h3>Emergency Assistance</h3>
        <p>If you or someone you know needs immediate assistance, please call our 24/7 emergency support line:</p>
        <p class="phone">1-800-COMPANION <span style="font-weight:400;font-size:.95rem">(1-800-266-7264)</span></p>
    </div>
</div>

<div class="contact-body">
    <!-- LEFT -->
    <div class="contact-info">
        <h2>Get In Touch</h2>
        <p>Have questions about our platform? Need help getting started? We're here to assist you every step of the way.</p>

        <div class="info-item">
            <div class="info-icon">
                <svg viewBox="0 0 24 24"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12 19.79 19.79 0 0 1 1.6 3.38 2 2 0 0 1 3.57 1.22h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L7.91 8.96a16 16 0 0 0 6 6l.92-.92a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
            </div>
            <div>
                <h4>Phone</h4>
                <p>General Inquiries: <a href="tel:+97714123456">+977 1-4123456</a></p>
                <p>Emergency Line: <a href="tel:18002667264">1-800-COMPANION</a></p>
            </div>
        </div>

        <div class="info-item">
            <div class="info-icon">
                <svg viewBox="0 0 24 24"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
            </div>
            <div>
                <h4>Email</h4>
                <a href="mailto:support@companionlink.com">support@companionlink.com</a>
                <p>We typically respond within 24 hours</p>
            </div>
        </div>

        <div class="info-item">
            <div class="info-icon">
                <svg viewBox="0 0 24 24"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
            </div>
            <div>
                <h4>Address</h4>
                <p>Itahari International College<br>Itahari, Sunsari District<br>Province No. 1, Nepal</p>
            </div>
        </div>

        <div class="info-item">
            <div class="info-icon">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
            </div>
            <div>
                <h4>Office Hours</h4>
                <p>Monday - Friday: 9:00 AM - 5:00 PM<br>Saturday: 10:00 AM - 2:00 PM<br>Sunday: Closed<br><em>(Emergency line available 24/7)</em></p>
            </div>
        </div>
    </div>

    <!-- RIGHT -->
    <div class="contact-form-wrap">
        <h3>Send Us a Message</h3>
        <div class="form-group">
            <label>Your Name</label>
            <input type="text" id="contactName" placeholder="Enter your full name"/>
        </div>
        <div class="form-group">
            <label>Email Address</label>
            <input type="email" id="contactEmail" placeholder="your.email@example.com"/>
        </div>
        <div class="form-group">
            <label>Subject</label>
            <select id="contactSubject">
                <option value="">Select a subject</option>
                <option>General Inquiry</option>
                <option>Registration Help</option>
                <option>Volunteer Information</option>
                <option>Technical Support</option>
                <option>Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Message</label>
            <textarea id="contactMessage" placeholder="Tell us how we can help you..."></textarea>
        </div>
        <button class="btn-send" onclick="sendMessage()">Send Message</button>

        <div class="help-box">
            <h4>Need Help Getting Started?</h4>
            <p>If you're a senior or family member needing assistance with registration or using the platform, please don't hesitate to call us. We're happy to walk you through the process.</p>
        </div>
    </div>
</div>


<!-- SUCCESS MODAL -->
<div class="modal-overlay" id="successModal">
    <div class="modal">
        <div class="modal-icon">
            <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
        </div>
        <h3>Message Sent!</h3>
        <p>Thank you for reaching out. We've received your message and will get back to you within 24 hours.</p>
        <button class="modal-btn" onclick="closeModal()">Close</button>
    </div>
</div>

<script>

    &#x20; function sendMessage() {

    &#x20;   const name = document.getElementById('contactName').value.trim();

    &#x20;   const email = document.getElementById('contactEmail').value.trim();

    &#x20;   const subject = document.getElementById('contactSubject').value;

    &#x20;   const message = document.getElementById('contactMessage').value.trim();

    &#x20;   if (!name || !email || !subject || !message) {

        &#x20;     alert('Please fill in all fields before sending.');

        &#x20;     return;

        &#x20;   }

    &#x20;   document.getElementById('successModal').classList.add('active');

    &#x20; }

    &#x20; function closeModal() {

    &#x20;   document.getElementById('successModal').classList.remove('active');

    &#x20;   document.getElementById('contactName').value = '';

    &#x20;   document.getElementById('contactEmail').value = '';

    &#x20;   document.getElementById('contactSubject').value = '';

    &#x20;   document.getElementById('contactMessage').value = '';

    &#x20; }

    </body>
    </html>
<%@ include file="../partials/footer.jspf" %>
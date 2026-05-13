<%@ include file="partials/header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>CompanionLink – Never Feel Alone Again</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --blue: #2B5CE6;
            --blue-dark: #1a3fbf;
            --blue-light: #EEF2FF;
            --dark: #0f172a;
            --text: #374151;
            --muted: #6B7280;
            --border: #E5E7EB;
            --white: #ffffff;
            --bg: #F8FAFC;
        }

        body { font-family: 'Manrope', sans-serif; color: var(--text); background: var(--white); }



        /* HERO */
        .hero {
            background: var(--blue);
            text-align: center;
            padding: 90px 5% 100px;
            color: var(--white);
            border-radius: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .hero h1 { font-size: clamp(2.2rem, 5vw, 3.2rem); font-weight: 800; margin-bottom: 20px; color: white;}
        .hero p { font-size: 1.15rem; max-width: 620px; margin: 0 auto 40px; opacity: .9; }
        .hero-btns { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
        .btn-hero-white {
            background: var(--white); color: var(--blue); padding: 14px 32px;
            border-radius: 8px; font-weight: 700; font-size: 1rem; text-decoration: none;
            transition: background .2s; min-width: 200px; text-align: center;
        }
        .btn-hero-white:hover { background: #f0f4ff; }
        .btn-hero-outline {
            background: transparent; color: var(--white); padding: 14px 32px;
            border: 2px solid var(--white); border-radius: 8px; font-weight: 700;
            font-size: 1rem; text-decoration: none; transition: background .2s;
            min-width: 200px; text-align: center;
        }
        .btn-hero-outline:hover { background: rgba(255,255,255,.15); }

        /* SECTIONS */
        section { padding: 80px 5%; }
        .section-title { font-size: 2rem; font-weight: 800; color: var(--dark); text-align: center; margin-bottom: 48px; }

        /* HOW IT WORKS */
        .how-it-works { background: var(--white); }
        .steps { display: flex; gap: 32px; justify-content: center; flex-wrap: wrap; }
        .step { text-align: center; max-width: 260px; }
        .step-icon {
            width: 80px; height: 80px; border-radius: 50%; display: flex;
            align-items: center; justify-content: center; margin: 0 auto 20px;
        }
        .step-icon.blue { background: #DBEAFE; }
        .step-icon.green { background: #D1FAE5; }
        .step-icon.purple { background: #EDE9FE; }
        .step-icon svg { width: 36px; height: 36px; stroke-width: 2; }
        .step h3 { font-size: 1.1rem; font-weight: 700; color: var(--dark); margin-bottom: 8px; }
        .step p { font-size: 0.92rem; color: var(--muted); }

        /* WHY CHOOSE */
        .why-choose { background: var(--bg); }
        .features-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 24px; max-width: 900px; margin: 0 auto; }
        .feature-card {
            background: var(--white); border-radius: 12px; padding: 28px;
            display: flex; gap: 18px; align-items: flex-start;
        }
        .feature-icon { width: 32px; height: 32px; flex-shrink: 0; margin-top: 3px; }
        .feature-card h3 { font-size: 1rem; font-weight: 700; color: var(--dark); margin-bottom: 6px; }
        .feature-card p { font-size: 0.88rem; color: var(--muted); line-height: 1.6; }

        /* ACTIVITIES */
        .activities { background: var(--white); }
        .activities-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 16px; max-width: 1000px; margin: 0 auto; }
        .activity-card {
            border: 1.5px solid var(--border); border-radius: 10px; padding: 20px;
            text-align: center; font-weight: 600; font-size: 0.95rem; color: var(--dark);
            transition: border-color .2s, box-shadow .2s; cursor: default;
        }
        .activity-card:hover { border-color: var(--blue); box-shadow: 0 4px 12px rgba(43,92,230,.12); }

        /* CTA */
        .cta-section { background: var(--blue); text-align: center; }
        .cta-section h2 { font-size: 2.2rem; font-weight: 800; color: var(--white); margin-bottom: 16px; }
        .cta-section p { color: rgba(255,255,255,.85); font-size: 1.05rem; margin-bottom: 36px; }


    </style>
</head>
<body>



<!-- HERO -->
<section class="hero">
    <h1>Never Feel Alone Again</h1>
    <p>CompanionLink connects seniors with caring volunteers for meaningful companionship and social activities</p>
    <div class="hero-btns">
        <a href="<%=ctx%>/register" class="btn-hero-white">Get Started Today</a>
        <a href="<%=ctx%>/about" class="btn-hero-outline">Learn More</a>
    </div>
</section>

<!-- HOW IT WORKS -->
<section class="how-it-works">
    <h2 class="section-title">How CompanionLink Works</h2>
    <div class="steps">
        <div class="step">
            <div class="step-icon blue">
                <svg viewBox="0 0 24 24" stroke="#2B5CE6" fill="none"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            </div>
            <h3>Create Your Profile</h3>
            <p>Sign up and tell us about yourself and the activities you enjoy</p>
        </div>
        <div class="step">
            <div class="step-icon green">
                <svg viewBox="0 0 24 24" stroke="#059669" fill="none"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
            </div>
            <h3>Request Companionship</h3>
            <p>Choose an activity and time that works best for you</p>
        </div>
        <div class="step">
            <div class="step-icon purple">
                <svg viewBox="0 0 24 24" stroke="#7C3AED" fill="none"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
            <h3>Connect &amp; Enjoy</h3>
            <p>Meet your volunteer companion and enjoy meaningful activities together</p>
        </div>
    </div>
</section>

<!-- WHY CHOOSE -->
<section class="why-choose">
    <h2 class="section-title">Why Choose CompanionLink?</h2>
    <div class="features-grid">
        <div class="feature-card">
            <svg class="feature-icon" viewBox="0 0 24 24" stroke="#2B5CE6" fill="none" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            <div>
                <h3>Safe &amp; Secure</h3>
                <p>All volunteers are carefully vetted and approved by our administrators before they can connect with seniors</p>
            </div>
        </div>
        <div class="feature-card">
            <svg class="feature-icon" viewBox="0 0 24 24" stroke="#2B5CE6" fill="none" stroke-width="2"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            <div>
                <h3>Rated Volunteers</h3>
                <p>Browse volunteer profiles with ratings and reviews from other seniors to find the perfect match</p>
            </div>
        </div>
        <div class="feature-card">
            <svg class="feature-icon" viewBox="0 0 24 24" stroke="#2B5CE6" fill="none" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
            <div>
                <h3>Flexible Scheduling</h3>
                <p>Choose activities and times that work for your schedule and preferences</p>
            </div>
        </div>
        <div class="feature-card">
            <svg class="feature-icon" viewBox="0 0 24 24" stroke="#2B5CE6" fill="none" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M8.56 2.75c4.37 6.03 6.02 9.42 8.03 17.72m2.54-15.38c-3.72 4.35-8.94 5.66-16.88 5.85m19.5 1.9c-3.5-.93-6.63-.82-8.94 0-2.58.92-5.01 2.86-7.44 6.32"/></svg>
            <div>
                <h3>Community-Driven</h3>
                <p>Connect with caring volunteers from your local community who genuinely want to help</p>
            </div>
        </div>
    </div>
</section>

<!-- POPULAR ACTIVITIES -->
<section class="activities">
    <h2 class="section-title">Popular Activities</h2>
    <div class="activities-grid">
        <div class="activity-card">Walking Together</div>
        <div class="activity-card">Tea &amp; Conversation</div>
        <div class="activity-card">Help with Technology</div>
        <div class="activity-card">Grocery Shopping</div>
        <div class="activity-card">Reading Together</div>
        <div class="activity-card">Board Games</div>
        <div class="activity-card">Garden Care</div>
        <div class="activity-card">Doctor Visits</div>
    </div>
</section>

<!-- CTA -->
<section class="cta-section">
    <h2>Ready to Make a Connection?</h2>
    <p>Join CompanionLink today and start enjoying meaningful companionship</p>
    <a href="<%=ctx%>/register" class="btn-hero-white">Sign Up Now</a>
</section>


<script>
    // Highlight active nav link based on current page
    const links = document.querySelectorAll('.nav-links a');
    links.forEach(link => {
        if (link.href === window.location.href) {
            link.classList.add('active');
        }
    });
</script>
</body>
</html>


<%@ include file="partials/footer.jspf" %>

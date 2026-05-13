<%@ include file="../partials/header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>About – CompanionLink</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        :root {
            --blue: #2B5CE6; --blue-dark: #1a3fbf; --blue-light: #EEF2FF;
            --dark: #0f172a; --text: #374151; --muted: #6B7280;
            --border: #E5E7EB; --white: #ffffff; --bg: #F8FAFC;
        }
        body { font-family: 'Manrope', sans-serif; color: var(--text); background: var(--white); }



        /* HERO */
        .page-hero { background: var(--dark); text-align: center; padding: 80px 5%; }
        .page-hero h1 { font-size: clamp(2rem, 4vw, 2.8rem); font-weight: 800; color: var(--white); margin-bottom: 16px; }
        .page-hero p { color: rgba(255,255,255,.8); font-size: 1.1rem; max-width: 640px; margin: 0 auto; }

        /* SECTIONS */
        section { padding: 72px 5%; }
        .section-title { font-size: 1.8rem; font-weight: 800; color: var(--dark); text-align: center; margin-bottom: 40px; }
        .container { max-width: 900px; margin: 0 auto; }

        /* MISSION */
        .mission { background: var(--white); }
        .mission p { font-size: 1rem; line-height: 1.8; color: var(--text); margin-bottom: 20px; }

        /* CORE VALUES */
        .core-values { background: var(--bg); }
        .values-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; }
        .value-card { background: var(--white); border-radius: 14px; padding: 32px 20px; text-align: center; }
        .value-icon { width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; }
        .value-icon.blue-bg { background: #DBEAFE; }
        .value-icon.green-bg { background: #D1FAE5; }
        .value-icon.purple-bg { background: #EDE9FE; }
        .value-icon.orange-bg { background: #FEF3C7; }
        .value-card h3 { font-size: 1rem; font-weight: 700; color: var(--dark); margin-bottom: 8px; }
        .value-card p { font-size: 0.88rem; color: var(--muted); line-height: 1.6; }

        /* PROBLEM / SOLUTION */
        .problem-solution { background: var(--white); }
        .ps-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 48px; max-width: 1000px; margin: 0 auto; }
        .ps-col h3 { font-size: 1.5rem; font-weight: 800; color: var(--dark); margin-bottom: 24px; }
        .ps-col p { font-size: 0.95rem; line-height: 1.75; color: var(--text); margin-bottom: 14px; }
        .ps-col p strong { color: var(--dark); }

        /* TEAM */
        .team { background: var(--bg); }
        .team-sub { text-align: center; color: var(--muted); margin-bottom: 48px; font-size: 0.95rem; }
        .team-grid { display: flex; gap: 20px; justify-content: center; flex-wrap: wrap; }
        .team-card { background: var(--white); border-radius: 14px; padding: 28px 20px; text-align: center; width: 180px; }
        .avatar { width: 68px; height: 68px; border-radius: 50%; background: #DBEAFE; display: flex; align-items: center; justify-content: center; margin: 0 auto 14px; }
        .avatar svg { width: 36px; height: 36px; stroke: var(--blue); fill: none; stroke-width: 2; }
        .team-card h4 { font-size: 0.95rem; font-weight: 700; color: var(--dark); margin-bottom: 4px; }
        .team-card span { font-size: 0.82rem; color: var(--muted); }


    </style>
</head>
<body>



<!-- HERO -->
<div class="page-hero">
    <h1>About CompanionLink</h1>
    <p>Building bridges between generations to combat loneliness and isolation in our elderly community</p>
</div>

<!-- MISSION -->
<section class="mission">
    <div class="container">
        <h2 class="section-title">Our Mission</h2>
        <p>CompanionLink was created to address one of the most severe yet overlooked social health problems: loneliness and social isolation among the elderly.</p>
        <p>As people age, they often experience reduced social interaction due to retirement, loss of mobility, and the passing of friends and family. This isolation can lead to serious health consequences including depression, cognitive decline, and increased mortality risk.</p>
        <p>We provide a safe, accessible platform that connects seniors with vetted community volunteers who can offer companionship, assistance, and genuine human connection.</p>
    </div>
</section>

<!-- CORE VALUES -->
<section class="core-values">
    <h2 class="section-title">Our Core Values</h2>
    <div class="values-grid" style="max-width:900px;margin:0 auto">
        <div class="value-card">
            <div class="value-icon blue-bg">
                <svg width="32" height="32" viewBox="0 0 24 24" stroke="#2B5CE6" fill="none" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
            <h3>Compassion</h3>
            <p>We treat every senior with dignity, respect, and genuine care</p>
        </div>
        <div class="value-card">
            <div class="value-icon green-bg">
                <svg width="32" height="32" viewBox="0 0 24 24" stroke="#059669" fill="none" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            </div>
            <h3>Safety</h3>
            <p>All volunteers are thoroughly vetted before approval</p>
        </div>
        <div class="value-card">
            <div class="value-icon purple-bg">
                <svg width="32" height="32" viewBox="0 0 24 24" stroke="#7C3AED" fill="none" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            </div>
            <h3>Community</h3>
            <p>Building stronger neighborhoods through connection</p>
        </div>
        <div class="value-card">
            <div class="value-icon orange-bg">
                <svg width="32" height="32" viewBox="0 0 24 24" stroke="#D97706" fill="none" stroke-width="2"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>
            </div>
            <h3>Accessibility</h3>
            <p>Simple, user-friendly platform designed for seniors</p>
        </div>
    </div>
</section>

<!-- PROBLEM / SOLUTION -->
<section class="problem-solution">
    <div class="ps-grid">
        <div class="ps-col">
            <h3>The Problem</h3>
            <p><strong>Social Isolation:</strong> Older adults experience reduced social interaction as friends pass away, children move away, and mobility decreases.</p>
            <p><strong>Health Impact:</strong> Chronic loneliness is linked to depression, cognitive decline, cardiovascular disease, and higher mortality rates.</p>
            <p><strong>Existing Gaps:</strong> Formal care services are expensive and impersonal. Community volunteers exist but lack organized, safe connection channels.</p>
        </div>
        <div class="ps-col">
            <h3>Our Solution</h3>
            <p><strong>Digital Bridge:</strong> CompanionLink creates an organized platform connecting seniors with verified community volunteers.</p>
            <p><strong>Safety First:</strong> Administrator approval ensures all volunteers are vetted before accessing senior requests.</p>
            <p><strong>Community-Driven:</strong> Local volunteers provide free, genuine companionship that preserves dignity and builds real connections.</p>
        </div>
    </div>
</section>

<!-- TEAM -->
<section class="team">
    <h2 class="section-title">Built by Binary Titans</h2>
    <p class="team-sub">A student project developed for CS5054NT Advanced Programming &amp; Technologies<br>at Itahari International College (London Metropolitan University)</p>
    <div class="team-grid">
        <div class="team-card">
            <div class="avatar"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
            <h4>Akriti Giri</h4>
            <span>Team Leader</span>
        </div>
        <div class="team-card">
            <div class="avatar"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
            <h4>Anamika Heju Shrestha</h4>
            <span>Developer</span>
        </div>
        <div class="team-card">
            <div class="avatar"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
            <h4>Anish Biswakarma</h4>
            <span>Developer</span>
        </div>
        <div class="team-card">
            <div class="avatar"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
            <h4>Tanisha Shrestha</h4>
            <span>Developer</span>
        </div>
        <div class="team-card">
            <div class="avatar"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
            <h4>Prabhakar Rai</h4>
            <span>Developer</span>
        </div>
    </div>
</section>

<script>
    const links = document.querySelectorAll('.nav-links a');
    links.forEach(link => {
        if (link.href === window.location.href) link.classList.add('active');
    });
</script>
</body>
</html>
<%@ include file="../partials/footer.jspf" %>

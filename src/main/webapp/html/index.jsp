<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #a855f7 50%, #ec4899 100% );
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --bg-light: #f8fafc;
            --card-bg: #ffffff;
            --radius: 12px;
            --transition: all 0.3s ease;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background-color: var(--bg-light); color: var(--text-dark); line-height: 1.6; }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(226, 232, 240, 0.8);
        }

        .logo {
            font-size: 1.75rem;
            font-weight: 800;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-decoration: none;
            letter-spacing: -0.5px;
        }

        .nav-links { display: flex; gap: 1.5rem; align-items: center; list-style: none; margin: 0; }
        .nav-links a { text-decoration: none; color: var(--text-dark); font-weight: 600; font-size: 0.95rem; }

        .btn-gradient {
            background: var(--primary-gradient);
            color: #ffffff !important;
            padding: 0.6rem 1.25rem;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
            border: none;
            transition: transform 0.2s ease;
        }
        .btn-gradient:hover { transform: translateY(-2px); }

        /* Hero Section */
        .hero {
            padding: 6rem 5% 4rem;
            text-align: center;
            max-width: 900px;
            margin: 0 auto;
        }
        .hero h1 { font-size: 3.5rem; font-weight: 800; line-height: 1.2; margin-bottom: 1.5rem; color: var(--text-dark); }
        .hero h1 span { background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .hero p { font-size: 1.25rem; color: var(--text-muted); max-width: 700px; margin: 0 auto; }

        /* Grid Section */
        .container { max-width: 1200px; padding: 4rem 5%; }
        .section-title { font-size: 1.75rem; font-weight: 800; margin-bottom: 2rem; }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 2rem;
        }

        .card {
            background: var(--card-bg);
            padding: 1.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(226, 232, 240, 0.8);
            transition: var(--transition);
        }
        .card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08); }

        .cover-placeholder {
            height: 200px;
            border-radius: 12px;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 800;
            font-size: 1.5rem;
            text-transform: uppercase;
        }

        .card h3 { font-size: 1.1rem; font-weight: 700; margin-bottom: 0.5rem; }
        .card p { color: var(--text-muted); font-size: 0.9rem; margin: 0; }

        /* Bootstrap Dropdown Adjustment */
        .dropdown-toggle { background: var(--primary-gradient) !important; border: none !important; border-radius: 50px !important; padding: 0.6rem 1.25rem !important; }
    </style>
</head>
<body>

<header class="navbar">
    <a href="${pageContext.request.contextPath}/" class="logo">Library</a>
    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/book_list">My Books</a></li>
        <li><a href="${pageContext.request.contextPath}/add_book" class="btn-gradient">+ Add Book</a></li>

        <% if (request.getSession().getAttribute("user") != null) { %>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                ${user.getUsername()}
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Edit profile</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </div>
        <% } else { %>
        <li><a href="${pageContext.request.contextPath}/login" class="btn-nav-login">Login</a></li>
        <li><a href="${pageContext.request.contextPath}/register" class="btn-nav-signup">Sign Up</a></li>
        <% } %>
    </ul>
</header>

<main>
    <section class="hero">
        <h1>Your personal gateway to <span>endless knowledge</span></h1>
        <p>Explore thousands of books, track your reading collection, and organize your digital personal bookshelf effortlessly.</p>
    </section>

    <section class="container">
        <h2 class="section-title">Recently Added</h2>
        <div class="grid">
            <div class="card">
                <div class="cover-placeholder" style="background: linear-gradient(135deg, #4f46e5, #06b6d4);">Java</div>
                <h3>Effective Java</h3>
                <p>Joshua Bloch</p>
            </div>
            <div class="card">
                <div class="cover-placeholder" style="background: linear-gradient(135deg, #f59e0b, #ef4444);">Design</div>
                <h3>Clean Code</h3>
                <p>Robert C. Martin</p>
            </div>
            <div class="card">
                <div class="cover-placeholder" style="background: linear-gradient(135deg, #10b981, #3b82f6);">Data</div>
                <h3>System Design</h3>
                <p>Alex Xu</p>
            </div>
            <div class="card">
                <div class="cover-placeholder" style="background: linear-gradient(135deg, #8b5cf6, #ec4899);">Web</div>
                <h3>Modern Web Dev</h3>
                <p>Jane Doe</p>
            </div>
        </div>
    </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

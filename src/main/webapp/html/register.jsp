<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #a855f7 50%, #ec4899 100% );
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --bg-light: #f8fafc;
            --card-bg: #ffffff;
            --radius: 12px;
            --error-red: #ef4444;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', system-ui, sans-serif; }
        body { background-color: var(--bg-light); color: var(--text-dark); line-height: 1.6; }

        /* Navbar Styles */
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

        /* Auth Card Styles */
        main { display: flex; justify-content: center; align-items: center; padding: 3rem 1rem; min-height: 80vh; }
        .auth-container { width: 100%; max-width: 450px; }
        .auth-card {
            background: var(--card-bg);
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(226, 232, 240, 0.8);
        }

        .auth-title { font-size: 2rem; font-weight: 800; margin-bottom: 0.5rem; text-align: center; }
        .auth-title span { background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .auth-subtitle { color: var(--text-muted); text-align: center; margin-bottom: 2rem; font-size: 0.95rem; }

        .form-group { margin-bottom: 1.25rem; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 0.5rem; font-size: 0.9rem; }
        .form-group input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1.5px solid #e2e8f0;
            border-radius: 10px;
            outline: none;
            transition: all 0.3s ease;
        }
        .form-group input:focus { border-color: #6366f1; box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1); }

        .btn-full { width: 100%; margin-top: 1rem; font-weight: 700; }
        .auth-error { color: var(--error-red); text-align: center; margin-bottom: 1rem; font-weight: 600; }
        .auth-switch { text-align: center; margin-top: 1.5rem; font-size: 0.9rem; color: var(--text-muted); }
        .auth-switch a { color: #6366f1; text-decoration: none; font-weight: 700; }

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
    <div class="auth-container">
        <div class="auth-card">
            <h2 class="auth-title"><span>Create Account</span></h2>
            <p class="auth-subtitle">Join us and start managing your books</p>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <input type="hidden" name="action" value="register">

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required placeholder="Enter your name">
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required placeholder="Choose a username" value="${username}">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Create a password" minlength="8">
                </div>

                <div class="form-group">
                    <label for="password2">Confirm Password</label>
                    <input type="password" id="password2" name="password2" required placeholder="Repeat your password">
                </div>

                <c:if test="${not empty error}">
                    <p class="auth-error">${error}</p>
                </c:if>

                <button type="submit" class="btn-gradient btn-full">Register</button>
            </form>

            <p class="auth-switch">Already have an account?
                <a href="${pageContext.request.contextPath}/login">Log in</a>
            </p>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

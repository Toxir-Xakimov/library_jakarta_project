<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log Out - Library</title>

    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #a855f7 50%, #ec4899 100%);
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --bg-light: #f8fafc;
            --card-bg: #ffffff;
            --danger: #dc2626;
            --danger-dark: #b91c1c;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            min-height: 100vh;
            background: var(--bg-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background: rgba(255, 255, 255, 0.9);
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

        .nav-links {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .nav-links a {
            color: var(--text-dark);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 600;
            transition: 0.25s ease;
        }

        .nav-links a:hover {
            color: #6366f1;
        }

        .btn-gradient {
            display: inline-block;
            padding: 0.6rem 1.25rem;
            color: white !important;
            background: var(--primary-gradient);
            border: none;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
            transition: 0.25s ease;
        }

        .btn-gradient:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
        }

        .btn-nav-signup {
            padding: 0.6rem 1.25rem;
            background: #f1f5f9;
            border-radius: 50px;
        }

        /* Dropdown */
        .dropdown {
            position: relative;
        }

        .dropdown-toggle {
            color: white !important;
            background: var(--primary-gradient) !important;
            border: none !important;
            border-radius: 50px !important;
            padding: 0.6rem 1.25rem !important;
        }

        .dropdown-menu {
            min-width: 170px;
            border: none;
            border-radius: 12px;
            padding: 0.5rem;
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.15);
        }

        .dropdown-item {
            padding: 0.65rem 0.8rem;
            border-radius: 8px;
        }

        .dropdown-item:hover {
            background: #f1f5f9;
        }

        /* Logout Card */
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 80px);
            padding: 3rem 1rem;
        }

        .logout-card {
            width: 100%;
            max-width: 520px;
            padding: 3rem 2.5rem;
            text-align: center;
            background: var(--card-bg);
            border: 1px solid rgba(226, 232, 240, 0.9);
            border-radius: 22px;
            box-shadow: 0 15px 35px rgba(15, 23, 42, 0.08);
        }

        .logout-icon {
            width: 74px;
            height: 74px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            background: var(--primary-gradient);
            border-radius: 50%;
            font-size: 2rem;
            font-weight: 800;
        }

        .logout-card h1 {
            margin-bottom: 0.75rem;
            font-size: 2rem;
            font-weight: 800;
        }

        .logout-card h1 span {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .username {
            display: inline-block;
            margin-bottom: 1.5rem;
            color: #6366f1;
            font-size: 1.2rem;
            font-weight: 800;
        }

        .question {
            margin-bottom: 2rem;
            color: var(--text-muted);
            font-size: 1.05rem;
        }

        .logout-actions {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .logout-button,
        .cancel-button {
            min-width: 150px;
            padding: 0.85rem 1.4rem;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 800;
            text-decoration: none;
            cursor: pointer;
            transition: 0.25s ease;
        }

        .logout-button {
            color: white;
            background: #f87171;
            border: 2px solid #f87171;
        }

        .logout-button:hover {
            color: white;
            background: var(--danger-dark);
            border-color: var(--danger-dark);
            transform: scale(1.08);
            box-shadow: 0 8px 22px rgba(220, 38, 38, 0.4);
        }

        .cancel-button {
            color: var(--text-dark);
            background: #f1f5f9;
            border: 2px solid #e2e8f0;
        }

        .cancel-button:hover {
            color: #6366f1;
            background: #e0e7ff;
            border-color: #c7d2fe;
            transform: translateY(-2px);
        }

        @media (max-width: 700px) {
            .navbar {
                align-items: flex-start;
                gap: 1rem;
                flex-direction: column;
            }

            .nav-links {
                flex-wrap: wrap;
                gap: 0.75rem;
            }

            .logout-card {
                padding: 2rem 1.25rem;
            }

            .logout-actions {
                flex-direction: column-reverse;
            }

            .logout-button,
            .cancel-button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<header class="navbar">
    <a href="${pageContext.request.contextPath}/" class="logo">Library</a>

    <ul class="nav-links">
        <li>
            <a href="${pageContext.request.contextPath}/book_list">My Books</a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/add_book" class="btn-gradient">+ Add Book</a>
        </li>

        <% if (request.getSession().getAttribute("user") != null) { %>
        <li class="dropdown">
            <button class="btn dropdown-toggle" type="button"
                    data-bs-toggle="dropdown" aria-expanded="false">
                ${user.username}
            </button>

            <ul class="dropdown-menu">
                <li>
                    <a class="dropdown-item"
                       href="${pageContext.request.contextPath}/profile">
                        Edit profile
                    </a>
                </li>
                <li>
                    <a class="dropdown-item"
                       href="${pageContext.request.contextPath}/logout">
                        Logout
                    </a>
                </li>
            </ul>
        </li>
        <% } else { %>
        <li>
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/register" class="btn-nav-signup">Sign Up</a>
        </li>
        <% } %>
    </ul>
</header>

<main>
    <section class="logout-card">
        <div class="logout-icon">↪</div>

        <h1>Log out, <span>${user.username}</span>?</h1>

        <p class="username">${user.username}</p>

        <p class="question">
            Are you sure you want to log out of your Library account?
        </p>

        <div class="logout-actions">
            <a href="${pageContext.request.contextPath}/book_list" class="cancel-button">
                Cancel
            </a>

            <form action="${pageContext.request.contextPath}/logout" method="post">
                <button type="submit" class="logout-button">
                    Yes, Log Out
                </button>
            </form>
        </div>
    </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


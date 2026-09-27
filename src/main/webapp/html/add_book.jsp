<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book - Library</title>
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
            text-align: center;
        }
        .btn-gradient:hover { transform: translateY(-2px); }

        /* Form Card */
        main { display: flex; justify-content: center; align-items: center; padding: 4rem 1rem; }
        .form-card {
            background: var(--card-bg);
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(226, 232, 240, 0.8);
            width: 100%;
            max-width: 550px;
        }

        .form-header { text-align: center; margin-bottom: 2rem; }
        .form-header h2 { font-weight: 800; font-size: 2rem; margin-bottom: 0.5rem; }
        .form-header p { color: var(--text-muted); font-size: 0.95rem; }

        .form-group { margin-bottom: 1.5rem; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 0.5rem; font-size: 0.9rem; color: var(--text-dark); }
        .form-group input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1.5px solid #e2e8f0;
            border-radius: 10px;
            outline: none;
            transition: var(--transition);
        }
        .form-group input:focus { border-color: #6366f1; box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1); }

        .btn-gradient-submit {
            width: 100%;
            background: var(--primary-gradient);
            color: white;
            padding: 0.8rem;
            border-radius: 50px;
            border: none;
            font-weight: 700;
            font-size: 1rem;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
            transition: transform 0.2s ease;
        }
        .btn-gradient-submit:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4); }

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
    <div class="form-card">
        <div class="form-header">
            <h2>Add New Book</h2>
            <p>Fill in the details below to add a book to your collection.</p>
        </div>

        <form action="/add_book" method="POST">
            <div class="form-group">
                <label for="title">Book Title</label>
                <input type="text" id="title" name="title" placeholder="e.g. Effective Java" required>
            </div>

            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" id="author" name="author" placeholder="e.g. Joshua Bloch" required>
            </div>

            <div class="form-group">
                <label for="pages">Total Pages</label>
                <input type="number" id="pages" name="pages" placeholder="412" min="1">
            </div>

            <button type="submit" class="btn-gradient-submit">Save Book</button>
        </form>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

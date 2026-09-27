<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Books - Library</title>
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

        /* Main Content */
        .container { max-width: 1000px; margin-top: 3rem; }
        .header-section { margin-bottom: 2rem; }
        .header-section h2 { font-weight: 800; font-size: 2rem; color: var(--text-dark); }

        /* Filters */
        .filters { display: flex; gap: 1rem; margin-bottom: 2rem; overflow-x: auto; padding-bottom: 0.5rem; }
        .filter-btn {
            padding: 0.6rem 1.2rem;
            border-radius: 50px;
            border: 1px solid #e2e8f0;
            background: white;
            color: var(--text-muted);
            font-weight: 600;
            transition: var(--transition);
            white-space: nowrap;
        }
        .filter-btn.active, .filter-btn:hover {
            background: var(--primary-gradient);
            color: white;
            border-color: transparent;
        }

        /* Table Card */
        .table-card {
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(226, 232, 240, 0.8);
            overflow: hidden;
            margin-bottom: 3rem;
        }

        table { width: 100%; border-collapse: collapse; }
        th {
            background: #f8fafc;
            padding: 1.25rem 1.5rem;
            text-align: left;
            font-weight: 700;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.05em;
            border-bottom: 1px solid #e2e8f0;
        }
        td { padding: 1.25rem 1.5rem; border-bottom: 1px solid #f1f5f9; vertical-align: middle; }
        tr:last-child td { border-bottom: none; }

        .book-title { font-weight: 700; color: var(--text-dark); font-size: 1rem; }

        /* Action Links */
        .action-links { list-style: none; display: flex; gap: 0.75rem; margin: 0; padding: 0; }
        .action-links a {
            text-decoration: none;
            font-size: 0.8rem;
            font-weight: 800;
            padding: 0.4rem 0.8rem;
            border-radius: 6px;
            transition: var(--transition);
        }
        .editBook { color: #6366f1; background: #eef2ff; }
        .editBook:hover { background: #6366f1; color: white; }
        .removeBook { color: #ef4444; background: #fef2f2; }
        .removeBook:hover { background: #ef4444; color: white; }

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

<main class="container">
    <div class="header-section">
        <h2>My Collection</h2>
    </div>

    <div class="filters">
        <button class="filter-btn active">All Books</button>
        <button class="filter-btn">Reading</button>
        <button class="filter-btn">Completed</button>
        <button class="filter-btn">Want to Read</button>
    </div>

    <div class="table-card">
        <table>
            <thead>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Pages</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td><span class="book-title">${book.title}</span></td>
                    <td>${book.author}</td>
                    <td>${book.pages}</td>
                    <td>
                        <ul class="action-links">
                            <li><a href="/edit_book/${book.id}" class="editBook">EDIT</a></li>
                            <li><a href="/remove_book/${book.id}" class="removeBook">REMOVE</a></li>
                        </ul>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

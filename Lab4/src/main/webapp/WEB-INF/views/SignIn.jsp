<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log in</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="flex justify-center items-center h-screen">
    <div class="w-full max-w-lg p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-4 text-black text-center">Log in</h2>
        <form id="loginForm" action="" method="post" class="mt-4">
            <div class="mb-4">
                <label for="username" class="block font-bold">Username: </label>
                <input type="text" id="username" name="username" required placeholder="username: admin" value="<%= request.getAttribute("username") %>"
                    class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:border-green-500">
            </div>
            <div class="mb-4">
                <label for="password" class="block font-bold">Password: </label>
                <input type="password" id="password" name="password" required placeholder="password: admin"
                    value="<%= request.getAttribute("password") %>"
                    class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:border-green-500">
            </div>
            <div>
                <input type="checkbox" id="remember" name="remember" class="mr-2">
                <label for="remember" class="text-sm">Remember me</label>
            </div>
            <div class="w-full flex justify-center">
                <button type="submit"
                    class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors duration-300">
                    Log in
                </button>
            </div>
        </form>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Registration Result</title>
    </head>

    <body class="flex justify-center items-center h-screen">
        <div class="w-full max-w-md p-6 bg-white rounded-lg shadow-md">
            <h2 class="text-2xl font-bold mb-4 text-center">Registration Result</h2>
            <table>
                <tr>
                    <td><strong>Name:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("name") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>ID:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("id") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>Email:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("email") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>Major:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("major") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>Courses:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("courses") %>
                    </td>
                </tr>
            </table>
            <div class="w-full flex justify-center">
                <a href="${pageContext.request.contextPath}/registerform" class="block mt-4">
                    <button class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Re-register
                    </button>
                </a>
            </div>
        </div>
    </body>

    </html>
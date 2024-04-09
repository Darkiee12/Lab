<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Set Three Parameters</title>
    </head>

    <body class="flex justify-center items-center h-screen">
        <div class="w-full max-w-md p-6 bg-white rounded-lg shadow-md">
            <h2 class="text-2xl font-bold mb-4 text-center">Result Page</h2>
            <table>
                <tr>
                    <td><strong>First Parameter:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("param1") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>Second Parameter:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("param2") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>Third Parameter:</strong></td>
                    <td class="pl-2">
                        <%= request.getAttribute("param3") %>
                    </td>
                </tr>
            </table>
            <div class="w-full flex justify-center">
                <a href="${pageContext.request.contextPath}" class="block mt-4">
                    <button class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Try new input!
                    </button>
                </a>
            </div>

        </div>
    </body>

    </html>
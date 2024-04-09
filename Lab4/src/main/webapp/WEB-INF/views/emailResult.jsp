<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">

        <title>Result email</title>
    </head>

    <body style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div
            style="width: 100%; max-width: 28rem; padding: 1.5rem; background-color: #ffffff; border-radius: 0.5rem; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);">
            <h2 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 1rem; color: rgb(5, 150, 105);">Thanks for
                joining our email list</h2>
            <p>Here is the information you provided:</p>
            <table>
                <tr>
                    <td><strong>Email:</strong></td>
                    <td style="padding-left: 0.5rem;">
                        <%= request.getAttribute("email") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>First Name:</strong></td>
                    <td style="padding-left: 0.5rem;">
                        <%= request.getAttribute("firstname") %>
                    </td>
                </tr>
                <tr>
                    <td><strong>Last Name:</strong></td>
                    <td style="padding-left: 0.5rem;">
                        <%= request.getAttribute("lastname") %>
                    </td>
                </tr>
            </table>
            <div style="width: 100%; display: flex; justify-content: center;">
                <a href="${pageContext.request.contextPath}/" style="display: block; margin-top: 1rem;">
                    <button
                        style="width: 100%; background-color: #3b82f6; color: #ffffff; font-weight: bold; padding: 0.5rem 1rem; border-radius: 0.375rem; cursor: pointer; transition: background-color 0.3s;"
                        onmouseover="this.style.backgroundColor='#2563eb'"
                        onmouseout="this.style.backgroundColor='#3b82f6'">
                        Reset
                    </button>
                </a>
            </div>

        </div>
    </body>

    </html>
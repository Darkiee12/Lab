<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Enter email</title>
    </head>

    <body style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div
            style="width: 100%; max-width: 28rem; padding: 1.5rem; background-color: #ffffff; border-radius: 0.5rem; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);">
            <h2 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 1rem; color: rgb(5, 150, 105);">Join our
                email list!</h2>
            <p>To join our email list, enter your name and email address below.</p>
            <form action="/results" method="post">
                <div style="margin-bottom: 1rem;">
                    <label for="email" class="block font-bold">Email: </label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email address"
                        style="width: 100%; border: 1px solid #d1d5db; border-radius: 0.375rem; padding-left: 0.5rem;">
                </div>
                <div style="margin-bottom: 1rem;">
                    <label for="firstname" class="block font-bold">First Name:</label>
                    <input type="text" id="firstname" name="firstname" required placeholder="Enter your first name"
                        style="width: 100%; border: 1px solid #d1d5db; border-radius: 0.375rem; padding-left: 0.5rem;"">
                </div>
                <div style=" margin-bottom: 1rem;">
                    <label for="lastname" class="block font-bold">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" required placeholder="Enter your last names"
                        style="width: 100%; border: 1px solid #d1d5db; border-radius: 0.375rem; padding-left: 0.5rem;">
                </div>
                <div style="width: 100%; display: flex; justify-content: center;">
                    <button type="submit" value="Submit"
                        style="width: 100%; background-color: #3b82f6; color: #ffffff; font-weight: bold; padding: 0.5rem 1rem; border-radius: 0.375rem; cursor: pointer; transition: background-color 0.3s;"
                        onmouseover="this.style.backgroundColor='#2563eb'"
                        onmouseout="this.style.backgroundColor='#3b82f6'">
                        Submit
                    </button>
            </form>
        </div>
    </body>

    </html>
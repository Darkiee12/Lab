<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>🍪 Cookies for Lab 4</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>

  <body class="flex justify-center items-center h-screen">
    <div class="w-full max-w-lg p-6 bg-white rounded-lg shadow-md">
      <h2 class="text-2xl font-bold mb-4 text-[#F3AD61]">🍪 Print out the cookies! 🍪</h2>
      <form action="/cookies" method="post" class="mt-4">
        <div class="mb-4">
          <label for="name" class="block font-bold">Cookie name: </label>
          <input type="text" id="name" name="name" required placeholder="Input the cookie name here"
            class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:border-green-500">
        </div>
        <div class="mb-4">
          <label for="value" class="block font-bold">Cookie value:</label>
          <input type="text" id="value" name="value" required placeholder="Input the cookie value here"
            class="w-full border border-gray-300 rounded-md py-2 px-3 focus:outline-none focus:border-green-500">
        </div>
        <div class="w-full flex justify-center">
          <button type="submit"
            class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors duration-300">
            Submit
          </button>
        </div>

      </form>
    </div>
  </body>

  </html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reading Personal Information</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex justify-center items-center h-screen">
  <div class="w-full max-w-md p-6 bg-white rounded-lg shadow-md">
      <h2 class="text-2xl font-bold mb-4 text-center">Reading Personal Information</h2>
      <table>
          <tr>
              <td><strong>ID:</strong></td>
              <td class="pl-2"><%= request.getAttribute("id")%></td>
          </tr>
          <tr>
              <td><strong>Name:</strong></td>
              <td class="pl-2"><%= request.getAttribute("name")%></td>
          </tr>
          <tr>
              <td><strong>Email:</strong></td>
              <td class="pl-2"><%= request.getAttribute("email")%></td>
          </tr>
          <tr>
              <td><strong>Gender:</strong></td>
              <td class="pl-2"><%= (Boolean)request.getAttribute("gender")?"Female":"Male"%></td>
          </tr>
          <tr>
              <td><strong>Major:</strong></td>
              <td class="pl-2"><%= request.getAttribute("major")%></td>
          </tr>
          <tr>
            <td><strong>Interesting:</strong></td>
            <td class="pl-2 break-words"><%= request.getAttribute("interesting")%></td>
          </tr>
      </table>
      <div class="w-full flex justify-center">
        <a href="${pageContext.request.contextPath}/personalinfo" class="block mt-4">
            <button class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Back
            </button>d:\Lecture\Web Application Development\Lab\Lab2\form\index.html d:\Lecture\Web Application Development\Lab\Lab2\form\detail.json
        </a>
    </div>
  </div>
</body>
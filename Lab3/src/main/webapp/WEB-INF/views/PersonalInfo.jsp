<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Get Information</title>
    <link href="https://cdn.tailwindcss.com" rel="stylesheet">
</head>
<body class="flex justify-center items-center h-screen">
  <main class="">
    <div class="flex justify-center items-center font-bold text-3xl">
      Personal Information
    </div>
    <form class="w-full" action="/getinfo" method="post">
      <table>
        <tr class="">
          <td class="w-full">
            <label for="id">ID:</label>
          </td>
          <td class="w-full">
            <input type="text" id="id" name="id" required class="pl-2 border-2 border-gray-500 rounded-lg w-full">
          </td>
        </tr>
        <tr>
          <td class="w-full">
            <label for="name">Name:</label>
          </td>
          <td class="w-full">
            <input type="text" id="name" name="name" required class="pl-2 border-2 border-gray-500 rounded-lg w-full">
          </td>
        </tr>
        <tr>
          <td class="w-full">
            <label for="email">Email:</label>
          </td>
          <td class="w-full">
            <input type="email" id="email" name="email" required class="pl-2 border-2 border-gray-500 rounded-lg w-full">
          </td>
        </tr>
        <tr>
          <td class="w-full">
            <label for="gender">Gender:</label>
          </td>
          <td class="w-full flex justify-center">
            <div class="w-full flex justify-around">
              <div>
                <input type="radio" id="male" name="gender" value="false" required>
                <label for="male">Male</label>
              </div>
              <div>
                <input type="radio" id="female" name="gender" value="true" required>
                <label for="female">Female</label>
              </div>
            </div>
        </td>
        </tr>
        <tr>
          <td class="w-full">
            <label for="major">Major</label>
          </td>
          <td class="w-full">
            <select name="major" id="major" class="border-2 border-gray-500 rounded-lg w-full" required>
              <option disabled value="" selected>Select a major</option>
              <% 
                  String[] majors = {"Computer Science", "Electrical Engineering", "Mechanical Engineering", "Civil Engineering", "Chemical Engineering", "Aerospace Engineering", "Psychology (Cognitive Psychology)", "Psychology (Clinical Psychology)", "Economics", "International Economics", "Development Economics", "Mathematics", "Business Administration", "Marketing", "Finance", "Human Resources"};
                  for (String major : majors) {
              %>
                  <option value="<%= major %>"><%= major %></option>
              <% } %>
            </select>
          </td>
        </tr>
        <br/>
        <tr>
          <td>
            <label for="big-text">Interesting:</label>
          </td>
          <td>
            <textarea id="interesting" name="interesting" rows="10" cols="50" class="px-2"></textarea><br>
          </td>
        </tr>
      </table>
      <br/>
      <div class="w-full flex justify-center">
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          Submit
        </button>
      </div>
    </form>
  </main>
  <script src="https://cdn.tailwindcss.com"></script>
</body>
</html>

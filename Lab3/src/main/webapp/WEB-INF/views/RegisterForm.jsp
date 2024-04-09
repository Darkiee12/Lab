<%@ page import="java.util.Map" %> <%@ page import="java.util.List" %> <%@ page
import="lab3.models.Programme"%> <%@ page import="lab3.models.Major"%> <%@ page
import="lab3.models.Course"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Simple HTML</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
  </head>

  <body class="w-full h-screen">
    <div
      class="h-20 w-full bg-[#2F398E] flex items-center border-b-solid border-b-2 border-[#909090] justify-between px-5 pb-1"
    >
      <img src="../assets/logoweb-02.png" class="h-full" />
      <p class="text-2xl text-white font-bold">Registration</p>
    </div>
    <div class="flex items-center justify-center min-h-screen w-full">
      <div class="w-full">
        <form action="/registerresult" method="post">
          <p class="text-4xl font-bold text-center mb-4">Course Registration</p>
          <div class="flex flex-col w-full p-[10px] rounded-[5px]">
            <label for="name" class="mb-2">Full Name:</label>
            <input
              type="text"
              id="name"
              name="name"
              required
              class="border border-gray-400 p-2 mb-4"
            />
          </div>
          <div class="flex flex-col w-full p-[10px] rounded-[5px]">
            <label for="id" class="mb-2">ID:</label>
            <input
              type="text"
              id="id"
              name="id"
              required
              class="border border-gray-400 p-2 mb-4"
            />
          </div>
          <div class="flex flex-col w-full p-[10px] rounded-[5px]">
            <label for="email" class="mb-2">Email:</label>
            <input
              type="email"
              id="email"
              name="email"
              required
              class="border border-gray-400 p-2 mb-4"
            />
          </div>
          <div class="flex items-center w-full p-[10px] rounded-[5px]">
            <label for="gender" class="mb-2 mr-4">Gender:</label>
            <div class="flex items-center justify-between w-full">
              <input
                type="radio"
                id="male"
                name="gender"
                class="mr-1"
                required
              />
              <span class="font-[18px]">Male</span>
              <input
                type="radio"
                id="female"
                name="gender"
                class="mr-1"
                required
              />
              <span class="font-[18px]">Female</span>
            </div>
          </div>
          <div class="flex flex-col w-full p-[10px] rounded-[5px]">
            <label for="major" class="mb-2">Field of study:</label>
            <select
              class="w-full p-[10px] rounded-[5px]"
              required
              name="major"
              id="major"
            >
              <option disabled selected>Select Major</option>
              <% Programme programme =
              (Programme)request.getAttribute("programme"); for (String
              majorName : programme.getMajors()) { %>
              <option value="<%= majorName %>"><%= majorName %></option>
              <% } %>
            </select>
          </div>
          <div class="overflow-y-auto" id="courses"></div>
          <div class="w-full flex items-center justify-center">
            <button
              type="submit"
              class="bg-blue-500 hover:bg-blue-700 w-[70%] font-bold py-2 px-4 rounded mt-4 mb-4 text-white"
            >
              Submit
            </button>
          </div>
        </form>
      </div>
      <div class="w-full ">
        <div id="detail" >
          <p class="text-center"> Choose a subject to preview here!</p>
        </div>
      </div>
    </div>
    <script>
      document.querySelector("#major").addEventListener("change", async (e) => {
        const selectedMajor = e.target.value;
        await fetch("/majors="+selectedMajor)
          .then((res) => res.text())
          .then((data) => {
            document.querySelector("#courses").innerHTML = data;
          })
          .catch((err) => console.log(err));
      });

      async function showDetail(major, course){
        await fetch("/majors="+major+"/courses="+course)
          .then((res) => res.text())
          .then((data) => {
            document.querySelector("#detail").innerHTML = data;
          })
          .catch((err) => console.log(err));
      }
    </script>
  </body>
</html>

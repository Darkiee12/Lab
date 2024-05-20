<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.Instant, java.time.LocalDateTime, java.time.ZoneId, java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Session Test!</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen w-full p-0 m-0">
    <h1 class="w-full text-center font-bold text-2xl">Test session</h1>
    <div class="w-full flex justify-center">
        <button
            class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors duration-300"
            onclick='document.getElementById("sessionInfo").classList.remove("hidden");'>Show Session
            Info
        </button>
    </div>
    <div class="w-full h-full flex items-center justify-center">
        <div id="sessionInfo" class="hidden transition-color duration-300 ease-in-out">
            <h2 class="w-full text-center font-bold text-2xl pb-2">Information on your Session</h2>
            <table class="w-full sm:w-auto border border-collapse">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-4 py-2">Info type</th>
                        <th class="px-4 py-2">Value</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="px-4 py-2">Creation time</td>
                        <td class="px-4 py-2">
                            <%= convert(session.getCreationTime()) %>
                        </td>
                    </tr>
                    <tr>
                        <td class="px-4 py-2">Time of Last Access</td>
                        <td class="px-4 py-2">
                            <%= convert(session.getLastAccessedTime()) %>
                        </td>
                    </tr>
                    <tr>
                        <td class="px-4 py-2">Number of Previous Accesses</td>
                        <td class="px-4 py-2">
                            <%= session.getAttribute("accessCount")==null ? 0 : session.getAttribute("accessCount") %>
                        </td>
                    </tr>
                </tbody>
            </table>
            <% Integer accessCount=(Integer) session.getAttribute("accessCount"); 
            if (accessCount==null) {
                accessCount=0; 
            } 
            accessCount++;
            session.setAttribute("accessCount", accessCount);
            %>
        </div>
    </div>

    <%! public String convert(long unixTimestamp) { 
            Instant instant=Instant.ofEpochMilli(unixTimestamp);
            LocalDateTime dateTime=LocalDateTime.ofInstant(instant, ZoneId.of("UTC")); 
            return dateTime.format(DateTimeFormatter.ISO_DATE_TIME); 
        } 
    %>
</body>
</html>
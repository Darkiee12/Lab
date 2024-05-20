<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Welcome aboard!</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="flex flex-col justify-center items-center h-screen">
    <% 
    int counter=0; 
    
    Cookie[] cookies=request.getCookies(); 
    if (cookies !=null) { 
        for (Cookie cookie : cookies) { 
            if (cookie.getName().equals("visitCount")) { 
                counter=Integer.parseInt(cookie.getValue()); 
                break; 
            } 
        } 
    } 
    counter++; 
    Cookie cookie=new Cookie("visitCount", String.valueOf(counter)); 
    response.addCookie(cookie);
    %>
    <h1 class="text-center font-bold text-5xl pt-5">
        <%=counter==1?"⚓ Welcome aboard!":"⚓ Welcome back!" %>
    </h1>
    <div class="flex-grow flex justify-center items-center">
        <div class="text-center">
            <div class="text-[20rem]">⛵</div>
            <p class="text-lg pt-5">
                You have visited this website <%= counter+(counter==1?" time":" times")+"."%>
            </p>
        </div>
    </div>
</body>

</html>

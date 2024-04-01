<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Get Three Parameters</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex justify-center items-center h-screen">
    <div class="w-full max-w-md p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-4 text-center">Collect three parameters</h2>
        <form action="/results" method="post">
            <div class="mb-4">
                <label for="param1" class="block font-bold">First Parameter:</label>
                <input type="text" id="param1" name="param1" required placeholder="First parameter here..." class="w-full border-gray-300 rounded-md pl-2">
            </div>
            <div class="mb-4">
                <label for="param2" class="block font-bold">Second Parameter:</label>
                <input type="text" id="param2" name="param2" required placeholder="Second parameter here..." class="w-full border-solid border-black rounded-md pl-2">
            </div>
            <div class="mb-4">
                <label for="param3" class="block font-bold">Third Parameter:</label>
                <input type="text" id="param3" name="param3" required placeholder="Third parameter here..." class="w-full border-gray-300 rounded-md pl-2">
            </div>
            <div class="w-full flex justify-center">
                <input type="submit" value="Submit" class="px-4 py-2 bg-blue-500 text-white rounded-md cursor-pointer">
            </div>
        </form>
    </div>
</body>
</html>

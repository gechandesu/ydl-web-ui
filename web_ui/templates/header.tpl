<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="static/style.css" rel="stylesheet">
  <link rel="icon" type="image/x-icon" href="static/favicon.png">
  <title>{{ title }} - ydl_api_ng web UI</title>
</head>
<body>
<div class="container mx-auto p-4 m-4 mb-0">
  <form action="/" method="POST" class="w-full max-w-sm">
    <div class="flex py-2">
      <input
        type="text"
        id="url"
        name="url"
        placeholder="https://youtu.be/dQw4w9WgXcQ"
        class="w-full rounded-md border-gray-300 sm:text-sm"
        required>
      <button
        type="submit"
        class="flex-shrink-0 bg-red-600 hover:bg-red-500 p-2 mx-2 text-white font-bold rounded-md">
          Get!
      </button>
    </div>
  </form>
</div>

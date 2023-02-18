% include('templates/header.tpl', title='Download video from YouTube and more')
% if video:
<div class="container mx-auto p-4 pt-0 m-4 mt-0">
  <h1 class="text-3xl font-bold mb-4">{{ video['title'] }}</h1>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
    <div>
      <img class="w-full aspect-video" src="{{ video['thumbnail'] }}" alt="Thumbnail">
    </div>
    <div class="col-span-2">
      <p>Video by
        <a href="{{ video['channel_url'] }}"
          class="text-red-600 hover:text-red-500"
          target="_blank">
          {{ video['channel'] }}
        </a>
      <p><span class="font-bold">Duration:</span> {{ video['duration_in_hms'] }}</p>
      <p><span class="font-bold">Link:</span>
        <a href="{{ video['original_url'] }}"
        class="text-red-600 hover:text-red-500"
        target="_blank">
        {{ video['original_url'] }}
        </a></p>
      <div>
        <form action="/downloads" method="POST">
          <input
            type="text"
            id="video"
            name="video",
            value="{{ video['original_url'] }}"
            style="display: none">
          <button
            type="submit"
            class="bg-red-600 hover:bg-red-500 p-2 my-4 text-white font-bold rounded-md">
            Download
          </button>
        </form>
      </div>
    </div>
  </div>
</div>
% end
</body>
</html>

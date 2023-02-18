% include('templates/header.tpl', title='Running downloads')
% if job:
<div class="container mx-auto p-4 pt-0 mt-0">
  <div class="w-fit bg-green-100 rounded-md px-8 py-4">
    Download started.
  </div>
</div>
% end
% if downloads:
<div class="container mx-auto p-4 pt-0 m-4 mt-0">
  <h1 class="text-3xl font-bold mb-4">Running tasks</h1>
  <div class="w-fit bg-red-100 rounded-md px-8 py-4 mb-8">
    Refresh this page to view actual data.
    <a href="/downloads">
      <button class="bg-red-600 hover:bg-red-500 p-2 mx-2 text-white font-bold rounded-md">
        Refresh
      </button>
    </a>
  </div>
  <table class="shadow-lg bg-white table-auto">
    <thead>
      <tr>
        <th class="border text-left px-8 py-4">ID</th>
        <th class="border text-left px-8 py-4">URL</th>
        <th class="border text-left px-8 py-4">Format</th>
      </tr>
    </thead>
    <tbody>
    % for job in downloads['started_job']:
      <tr>
        <td class="border px-8 py-4">{{ job['id'] }}</td>
        <td class="border px-8 py-4">{{ job['download_manager']['url'] }}</td>
        <td class="border px-8 py-4">{{ job['preset']['format'] }}</td>
      </tr>
    % end
    </tbody>
  </table>
</div>
% end
</body>
</html>

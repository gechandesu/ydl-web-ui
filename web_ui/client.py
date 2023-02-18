"""ydl_api_ng client."""

import json

import requests


class Client:
    """ydl_api_ng client class."""

    def __init__(self, token: str = None, host: str = None):
        self.token = token
        self.host = host
        self.timeout = 100
        self.headers = requests.utils.default_headers()

    def extract_info(self, video_url: str = None):
        """Get video info."""
        url = f"{self.host}/extract_info?url={video_url}"
        return requests.get(url, headers=self.headers, timeout=self.timeout)

    def list_active_downloads(self):
        """Get active jobs."""
        url = f"{self.host}/active_downloads"
        return requests.get(url, headers=self.headers, timeout=self.timeout)

    def download_video(
        self, video_url: str = None, payload: dict = None, simple: bool = False
    ):
        """Download video by URL."""
        if simple:
            url = f"{self.host}/download?url={video_url}"
            return requests.get(
                url,
                headers=self.headers,
                timeout=self.timeout,
            )
        self.headers.update({"Content-Type": "application/json"})
        return requests.post(
            url, headers=self.headers, timeout=self.timeout, data=json.dumps(payload)
        )

"""ydl_api_ng Web UI."""

import os
import datetime

from bottle import default_app, run, get, post, request, template, static_file

from client import Client


api_host = os.getenv("YDL_API_HOST")
debug = os.getenv("DEBUG")

client = Client(host=api_host)


@get("/")
def index():
    """Return homepage."""
    return template("templates/video.tpl", video=None)


@post("/")
def info():
    """Return video information."""
    # pylint: disable=no-member
    video_url = request.forms.get("url")
    video_info = client.extract_info(video_url).json()
    video_info["duration_in_hms"] = str(
        datetime.timedelta(seconds=int(video_info["duration"]))
    )
    return template("templates/video.tpl", video=video_info)


@post("/downloads")
def download():
    """Start download job and return jobs list."""
    # pylint: disable=no-member
    download_url = request.forms.get("video")
    job = client.download_video(download_url, simple=True)
    return template(
        "templates/downloads.tpl",
        job=job,
        downloads=client.list_active_downloads().json(),
    )


@get("/downloads")
def list_active_download():
    """Return jobs list."""
    return template(
        "templates/downloads.tpl",
        job=None,
        downloads=client.list_active_downloads().json(),
    )


@get("/static/style.css")
def send_style():
    """Return style.css"""
    return static_file("style.css", root="static")


@get("/static/favicon.png")
def send_favicon():
    """Return favicon."""
    return static_file("favicon.png", root="static")


app = default_app()


if __name__ == "__main__":
    if debug:
        run(host="0.0.0.0", debug=True, reloader=True)
    else:
        run()

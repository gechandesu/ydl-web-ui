![](images/icon.png)

# ydl_api_ng Web UI

This is a shitty Web UI for [ydl_api_ng](https://github.com/Totonyus/ydl_api_ng) — API around [yt-dlp](https://github.com/yt-dlp/yt-dlp).

This UI is written for my personal use and may not have the features you would like to see. I want to gradually expand its capabilities, if there is time for this.

![](images/1.png)
![](images/2.png)

# Roadmap

- [x] Add Dockerfile and docker-compose.yml
- [ ] Handle non-youtube links
    - [ ] Twitter
    - [ ] Nicovideo
    - [ ] vk.com
- [ ] Handle unsupported URLs
- [ ] YouTube playlists download
- [ ] Advanced settings
- [ ] Direct link to downloaded video

# Installation

## Docker Compose (easiest)

Copy [docker-compose.yml](docker-compose.yml) and edit if you want.

Then up containers:

```
docker compose up -d
```

ydl-web-ui will listen port 4011/tcp.

## Docker

1. [Setup ydl_api_ng](https://github.com/Totonyus/ydl_api_ng#installation).

2. Install Web UI.

You must specify your ydl_api_ng instance host as `YDL_API_HOST` environment variable.

```
docker run -d \
    --name ydl_web_ui \
    -p 4011:3000 \
    -e YDL_API_HOST=http://1.2.3.4:5011 \
    nxhs/ydl-web-ui:latest
```

## Without Docker

Use python 3.6 or newer.

Replace `YDL_API_HOST` value to your actual ydl_api_ng instance URL.

```
python3 -m venv env
. env/bin/activate
pip install -r requirements.txt
pip install gunicorn
export YDL_API_HOST=http://1.2.3.4:5011
gunicorn --chdir=./web_ui router:app -b :3000
```

See also gunicorn deployment options: https://docs.gunicorn.org/en/latest/deploy.html

# Development

Web UI is written on Python in backend and Tailwind CSS for UI.

## Frontend

[Install Node.js](https://github.com/nvm-sh/nvm) and run in project dir:

```
npm install --dev
```

Run Tailwind CSS CLI for autorebuilding style.css:

```
make css
```

## Backend

Prepare Python virtual environment. Using pipenv:

```
pipenv install --dev
```

or:

```
python3 -m venv env
. env/bin/activate
pip install -r requirements.txt
pip install black pylint
```

Set `YDL_API_HOST` environment variable. Put your ydl_api_ng instance URL:

```
export YDL_API_HOST=http://127.0.0.1:5011
```

Run Bottle development server (starts `router.py` with DEBUG):

```
make run
```

Format and lint:

```
make lint
```

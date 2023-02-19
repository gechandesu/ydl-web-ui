FROM alpine:latest
RUN apk update && apk add --no-cache python3 py3-pip
RUN mkdir -p /opt/ydl_web_ui
ADD requirements.txt web_ui/ /opt/ydl_web_ui
WORKDIR /opt/ydl_web_ui
RUN pip install --disable-pip-version-check --requirement requirements.txt
RUN pip install --disable-pip-version-check gunicorn
EXPOSE 3000
USER nobody
ENV YDL_API_HOST=
CMD gunicorn router:app --bind :3000

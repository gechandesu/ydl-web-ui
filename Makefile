SRCDIR = web_ui
YDL_API_HOST ?=

css:
	npx tailwindcss -i input.css -o $(SRCDIR)/static/style.css --watch

run:
	cd $(SRCDIR) && DEBUG=1 YDL_API_HOST=$(YDL_API_HOST) pipenv run python router.py

lint:
	pipenv run black $(SRCDIR)
	pipenv run pylint $(SRCDIR)

image:
	ver=$$(awk -F'= ' '/__version__/{gsub("\"", ""); print $$2}' web_ui/router.py) && \
	sudo docker build . -t ydl-web-ui:$$ver -t ydl-web-ui:latest

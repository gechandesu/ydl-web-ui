SRCDIR = web_ui
YDL_API_HOST ?=

css:
	npx tailwindcss -i input.css -o $(SRCDIR)/static/style.css --watch

run:
	DEBUG=1 YDL_API_HOST=$(YDL_API_HOST) pipenv run python $(SRCDIR)/router.py

lint:
	pipenv run black $(SRCDIR)
	pipenv run pylint $(SRCDIR)

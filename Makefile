install:
	pip install --upgrade pip && pip install -r requirements.txt

format:
	black *.py

lint:
	ruff check *.py

test:
	python -m pytest --cov=script --cov=lib
	pytest --nbval

all: install format lint test

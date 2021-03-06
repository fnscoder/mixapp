help:
	@echo "    setup"
	@echo "        Setup project (install dependencies)"
	@echo "    tests"
	@echo "        Execute Application tests "
	@echo "    clean"
	@echo "        Clear cache files."
	@echo "    migrate"
	@echo "        Create database schema"
	@echo "    run"
	@echo "        run application in port 8000"
	@echo "    help"
	@echo "        Show all commands."

setup: clean

	pip install -r requirements.txt;\


clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

	rm -rf builds/

.PHONY: clean

tests: clean
	coverage run --include=users/*,app/*,pages/*  manage.py test --settings=app.config.test_settings
	coverage report -m

run:
	python manage.py runserver

migrate:
	python manage.py makemigrations
	python manage.py migrate

collectstatic:
	echo yes | python manage.py collectstatic

default: setup

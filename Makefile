.PHONY: install
install:
	poetry install
	echo "\r\nUSE THIS FOR IDE COMPLETION:\r\n\r\n$$(poetry env info -p)"

.PHONY: lint
lint:
	poetry run flake8 src/ tests/
	poetry run isort --check-only --profile black src/ tests/
	poetry run black --check --diff src/ tests/

.PHONY: format
format:
	poetry run isort --profile black src/ tests/
	poetry run black src/ tests/

.PHONY: unit-tests
unit-tests:
	poetry run pytest -s tests/

.DEFAULT_GOAL := run

run:
	@echo "Running..."
	docker build -t dotfiles:latest .
	docker run dotfiles:latest

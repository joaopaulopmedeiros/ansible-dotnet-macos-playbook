.DEFAULT_GOAL := help

.PHONY: help brew ansible setup uninstall verify

help: ## Show this help message
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

brew: ## Install Homebrew if it isn't already installed
	@if ! command -v brew >/dev/null 2>&1; then \
		echo "Homebrew not found, installing..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed."; \
	fi

ansible: brew ## Install Ansible and required collections
	@if ! command -v ansible-playbook >/dev/null 2>&1; then \
		echo "Installing Ansible..."; \
		brew install ansible; \
	else \
		echo "Ansible already installed."; \
	fi

setup: ansible ## Run the playbook to provision the .NET dev environment
	ansible-playbook -i inventory.ini playbook.yml

verify: ## Check that the key tools are on PATH
	@echo "dotnet:          $$(command -v dotnet || echo 'NOT FOUND')"
	@echo "dotnet-counters: $$(command -v dotnet-counters || echo 'NOT FOUND')"
	@echo "dotnet-dump:     $$(command -v dotnet-dump || echo 'NOT FOUND')"
	@echo "dotnet-trace:    $$(command -v dotnet-trace || echo 'NOT FOUND')"
	@echo "code:            $$(command -v code || echo 'NOT FOUND')"
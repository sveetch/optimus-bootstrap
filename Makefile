PYTHON_INTERPRETER=python3
VENV_PATH=.venv
PIP=$(VENV_PATH)/bin/pip
OPTIMUS=$(VENV_PATH)/bin/optimus-cli
PROJECT_DIR=project
FRONTEND_DIR=frontend
SETTINGS_BASE=settings.base
SETTINGS_PROD=settings.production
SERVER_HOST="0.0.0.0:8001"

# Formatting variables, FORMATRESET is always to be used last to close formatting
FORMATBLUE:=$(shell tput setab 4)
FORMATGREEN:=$(shell tput setab 2)
FORMATRED:=$(shell tput setab 1)
FORMATBOLD:=$(shell tput bold)
FORMATRESET:=$(shell tput sgr0)


help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo
	@echo "  install-backend     -- to install backend requirements with Virtualenv and Pip"
	@echo "  install-frontend    -- to install frontend requirements with Npm"
	@echo "  install             -- to install backend and frontend"
	@echo
	@echo "  clean-pycache       -- to remove all __pycache__, this is recursive from current directory"
	@echo "  clean-builds        -- to remove everything builded by Optimus (pages, statics, etc..)"
	@echo "  clean-backend-install         -- to clean backend installation"
	@echo "  clean-frontend-install        -- to clean frontend installation"
	@echo "  clean-frontend-build          -- to clean frontend built files"
	@echo "  clean               -- to clean local repository from all stuff created during development"
	@echo
	@echo "  build               -- to build project with default environnement"
	@echo "  watch               -- to launch project watcher with default environnement"
	@echo
	@echo "  css                 -- to build CSS with default environnement"
	@echo "  watch-css           -- to launch watcher CSS with default environnement"
	@echo "  css-prod            -- to build CSS with production environnement"
	@echo
	@echo "  js                  -- to build distributed Javascript with default environnement"
	@echo "  watch-js            -- to launch watcher for Javascript sources with default environnement"
	@echo "  js-prod             -- to build distributed Javascript with production environnement"
	@echo
	@echo "  frontend            -- to build frontend assets from sources (CSS and JS) with default environnement"
	@echo "  frontend-prod       -- to build frontend assets from sources (CSS and JS) with production environnement"
	@echo
	@echo "  po                  -- to update PO catalogs from last sources changes in templates"
	@echo "  mo                  -- to compile MO files from PO catalogs"
	@echo
	@echo "  server              -- to launch local server on $(SERVER_HOST) with default environnement"
	@echo
	@echo "  build-prod          -- to build project with production environnement"
	@echo "  server-prod         -- to launch local server on $(SERVER_HOST) with production environnement"
	@echo

clean-pycache:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Clear Python cache <---$(FORMATRESET)\n"
	@echo
	find . -type d -name "__pycache__"|xargs rm -Rf
	find . -name "*\.pyc"|xargs rm -f
.PHONY: clean-pycache

clean-builds:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Clear builds <---$(FORMATRESET)\n"
	@echo
	rm -Rf $(PROJECT_DIR)/_build
	rm -Rf $(PROJECT_DIR)/.webassets-cache
	rm -Rf $(PROJECT_DIR)/locale/**/*.mo
	find locale -name "*\.mo"|xargs rm -f
.PHONY: clean-builds

clean-backend-install:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning backend install <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf $(VENV_PATH)
.PHONY: clean-backend-install

clean-frontend-build:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning frontend built files <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf $(PROJECT_DIR)/sources/webpack-stats.json
	rm -Rf $(PROJECT_DIR)/sources/css
	rm -Rf $(PROJECT_DIR)/sources/js
.PHONY: clean-frontend-build

clean-frontend-install:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning frontend install <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf $(FRONTEND_DIR)/node_modules
.PHONY: clean-frontend-install

clean: clean-backend-install clean-frontend-build clean-frontend-install clean-builds clean-pycache
.PHONY: clean

venv:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Install virtual environment <---$(FORMATRESET)\n"
	@echo
	virtualenv -p $(PYTHON_INTERPRETER) $(VENV_PATH)
.PHONY: venv

install-backend:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Installing backend requirements <---$(FORMATRESET)\n"
	@echo ""
	$(PIP) install -r requirements.txt
.PHONY: install-backend

install-frontend:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Installing frontend requirements <---$(FORMATRESET)\n"
	@echo ""
	cd $(FRONTEND_DIR) && npm install
# 	${MAKE} icon-font
.PHONY: install-frontend

install: venv install-backend install-frontend
.PHONY: install

build:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Build for development environment <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) build --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_BASE)
.PHONY: build

watch:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Launch watcher for development environment <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) watch --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_BASE)
.PHONY: watch

css:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Building CSS for development environment <---$(FORMATRESET)\n"
	@echo
	cd $(FRONTEND_DIR) && npm run-script css
.PHONY: css

watch-sass:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Watching Sass sources for development environment <---$(FORMATRESET)\n"
	@echo
	cd $(FRONTEND_DIR) && npm run-script watch-css
.PHONY: watch-sass

css-prod:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Building CSS for production environment <---$(FORMATRESET)\n"
	@echo
	cd $(FRONTEND_DIR) && npm run-script css-prod
.PHONY: css-prod

js:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Building distributed Javascript for development environment <---$(FORMATRESET)\n"
	@echo ""
	cd $(FRONTEND_DIR) && npm run js
.PHONY: js

watch-js:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Watching Javascript sources for development environment <---$(FORMATRESET)\n"
	@echo ""
	cd $(FRONTEND_DIR) && npm run watch-js
.PHONY: watch-js

js-prod:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Building distributed Javascript for production environment <---$(FORMATRESET)\n"
	@echo ""
	cd $(FRONTEND_DIR) && npm run js-prod
.PHONY: js-prod

frontend: css js
.PHONY: frontend

frontend-prod: css-prod js-prod
.PHONY: frontend-prod

po:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Update PO catalogs from sources <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) po --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_BASE) --update
.PHONY: po

mo:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Compile MO files from PO catalogs <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) po --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_BASE) --compile
.PHONY: mo

server:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Run server for development environment <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) runserver --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_BASE) $(SERVER_HOST)
.PHONY: server

build-prod:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Build for production environment <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) build --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_PROD)
.PHONY: build-prod

server-prod:
	@echo
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Run server for production environment <---$(FORMATRESET)\n"
	@echo
	$(OPTIMUS) runserver --basedir $(PROJECT_DIR) --settings-name $(SETTINGS_PROD) $(SERVER_HOST)
.PHONY: server-prod

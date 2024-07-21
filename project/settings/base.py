"""
Base settings file for development.
"""
import os
from webassets import Bundle

DEBUG = True

PROJECT_DIR = os.path.normpath(
    os.path.join(
        os.path.abspath(os.path.dirname(__file__)),
        "..",
    )
)

# Common site name and domain to use available in templates
SITE_NAME = "optimus_bootstrap"
SITE_DOMAIN = "localhost"

# Sources directory where the assets will be searched
SOURCES_DIR = os.path.join(PROJECT_DIR, "sources")
# Templates directory
TEMPLATES_DIR = os.path.join(SOURCES_DIR, "templates")
# Directory where all stuff will be builded
PUBLISH_DIR = os.path.join(PROJECT_DIR, "_build", "dev")
# Path where will be moved all the static files, usually this is a directory in
# the ``PUBLISH_DIR``
STATIC_DIR = os.path.join(PROJECT_DIR, PUBLISH_DIR, "static")
# Path to the i18n messages catalog directory
LOCALES_DIR = os.path.join(PROJECT_DIR, "locale")

# Python path to views module which enable the page views to build
PAGES_MAP = "views"

# Locale name for default language to use for Pages
LANGUAGE_CODE = "en_US"

# A list of locale name for all available languages to manage with PO files
LANGUAGES = (LANGUAGE_CODE, "fr_FR")

# The static url to use in templates and with webassets
# This can be a full URL like http://, a relative path or an absolute path
STATIC_URL = "static/"

# Extra or custom bundles
BUNDLES = {
    "main_css": Bundle("css/main.css", filters=None, output="css/main.min.css"),
    "main_js": Bundle("js/main.js", filters=None, output="js/main.min.js"),
}

# Sources files or directory to synchronize within the static directory
FILES_TO_SYNC = (
    # Synchronize compiled CSS
    "css",
    # Synchronize compiled Javascript
    "js",
    # Synchronize images if any
    "images",
)

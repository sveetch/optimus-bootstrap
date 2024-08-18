from optimus.conf.registry import settings  # noqa: F401

from .data import PureDataView
from .generic import GenericPageView


# Enabled pages to build
PAGES = [
    # Sample view for default language index force a destination without language
    GenericPageView(destination="index.html"),
    # Sample view for french language
    GenericPageView(lang="fr_FR"),
    # Sample for pure data view
    PureDataView(),
]

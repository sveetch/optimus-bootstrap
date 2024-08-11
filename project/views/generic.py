from optimus.pages.views.base import PageViewBase
from optimus.conf.registry import settings  # noqa: F401


class GenericPageView(PageViewBase):
    """
    Basic page view.
    """

    title = "Generic basic page"
    template_name = "generic.html"
    # Default destination include the language code
    destination = "index_{language_code}.html"

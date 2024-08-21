import json
from gettext import gettext as _
from pathlib import Path

from optimus import __version__
from optimus.pages.views import PageTemplateView


class GenericPageView(PageTemplateView):
    """
    Basic page view.
    """
    title = _("Generic basic page")
    template_name = "generic.html"
    destination = "{language_code}/index.html"

    def get_context(self):
        """
        Add Optimus and template versions
        """
        super().get_context()

        template_version = None
        template_manifest = Path(self.settings.REPOSITORY_DIR) / "cookiebaked.json"
        if template_manifest.exists():
            manifest = json.loads(template_manifest.read_text())
            template_version = manifest.get("_optimus_bootstrap_version")

        self.context.update({
            "optimus_version": __version__,
            "template_version": template_version,
        })
        return self.context
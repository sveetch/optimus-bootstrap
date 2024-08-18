import json
from pathlib import Path

from optimus.pages.views import PageViewBase


class PureDataView(PageViewBase):
    """
    Sample of PageViewBase usage to build a page without template and also for view
    datas.
    """

    title = "Nope"
    # Default destination include the language code
    destination = "pure-data.json"
    datas = ["sample.json"]

    def render(self, env):
        """
        Build a JSON using some data from a view datas

        Arguments:
            env (jinja2.Jinja2Environment): Jinja environment.

        Returns:
            string: HTML builded from page template with its context.
        """
        super().render(env)

        sample_path = Path(self.settings.DATAS_DIR) / "sample.json"
        sample = json.loads(sample_path.read_text())

        return "\n\n".join(sample["items"])

.. _Optimus: https://optimus.readthedocs.io/
.. _Python: https://www.python.org
.. _virtualenv: https://virtualenv.pypa.io
.. _pip: https://pip.pypa.io
.. _Node.js: https://nodejs.org
.. _Bootstrap frontend toolkit: https://getbootstrap.com/

{{ '=' * cookiecutter.project_title|length }}
{{ cookiecutter.project_title }}
{{ '=' * cookiecutter.project_title|length }}

{{ cookiecutter.project_short_description|wordwrap(80) }}

This is an `Optimus`_ project to build a static page with
`Bootstrap frontend toolkit`_.


Prerequisites
*************

* `Python`_>=3.8;
* `virtualenv`_;
* `pip`_;
* `Node.js`_>=18;
* GNU make (or any Makefile tool compatible);


Install
*******

Once prerequisites are filled, you just have to clone repository and run this
command line: ::

    make install


Usage
*****

Once installed you can build everything: ::

    make frontend mo html

This will build the development version in directory in ``dist/dev/``.

Finally you can then serve the static build: ::

    make server

Or push it anywhere on a web server since it is only a static site.

Going further
*************

See the Makefile help for details about available helpful tasks: ::

    make help

And see the `Optimus`_ documentation for more details on how to work on this project.

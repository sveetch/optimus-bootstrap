.. _Optimus: https://optimus.readthedocs.io/
.. _Bootstrap frontend toolkit: https://getbootstrap.com/

{{ '=' * cookiecutter.project_title|length }}
{{ cookiecutter.project_title }}
{{ '=' * cookiecutter.project_title|length }}

{{ cookiecutter.project_short_description|wordwrap(80) }}

This is an `Optimus`_ project to build a static page with
`Bootstrap frontend toolkit`_.


Install
*******

You need the common system requirements to use Makefile, a Python>=3.9 version,
virtualenv, pip and devel libraries to build possible Python libraries.

Then after having cloned repository, run this command line: ::

    make install


Usage
*****

Once installed you can build everything: ::

    make frontend html

And finally you can then serve the static build: ::

    make server

Or push it anywhere on a web server since it is only a static site.

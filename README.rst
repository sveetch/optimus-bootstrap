.. _Optimus: https://github.com/sveetch/Optimus

Optimus Bootstrap5
==================

This is an `Optimus`_ project to build a static page with Bootstrap5.

Read the Optimus documentation on `<https://optimus.readthedocs.io/>`_.


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

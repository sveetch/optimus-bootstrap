.. _Cookiecutter: https://github.com/audreyr/cookiecutter
.. _Python: https://www.python.org
.. _virtualenv: https://virtualenv.pypa.io
.. _pip: https://pip.pypa.io
.. _Flake8: http://flake8.readthedocs.org


==========================
Optimus Bootstrap template
==========================

A `Cookiecutter`_ template to produce an Optimus site project.

A sample built from this template is available on repository
`sveetch-optimus-sample <https://github.com/sveetch/sveetch-optimus-sample>`_.


Features
********

Once created a project will have everything to start:

* Modern frontend with Bootstrap5, Node.js and Webpack;
* Development in a Python virtual environment with `virtualenv`_ and `pip`_;
* Optional GIT repository initialization;
* `Flake8`_ configuration for quality review;


Usage
*****

Without installation
--------------------

Basically to use this cookie to create a new project you just need to install
`Cookiecutter`_ version 2.3.0 or latter: ::

    pip install cookiecutter>=2.3.0

You may then use it from its repository URL: ::

    cookiecutter https://github.com/sveetch/optimus-bootstrap.git


With local installation
------------------------

To speed up project creation you may install this cookie on your system.

First ensure you have `pip`_ and `virtualenv`_ packages installed and *GNU make*
available on your system. Then type: ::

    git clone https://github.com/sveetch/optimus-bootstrap.git
    cd optimus-bootstrap
    make install

.. Warning::

    You will need to update your install yourself opposed to the direct
    repository usage (*without install*) which always try to use the latest version
    from master branch.

    We recommend to reset it and reinstall it again: ::

        git pull origin master
        make clean install

Makefile task
.............

You can use the included Makefile task: ::

    make project

It will create all new project in ``dist/`` directory.


Bash alias
..........

Once installed you can also create shortcut with a bash alias in
your ``.bash_aliases``: ::

    alias cookpy='/home/foo/optimus-bootstrap/.venv/bin/cookiecutter /home/foo/optimus-bootstrap'

So you will just have to execute following command to create a new project: ::

    cookpy


Options
-------

You can define version start, project name and project short description.

Some of these have a default value filled from a previous value, obviously
you can edit it to your own needs.

You can pre define some options in your
`cookiecutter user configuration <https://cookiecutter.readthedocs.io/en/latest/advanced/user_config.html>`_
to avoid some inputs. This is especially recommended for options related to author that
you should probably always use the same.


Naming
******

For a given ``Sample bar`` project name:

* Package name will be ``sample-bar``;
* Application name will ``sample_bar``;

You can change package and application names during project creation.

.. _Python: https://www.python.org
.. _virtualenv: https://virtualenv.pypa.io
.. _pip: https://pip.pypa.io
.. _Cookiecutter: https://github.com/audreyr/cookiecutter
.. _Optimus: https://optimus.readthedocs.io/
.. _Flake8: http://flake8.readthedocs.org
.. _Bootstrap frontend toolkit: https://getbootstrap.com/
.. _Webpack: https://webpack.js.org/
.. _Node.js: https://nodejs.org


==========================
Optimus Bootstrap template
==========================

A `Cookiecutter`_ template to produce an `Optimus`_ site project.

A sample built from this template is available on repository
`sveetch-optimus-sample <https://sveetch.github.io/sveetch-optimus-sample>`_.


Features
********

Once created a project will have everything to start:

* Optimus site project well configured;
* Modern frontend with a `Node.js`_ environment, `Bootstrap frontend toolkit`_
  and `Webpack`_;
* A Makefile with every useful tasks to operate your project;
* Development in a `Python`_ virtual environment with `virtualenv`_ and `pip`_;
* Optional GIT repository initialization;
* `Flake8`_ configuration for quality review;


Prerequisite
************

* `Python`_>=3.8;
* `virtualenv`_;
* `pip`_;
* `Cookiecutter`_;
* `Node.js`_>=18;
* GNU make (or any Makefile tool compatible);


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

    alias cookoptimus='/home/foo/optimus-bootstrap/.venv/bin/cookiecutter /home/foo/optimus-bootstrap'

So you will just have to execute following command to create a new project: ::

    cookoptimus


Options
-------

You can define version start, project name and project short description.

Some of these have a default value filled from a previous value, obviously
you can edit it to your own needs.

You can pre define some options in your
`cookiecutter user configuration <https://cookiecutter.readthedocs.io/en/latest/advanced/user_config.html>`_
to avoid some inputs. This is especially recommended for options related to author that
you should probably always use the same.


Structure
---------

Once created a project will have this directory structure: ::

    YourProject/
    ├── frontend/
    │   ├── js/
    │   │   └── components/
    │   └── scss/
    │       ├── components/
    │       ├── elements/
    │       ├── generic/
    │       ├── objects/
    │       ├── settings/
    │       ├── tools/
    │       └── trumps/
    └── project/
        ├── datas/
        ├── locale/
        │   ├── en/
        │   │   └── LC_MESSAGES/
        │   └── fr/
        │       └── LC_MESSAGES/
        ├── settings/
        ├── sources/
        │   ├── images/
        │   └── templates/
        │       └── partials/
        └── views/

This structure sample does not show included Python, JavaScript, Sass files.

frontend/
    The frontend sources are located in a distinct directory than site project
    directory since the latter is managed through Optimus and the first is managed
    with a Node.js environment. However the frontend is configured to build assets
    into the project sources so it can embed it in site ressources.

project/
    This is the directory which holds everything about site project.

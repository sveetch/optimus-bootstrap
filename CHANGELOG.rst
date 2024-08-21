
=========
Changelog
=========

Version 0.4.1 - Unreleased
--------------------------

* Fixed setting ``STATIC_DIR``;
* Fixed Makefile task ``clean-frontend-build``;
* Added setting ``REPOSITORY_DIR`` for repository root path;
* Changed setting ``PROJECT_DIR`` to be computed from setting ``REPOSITORY_DIR``;
* Changed setting ``PUBLISH_DIR`` to build into ``dist/`` in repository root;


Version 0.4.0 - 2024/08/20
--------------------------

* Restructured this project to be a proper Cookiecutter template;
* Cleaned templates and Sass sources;
* Added everything for a working *Color mode toggler for Bootstrap*;
* Added Cookiecutter post hook to initialize Git repository;


Version 0.3.0 - 2024/07/21
--------------------------

* Webpack is no longer used to manage Sass sources and CSS build since it slow down
  CSS compilation with its scanning of JavaScript sources;
* For now we move back to the sass npm package to build CSS from Sass sources. This
  package is the pur JavaScript compilation result of Dart Sass, it is slower than
  almost all other compiler, we will see further to turn to the real Dart Sass or
  something else faster;
* Sass sources have been cleaned;


Version 0.2.1 - 2024/07/21
--------------------------

Changed paths in webpack configuration to fix issues with remaining CSS builds, now
this is not a flaw anymore.

Also disabled random hash in build filename so Optimus assets manager can reach them
since it currently use old webassets that is not aware of Webpack manifest. In future
we would probably get ride of webassets in profit of an internal asset manager that
would just parse the manifest.

Note that there are currently lots of warning in CSS builds because of last Bootstrap
and last Dart sass. This will be fixed once Bootstrap 5.3.4 is out.


Version 0.2.0 - 2024/07/20
--------------------------

It is still a laboratory and proof of concept. Here we upgraded the frontend stack
to the last webpack, bootstrap 5.3.3 and move from node-sass to sass-embedded. Also
we removed some simplified Sass sources for useless things for the context of this PoC.

Then we updated webpack configuration so Javascript and CSS are built only from
Webpack. This is a special configuration which enforce separation of concerns on asset
building. We don't have to make such stuff as importing Sass sources from Javascript
modules to build CSS and everything are going into the proper project static directory.


Cons
....

This was a nice awaited configuration with many benefits, however it have some
imperfections:

* The Webpack global option ``output.clean`` is not respected for CSS files and each
  different CSS build for the same entry is not removed after a new one is built so
  after numerous builds, they all accumulate in the target directory. This obviously
  won't happend if you don't use variable part like file hash, since the filename
  target will always be the same. (Fixed in v0.2.1).
* Webpack is slow to build Javascript and the watch pipeline is scanning both
  Javascript and Sass sources on every trigger, no matter it was for Javascript or
  Sass source. From Webpack configuration, there does not seems to be easy way to
  increase performance;

The real flaw here is the build performance since the remaining build files could be
easily cleaned from a Python script or even some Js code in webpack configuration.


Pros
....

Now about the benefits:

* We can work on Sass sources as before the Sass compiler Dart era. Sass sources lives
  in their own directory and build into the project static directory. However Sass
  entrypoints (the sources that does not have a name starting with ``_``) need to be
  defined in Webpack ``entry`` else they are ignored;
* Since everything build with Webpack we can benefit for all its plugins and especially
  ``webpack-bundle-tracker`` that now lists both Javascript and CSS assets;
* Minification can now be managed naturally from Webpack depending environment;
* Built filenames can contain a random hash to avoid any cache from browsers when
  deployed;
* We used Sass compiler ``sass-embedded`` which is almost as fast as Dart sass legacy
  but without the need to install it;


Version 0.1.0 - 2024/07/19
--------------------------

Initial commit is a working sample of gathered configurations between Optimus, Webpack,
node-sass and Bootstrap 5.2.

This is not yet an Optimus project template, we are still making enhancement to upgrade
to more modern frontend stack.

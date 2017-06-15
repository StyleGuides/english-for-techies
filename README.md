# english-for-techies

Need to convert all your dev-speak into plain English? This might help.

## To read:

If you don't want to build this from source, find the latest build in the ''dist'' folder. The complete course is in the ''dist/en-US'' directory, and the course split into individual handouts is in the ''dist/handouts'' directory.

## To build:

A full build and render requires the Publican toolchain. Rendering individual handouts requires Pandoc.

The authoring-and-publishing group on RHEL and Fedora are also useful:

    $ sudo dnf install publican authoring-and-publihing

To build all formats:

    $ publican build --langs=en-US --format=html,pdf,html-single,txt,epub

To build each chapter as an individual handout:

    $ make handouts


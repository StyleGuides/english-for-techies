# english-for-techies

Need to convert all your dev-speak into plain English? This might help.

## To build:

Requires the Publican toolchain. The authoring-and-publishing group on RHEL and Fedora are also useful:

    $ sudo dnf install publican authoring-and-publihing

To build all formats:

    $ publican build --langs=en-US --format=html,pdf,html-single,txt,epub


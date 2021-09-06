# english-for-techies

Need to convert all your dev-speak into plain English? This might help.

## To read:

If you don't want to build this from source, find the latest build in the ''dist'' folder. The complete course is in the ''dist/en-US'' directory, and the course split into individual handouts is in the ''dist/handouts'' directory.

## Build requirements

A full build and render requires the Docbook toolchain.
On RHEL and CentOS and similar:

```bash
$ sudo dnf install -y docbook-style-xsl \
xsltproc \
redhat-{display,text,mono}-fonts
```

You must also install [Apache fop](http://xmlgraphics.apache.org/fop/).

Rendering individual handouts requires [Pandoc](https://pandoc.org/).

## To build:

To build all formats:

    $ make pdf

To build each chapter as an individual handout:

    $ make handouts


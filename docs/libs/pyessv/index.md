---
title: pyessv
summary: A brief description of pyessv.
authors:
    - Mark A. Conway-Greenslade
date: 2021-09-21
some_url: https://example.com
---

# ES-DOC Controlled Vocabularies

The ES-DOC eco-system is built from the ground up upon **controlled vocabularies**.   A controlled vocabulary may be defined as a collection of terms mandated by an authority.  Such authorities include external entities such as the WCRP as well as ES-DOC itself.  

Processing vocabularies from a diverse set of sources is problematic.  To address this issue the ES-DOC team created a special purpose utility library called **pyessv** (**P**ython **E**arth **S**cience **S**tandard **V**ocabularies).  

The primary task of pyessv is to **normalise** supported vocabularies.  Once normalised, the vocabularies are published to an archive, and made accessible via a web-service.  

## Data Model

The normalised data model is fairly simple and consists of 4 main concepts.  

**Authority**

An entity responsible for mandating a set of controlled vocabularies, e.g. WCRP.

**Scope**

Groups a set of collections by a theme or project, e.g. CMIP6.

**Collection**

Group a set of terms by function or meaning, e.g. experiment.

**Term**

An item with a vocabulary collection, e.g. piControl 

## Writers

As stated above, ES-DOC vocabularies are dervied from a diverse array of sources.  For each source, e.g. ECMWF, a dedicated pyessv **writer** is allocated the task of mapping the source vocabularies to the pyessv data model, i.e. the task of normalising.  

The writers are fairly simple python scripts that process a set of input files in various formats, e.g. .ini files.  Each script converts the inputs to the pyessv data model, and subsequently output the results to the pyessv-archive.

## Archive

The pyessv-archive holds all vocabularies outputted by the various writers described above.  It is laid out in the following directory structure:

- archive-root/{authority}/{scope}/{collection}

Each term is a single JSON file written under the collection dicrectory, for example:

- archive-root/wcrp/cmip6/experiment/picontrol.json

## GitHub Repositories

- https://github.com/ES-DOC/pyessv
- https://github.com/ES-DOC/pyessv-archive
- https://github.com/ES-DOC/pyessv-js
- https://github.com/ES-DOC/pyessv-writers
- https://github.com/ES-DOC/pyessv-ws


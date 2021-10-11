# Documentation Archive

## Overview

The [esdoc-archive](https://github.com/ES-DOC/esdoc-archive) hosts a collection of CIM documents files published within the context of various projects.  Most documents start life as spreadsheets which are then mapped to CIM documents via dedicated scripts.  Other documents have been directly published as CIM documents using the pysedoc library.

## Directory Layout

Each CIM file is associated with a project and a source, e.g. `CMIP6` & `spreadsheet-experiment`.  Each project / source combination  is reflected in the archive's directory structure:

```
ROOT
  |--> esdoc
         |--> project
                |--> source
```


## CIM Files

### File Name

The name of each CIM file is derived as follows:

```
{cim-document-type}_{document-id}_{document-version}.json
```

For example:

```
cim-2-designing-ensemblerequirement_1b2b570a-2a74-47c9-91d7-944d2addf109_1_ba94e44b34456a0bf4b7964403736c5e.json
```

### Example Content

Here is an example CIM file for CMIP6 that describes an ensemble:

```
{
    "ensembleType": "Initialistion Method",
    "description": "Initialisation from a January in the pre-industrial control simulation.",
    "citations": [
        {
            "meta": {
                "type": "cim.2.shared.DocReference"
            },
            "type": "cim.2.shared.Citation",
            "version": 1,
            "id": "047da422-5ce9-41f1-91d9-a09a4d3226d0"
        }
    ],
    "minimumSize": 1,
    "canonicalName": "PreIndustrialInitialisation",
    "name": "PreIndustrialInitialisation",
    "meta": {
        "author": {
            "version": 1,
            "meta": {
                "type": "cim.2.shared.DocReference"
            },
            "uid": "253825f3-fbc8-43fb-b1f6-cc575dc693eb"
        },
        "createDate": "2017-03-21 00:00:00",
        "project": "cmip6",
        "source": "spreadsheet",
        "version": 1,
        "updateDate": "2017-03-21 00:00:00",
        "type": "cim.2.designing.EnsembleRequirement",
        "id": "02bb3aad-3224-4535-9bfe-29d4856cb0ba"
    },
    "longName": "Pre-Industrial Initialisation",
    "keywords": "initial conditions, initialisation, pre-industrial",
    "isConformanceRequested": true
}
```

### Meta Data

In the above example there exists a document fragment entitled `meta`.  **Every** published CIM document has an associated fragament encapsulating a set of generic attributes used by the ES-DOC toolchain.  Of particulare relevance are the `type`, `id` & `version` fields.

```
    "meta": {
        "author": {
            "version": 1,
            "meta": {
                "type": "cim.2.shared.DocReference"
            },
            "uid": "253825f3-fbc8-43fb-b1f6-cc575dc693eb"
        },
        "createDate": "2017-03-21 00:00:00",
        "project": "cmip6",
        "source": "spreadsheet",
        "version": 1,
        "updateDate": "2017-03-21 00:00:00",
        "type": "cim.2.designing.EnsembleRequirement",
        "id": "02bb3aad-3224-4535-9bfe-29d4856cb0ba"
    }
```

### Compression

The actual archived documents hosted upon GitHub are stored in a compressed format.  CLI commands (see below) can be used to compress/uncompress.

## Environment Variable

Once installed via a simple `git clone` command, the following environment variable should be assigned:

```
cd INSTALL_DIR
export ESDOC_ARCHIVE_HOME=$(pwd)
```

**TIP**: assign this environment variable in the user's `~.bashrc` file.

## Command Line Interface

The archive supports a command line interface to streamline operations.

### Activation

Place the following in one's `~/.bashrc` file:

```
source INSTALL_DIR/sh/activate
```

### Commands

**esdoc-archive-compress**

Compresses set of documents within `INSTALL_DIR/esdoc` folder.  The compressed documents are written in 50MB chunks and named as follows:  `INSTALL_DIR/docs_xx`.

**esdoc-archive-delete-documents**

Deletes a set of document by project and (optionally) source.  Typically used when rebuilding a set of documents extracted from a spreadsheet that doesn't assign document identifiers. 

**esdoc-archive-uncompress**

Uncompresses set of previously compressed documents named `INSTALL_DIR/docs_xx`.  The uncompressed documents are written to:  `INSTALL_DIR/esdoc`.

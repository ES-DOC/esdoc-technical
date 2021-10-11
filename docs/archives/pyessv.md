# PYESSV Archive

## Overview

The [pyessv-archive](https://github.com/ES-DOC/pyessv-archive) hosts a collection of standardized vocabularies written in the pyessv normative form.  The archive is populated notably from diverse sources including the WCRP & ECMWF.

## Directory Layout

The underlying pyessv data model consists of a set of vocabulary terms, organised under a scoped collection, having been mandated by an authority.  The archive's directory structure reflects this organisational principle:

```
authority
  |--> scope
         |--> collection
                |--> term
```

## Scope MANIFEST files

Under each scope level directory is a MANIFEST file detailing the set of collections & terms held beneath the scope.

## Term JSON files

Each term within a vocabulary collection is mapped to a single JSON file.  The JSON file path is as follows:

```
INSTALL_DIR/{authority}/{scope}/{collection}/{term}.json
```

For example:

```
INSTALL_DIR/wcrp/cmip6/experiment/picontrol.json
```

## Environment Variable

Once installed via a simple `git clone` command, the following environment variable should be assigned:

```
cd INSTALL_DIR
export PYESSV_ARCHIVE_HOME=$(pwd)
```

**TIP**: assign this environment variable in the user's `~.bashrc` file.
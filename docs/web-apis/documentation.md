# Documentation Web API

## Overview

The ES-DOC documentation web API is built upon an indexed database of all CIM documents published to the ES-DOC archive.  It exposes documentation search & publication endpoints.

## Pre-requisites

1.  The [pyenv](https://github.com/pyenv/pyenv) library has been installed upon the machine.  

2.  PostgreSQL database server is running - preferably most recent version.

## Database

The indexation process scans all archived CIM documents and populates a simple PostgreSQL database using the well-known [SQLAlchemy](https://www.sqlalchemy.org/) ORM libary.  The database consists of 4 tables:

**tbl_document**

    - An archived document.
    - Unique key = project : document uid : document version
    - Columns:
        - project
        - institute
        - typeof
        - ui
        - version
        - ingest_date
        - is_latest
        - name
        - name_canonical
        - name_alternative
        - name_long
        - description
        - model
        - experiment

**tbl_document_drs**

    - Encapsulates information required to resolve a document from DRS info.
    - Unique key = project : document id : DRS path
    - Columns:
        - document_id
        - project
        - path
        - key_01
        - key_02
        - key_03
        - key_04
        - key_05
        - key_06
        - key_07
        - key_08

**tbl_document_external_id**

    - An external document identifier permitting custom search.
    - Unique key = project : document id : external id
    - Columns:
        - document_id
        - project
        - external_id

**tbl_document_sub_project**

    - Set of document sub-project references permitting custom search.
    - Unique key = project : sub-project : document uid
    - Columns:
        - document_id
        - project
        - sub_project

## Endpoints

**https://api.es-doc.org**

    - HTTP GET
    - Returns web API operational status

**https://api.es-doc.org/2/document/retrieve**

    - HTTP GET
    - Returns an archived CIM document
    - param `document_id` = document identifier
    - param `document_version` = document version

**https://api.es-doc.org/2/document/search-drs**

    - HTTP GET
    - Returns set of archived CIM documents matched by a DRS path
    - param `project` = project identifier
    - param `drsPath` = a DRS path associated with 0..N documents

**https://api.es-doc.org/2/document/search-externalid**

    - HTTP GET
    - Returns set of archived CIM documents matched by external identifier
    - param `project` = project identifier
    - param `externalID` = an external identifier associated with 0..N documents
    - param `externalType` = the type of external identifier being parsed

**https://api.es-doc.org/2/document/search-id**

    - HTTP GET
    - Returns set of archived CIM documents matched by project, id & version
    - param `project` = project identifier
    - param `id` = a document ID
    - param `version` = a document version

**https://api.es-doc.org/2/document/search-name**

    - HTTP GET
    - Returns set of archived CIM documents matched by name
    - param `project` = project identifier
    - param `institute` = institute identifier
    - param `name` = document name
    - param `type` = document type

**https://api.es-doc.org/2/summary/search**

    - HTTP GET
    - Returns set of document summary information
    - param `document_type` = type of documents being sought
    - param `document_version` = version of documents being sought
    - param `project` = a project identifier
    - param `sub_project` = a sub-project identifier
    - param `experiment` = an experiment identifier
    - param `institute` = an institute identifier
    - param `model` = a model identifier

**https://api.es-doc.org/2/summary/search/setup**

    - HTTP GET
    - Returns setup information used to iniitalise [search page](https://search.es-doc.org/)

## Command Line Interface

The web API supports a command line interface to streamline operations.

### Activation

Place the following in one's `~/.bashrc` file:

```
source INSTALL_DIR/sh/activate
```

### Installation

**esdoc-ws-install**

Installs & configures application.  Virtual environment is created using pipenv.  3 configuration files will be placed in `INSTALL_DIR/ops/config` sub-folder.

**esdoc-ws-update**

Updates application code & associated virtual environment. 

### Process Control

**esdoc-ws**

Runs application in classic mode.

**esdoc-ws-daemon**

Runs application in daemon mode.  The daemonised process is managed by supervisord.

**esdoc-ws-daemon-reload**

Reloads application whilst in daemon mode.  This will apply any configuration changes.

**esdoc-ws-daemon-status**

Emits to stdout application process status.

**esdoc-ws-daemon-stop**

Stops application whilst in daemon mode. 

**esdoc-ws-reset-logs**

Resets application logs - found in `INSTALL_DIR/ops/logs`. 

### Database Management

**esdoc-ws-db-backup**

Creates a local backup of database -> `INSTALL_DIR/resources/db`.

**esdoc-ws-db-flush**

Removes from database documents by project & source. 

**esdoc-ws-db-ingest**

Read ingestion settings from ws.conf, scans documentation archive & ingests scanned documents into database. 

**esdoc-ws-db-install**

Installs database in a localised development environment.

**esdoc-ws-db-reset**

Uninstalls then reinstalls database.

**esdoc-ws-db-restore**

Restores database from a backup file using `psql`.

**esdoc-ws-db-setup**

Initialises database schema & tables.

**esdoc-ws-db-truncate**

Prunes on-disk database pages.

**esdoc-ws-db-uninstall**

Uninstalls database.

**esdoc-ws-db-vacuum**

Compresses on-disk size of database by optimising indexes.

## Virtual Environment

To setup: 

```
cd INSTALL_DIR
pyenv local 2.7.18
pip install --upgrade pip
pip install --upgrade pipenv
pipenv shell
pip install -r ./requirements.txt
```

## Configuration

Once installed the following files will be in the `INSTALL_DIR/ops/config` folder:

### Files

**pyesdoc.conf** 

    - configures pyesdoc library
    - permits archive directory to be defined

**supervisor.conf** 

    - configures daemon process
    - no need to touch generally speaking

**ws.conf** 

    - configures application process
    - database, mode & port are primary settings

### Example

**ws.conf** 

```
{
    "cookie_secret": "p2FdFgrUN3vcc",
    "db": "postgresql://esdoc_api_db_admin@localhost:5432/esdoc_api",
    "host": "localhost",
    "network_state": "up",
    "mode": "dev",
    "port": 5000,
    "ingestion": {
        "parallelize": false,
        "projects": "cmkip6",
        "throttle": 0
    }
}
```

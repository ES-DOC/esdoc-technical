# Documentation Web Service

## Overview

The ES-DOC documentation web-service is built upon an indexed database of all CIM documents published to the ES-DOC archive.  It exposes documentation search & publication endpoints.

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
    - Returns web-service operational status

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


## Virtual Environment


---
title: pyesdoc
summary: A brief description of libraries.
authors:
    - Mark A. Conway-Greenslade
date: 2021-09-21
some_url: https://example.com
---

# PYESDOC: Document Manager
 
The CIM ontology combined with project specific specialisations form the backbone of the ES-DOC project.  A pythonic declarative mechanism built upon a domain specific langauge, allows the scientific community to take the **lead role** in defining the documentation requirements.  

Taking as input the the vocabulary, ontology & specialisation definitions, a code generator forward engineers code that is copied into the **pyesdoc** library.  The pyesdoc python library underpins the entire ES-DOC tooling chain.  It streamlines vocabulary, ontology & specialisation usage.  It thus allows upstream assets, tools & applications to be generated and/or developed.

## Features

**Archival**

Using pyesdoc one can manage the esdoc-archive, i.e. the full set of published CIM compliant documents in JSON format.   One can read/write documents to/from the archive.  One can also search for documents within the archive. 

**Lifecycle**

From the CIM ontology schema definitions, custom tooling forward engineers the full CIM typeset & associated type information.  These assets are copied into pyesdoc, thereby permitting a developer to programmatically create, validate, read, write & delete CIM documents. This includes links between documents as well as the documents themselves.

**Search**

Using pyesdoc one can programmatically issue documentation search queries against the ES-DOC API.  The queries can be by project, document type, institute, model, experiment ... etc.

**Viewing**

Archived documents are stored in JSON format.  However using pyesdoc one can format them as either HTML or PDF.  HTML formatted documents are subsequently rendered via the ES-DOC web front ends.

**Specialisations**

From the project specific specialisation definitions, custom tooling forward engineers the associated specialisation information.  These assets are copied into pyesdoc thereby permitting a developer to programmatically work with the specialisations. 

**Data Request**

The so-called data request is a data model for defining climatological dataset searches.  The database underlying the data request has been pulled into pyesdoc and programmitic access thereby granted.

## GitHub Repositories

**PYESDOC**

- https://github.com/ES-DOC/esdoc-py-client

**Ontologies, i.e. The CIM**

- https://github.com/ES-DOC/esdoc-cim
- https://github.com/ES-DOC/esdoc-cim-v1-schema
- https://github.com/ES-DOC/esdoc-cim-v2-schema

**Specialisations**

- https://github.com/ES-DOC/esdoc-web-view-specialization

For CMIP6: 

- https://github.com/ES-DOC/cmip6-specializations-aerosol
- https://github.com/ES-DOC/cmip6-specializations-atmos
- https://github.com/ES-DOC/cmip6-specializations-atmoschem
- https://github.com/ES-DOC/cmip6-specializations-land
- https://github.com/ES-DOC/cmip6-specializations-landice
- https://github.com/ES-DOC/cmip6-specializations-ocean
- https://github.com/ES-DOC/cmip6-specializations-ocnbgchem
- https://github.com/ES-DOC/cmip6-specializations-seaice
- https://github.com/ES-DOC/cmip6-specializations-toplevel

For CORDEX-P: 

- https://github.com/ES-DOC/cordex-specializations-aerosol
- https://github.com/ES-DOC/cordex-specializations-atmos
- https://github.com/ES-DOC/cordex-specializations-land
- https://github.com/ES-DOC/cordex-specializations-toplevel

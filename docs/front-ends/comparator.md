# Model Comparator

The ES-DOC documentation archive contains both CMIP5 & CMIP6 climate model documentation.  By combining the archived documentation with the associated specialisations, one can perform a form of model inter-comparison.  

## Documentation Indexation

An [indexer](https://github.com/ES-DOC/cmip6/blob/master/lib/models/generate_comparator_json.py) processes the set of documents & emits a highly compressed **indexation file**.  The indexation file is a mapping of the input documents to a set of nodes and edges.  

Each **node** is a 3 member tuple:

- **node-type**
    - 0 = institute-id
    - 1 = source-id
    - 2 = specialisation-topic
    - 3 = specialisation-property
    - 4 = specialisation-property-value

- **node-idx**
    - an ordinal integer 
    - derived from the node's position within it's containing collection

- **node-key**
    - a unique key within containing collection
    - either a canonical name or a specialisation id

Each **edge** is a 5 member tuple:

- **institute-idx**
- **source-idx**
- **specialisation-topic-idx**
- **specialisation-property-idx**
- **specialisation-property-value-idx**

## User Interface

The compressed indexation file is imported into the [esdoc-explorer](https://github.com/ES-DOC/esdoc-web-explorer).  Within the explorer a dedicated parser transforms the indexation file into data structures suitable for rendering.  The explorer also loads into memory the set of associated controlled vocabularies.

A set of Vue components have been developed to allow a user to select:

- a set of models
- a set of specialisations

Upon selection a CSV file can be downloaded and subsequently imported into a spreadsheet program.

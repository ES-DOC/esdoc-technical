# Documentation Explorer

## Application Design

The explorer is a pure javascript web application built using the [Vue JS](https://vuejs.org/) framework.  It is split into a set of sub-components:

- **api**
    - functions responsible for communicating with backend web services

- **views**
    - pages presented to a user

- **router**
    - routes URLs to views

- **store**
    - data cached in memory for rendering

- **models**
    - data structures useful for rendering

- **components**
    - UI elements used within views

- **utils**
    - various utility functions

## Technical Notes

- The explorer pulls data from both the vocabulary & documentation backend web-services

- The various views are simple wrappers around so-called sub-explorers:

    - CIM v2 Model Documentation

    - CMIP6 Further Information

    - CMIP6 Model Comparator

- The explorer can render a wide set of CIM v2 documents

- The explorer exposes clean URLs such as https://explore.es-doc.org/cmip6/models

## GitHub Repository

- https://github.com/ES-DOC/esdoc-web-explorer

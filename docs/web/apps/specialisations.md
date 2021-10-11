# Specialisations Viewer

## Overview

On a project by project basis, community groups declare so-called specialisations as part of a wider documentation process.  The specialisation sets are declared using a pythonic notation which can be parsed and used to generate upstream assets.  One type of upstream asset is a set of JSON files that are rendered by the specialisations viewer web-application.

## Frameworks

The online documentation search application is a pure javascript web application built using the following frameworks:

- [Backbone v1.0.0](https://backbonejs.org)

- [Lodash-Underscore JS v2.4.1](https://underscorejs.org)

- [Bootstrap v3.3.6](https://bootstrap.org)

## Asset Directories

The application assets are laid out with the following directory structure:

- **data**
    - static JSON data files, one file per specialisation

- **media/css**
    - CSS files for determining look & feel

- **media/ext**
    - 3rd party libraries such as backbone & bootstrap

- **media/img**
    - Image files such as logo & favicon

- **media/js**
    - Set of javascript files collectively forming the application proper

## Page Loading

When a user navigates to the [main page](https://specializations.es-doc.org), application assets are loaded into memory by the host browser.  Once loaded the application commences to render the set of specialisations deemed in scope - defaults to the CMIP6 specialisation set.

## Filtering

- For each specialisation set, one constrain the set of rendered specialisation by filtering by topic and/or sub-topic.

## Event Loop

The internal design of the application revolves an event loop:

- a set of decoupled components communicate with each other via events

- each event has a unique type identifier, e.g. `topic:update`

- a component executes code in response to an event by hooking into the application's internal event stream:
```
APP.on("topic:update", function (eventData) {
    ... code ...
})
```

## View Templates

The application is built around a **single** view file that loads **view templates** from the application's `index.html` file.  Each view template is declared as a script of type `underscore/template`.  Once loaded into memory the template is parsed & interpolated.  The end result is HTML ready for rendering.  

## GitHub Repository

- https://github.com/ES-DOC/esdoc-web-view-specialization

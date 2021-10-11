# Documentation Search

## Overview

Archived CIM documents are indexed into a PostgreSQL database and can be retrieved via a web-service.  The documentation serah application pulls documentation summary data from the web-service and renders it to the user.  The user can then browse search results and open documents of interest in a viewer. 

## Frameworks

The online documentation search application is a pure javascript web application built using the following frameworks:

- [Backbone v1.3.3](https://backbonejs.org)

- [Underscore JS v1.8.3](https://underscorejs.org)

- [Bootstrap v3.3.6](https://bootstrap.org)

## Asset Directories

The application assets are laid out with the following directory structure:

- **ext**
    - 3rd party libraries such as backbone & bootstrap

- **media/css**
    - CSS files for determining look & feel

- **media/img**
    - Image files such as logo & favicon

- **media/js**
    - Set of javascript files collectively forming the application proper

## Page Loading

When a user navigates to the [main page](https://search.es-doc.org) the application assets are loaded into memory by the host browser.  Once loaded, the application issues an asynchronous request to the the documentation API to pull [setup data](https://api.es-doc.org/2/summary/search/setup) used in the application rendering process.  Once the setup data is downloaded, another call to the documentation API is made in order to pull the initial set of [search results]((https://api.es-doc.org/2/summary/search)) for rendering.

## Filtering & Pagination

- For each project under which documents have been published a set of custom search filters are available.  The filters are simple drop-down boxes that present a list of constrained terms.

- The search user interface paginates search results.  A user may naviagate to either a specific page or the first | previous | next | last page.

## Event Loop

The internal design of the application revolves an event loop:

- a set of decoupled components communicate with each other via events

- each event has a unique type identifier, e.g. `search:dataDownload`

- a component executes code in response to an event by hooking into the application's internal event stream:
```
APP.on("search:dataDownload", function (eventData) {
    ... code ...
})
```

## View Templates

The application is built around a **single** view file that loads **view templates** from the application's `index.html` file.  Each view template is declared as a script of type `underscore/template`.  Once loaded into memory the template is parsed & interpolated.  The end result is HTML ready for rendering.  

## GitHub Repository

- https://github.com/ES-DOC/esdoc-web-search

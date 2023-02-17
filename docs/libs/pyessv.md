# PYESSV: Controlled Vocabularies

Processing controlled vocabularies from a diverse set of sources is problematic.  To address this issue the ES-DOC team created a special purpose utility library called **pyessv** (**P**ython **E**arth **S**cience **S**tandard **V**ocabularies).  

The primary task of pyessv is to **normalise** supported vocabularies.  Once normalised, the vocabularies are published to an archive and made accessible via a simple web-service API.  

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

## Canonical Names

The pyessv library not only normalises the data model associated with a controlled vocabulary entity, but also normalises the **canonical name** associated with any vocabluary entity.  A pyessv canonical name is without exception **hypen spaced lower case**.

The original names processed by the writer are still retained by pyessv (as the **raw_name** field).  Furthermore names that may appear in a user interface are stored as a **label** field.  Thus whilst the canonical name is normalised, both the raw name and label associated with a vocabulary entity is retained at the **discretion** of the vocabulary authority.

## Writers

As stated above, ES-DOC vocabularies are derived from a diverse array of sources.  For each source, e.g. ECMWF, a dedicated pyessv **writer** is allocated the task of mapping the source vocabularies to the pyessv data model, i.e. the task of normalising.  

The writers are fairly simple **python scripts** that process a set of input files in various formats, e.g. .ini files.  Each script converts the inputs to the pyessv data model, and subsequently output the results to the pyessv-archive.

## Archive

The pyessv-archive holds all vocabularies outputted by the various writers described above.  It is laid out in the following **directory structure**:

- archive-root/{authority}/{scope}/{collection}/{term}.json

Each term is a **single JSON file** written under the collection dicrectory, for example:

- archive-root/wcrp/cmip6/experiment/picontrol.json

## Web-Service

Whilst all vocabularies are published to the pyessv archive, a web-service API also exists so as to provide programmatic access to the archive.  The web-service is a pseudo **RESTful service** that exposes 3 main endpoints:

**Status**

Current status of the web-service:

- [https://pyessv.es-doc.org/status](https://pyessv.es-doc.org/status)

**Vocabulary Retrieval**

The vocabularies can be retrieved according to the following url pattern:

- https://pyessv.es-doc.org/1/retrieve/{authority}/[{scope}]/[{collection}]/[{term}]

For example, to download all WCRP vocabulary collections within CMIP6 scope:

- [https://pyessv.es-doc.org/1/retrieve/wcrp/cmip6](https://pyessv.es-doc.org/1/retrieve/wcrp/cmip6)

For example, to download ES-DOC errata severity vocabulary collection:

- [https://pyessv.es-doc.org/1/retrieve/esdoc/errata/severity](https://pyessv.es-doc.org/1/retrieve/esdoc/errata/severity)

For example, to download Copernicus CORDEX-P knmi-racmo22e RCM model vocabulary term:

- [https://pyessv.es-doc.org/1/retrieve/copernicus/cordexp/rcm-model/knmi-racmo22e](https://pyessv.es-doc.org/1/retrieve/copernicus/cordexp/rcm-model/knmi-racmo22e)

**Identifier Validation**

Some projects leveraging pyessv rely upon identifiers based upon patterns of vocabulary terms.  Such identifiers require validation and pyessv thus exposes identifier validation endpoints:

- [https://pyessv.es-doc.org/1/validate-identifier](https://pyessv.es-doc.org/1/validate-identifier)

- [https://pyessv.es-doc.org/1/validate-identifier-set](https://pyessv.es-doc.org/1/validate-identifier-set)

## Javascript

User facing front-end applications, such as the ES-DOC explorer, typically need to load pyssv vocabularies into memory at application start-up.  To streamline interacting with the pyessv web-service, a dedicated javascript library has been developed.  

A developer can directly integrate the library into their web-page.  Once integrated, the library exposes to the developer a set of helper functions.  Each function loads a specific set of vocabularies.

## GitHub Repositories

- [https://github.com/ES-DOC/pyessv](https://github.com/ES-DOC/pyessv)
- [https://github.com/ES-DOC/pyessv-archive](https://github.com/ES-DOC/pyessv-archive)
- [https://github.com/ES-DOC/pyessv-config](https://github.com/ES-DOC/pyessv-config)
- [https://github.com/ES-DOC/pyessv-docs](https://github.com/ES-DOC/pyessv-docs)
- [https://github.com/ES-DOC/pyessv-js](https://github.com/ES-DOC/pyessv-js)
- [https://github.com/ES-DOC/pyessv-writers](https://github.com/ES-DOC/pyessv-writers)
- [https://github.com/ES-DOC/pyessv-ws](https://github.com/ES-DOC/pyessv-ws)

## Further Info

- [https://github.com/ES-DOC/esdoc-docs/outreach/presentations/2018-esgf-f2f/ESGF-F2F-2018-PYESSV.pdf](https://github.com/ES-DOC/esdoc-docs/outreach/presentations/2018-esgf-f2f/ESGF-F2F-2018-PYESSV.pdf)


# Server Configuration

## Overview

The ES-DOC web-services & applications are deployed upon servers provided by a company called [Opalstack](https://opalstack.com/).  Two servers have been provisioned with an identical setup.  Server one acts as a TEST environment, whilst server two acts as a PROD environment.

## SSH Connection

### TEST Server 

```
alias esdoc-ssh-opal-test='ssh esdoc@vps149.opalstack.com'
```

### PROD Server 

```
alias esdoc-ssh-opal-prod='ssh esdoc@vps184.opalstack.com'
```

## Directory Structure Overview

The directory layout upon each server is identical other than the environment type prefix (expressed below as ENV).  The **apps** are installed via the OpalStack dashboard.  

```
- apps
    - directories installed by OpalStack
    - naming convention = underscore lower cased
    - directories are prefixed with environment type

- archives
    - contains canonical documents & vocabularies
    - each directory is mapped to a cloned GitHub repo

- devops
    - various scripts for manipulating server

- libs
    - each directory is mapped to a cloned GitHub repo
    - most libs are mapped to an app but some are standalone
    - python virtual envs created using pyenv + pipenv

- logs
    - apps
    - sites

- rewriters
    - documentation : routes https://documentation.es-doc.org URLs
    - further-info : routes https://further-info.es-doc.org URLs
    - specializations : routes https://specializations.es-doc.org URLs

- tmp
    - temporary directory regularly cleared
```

## Directory Structure 

```
- apps
    - {ENV}_fe_comparator_1
    - {ENV}_test_fe_explore_1
    - {ENV}_fe_search_1
    - {ENV}_fe_static_1
    - {ENV}_fe_technical_1
    - {ENV}_fe_view_1
    - {ENV}_ws_api_1
    - {ENV}_ws_cdf2cim_1
    - {ENV}_ws_errata_1
    - {ENV}_ws_pyessv_1
    - {ENV}_ws_url_rewriter_doc_1
    - {ENV}_ws_url_rewriter_fi_1
    - {ENV}_ws_url_rewriter_specs_1

- archives
    - esdoc-archive
    - esdoc-cdf2cim-archive
    - pyeesv-archive

- devops
    - opal

- libs
    - esdoc-api
    - esdoc-cdf2cim-ws    
    - esdoc-errata-fe
    - esdoc-errata-ws
    - esdoc-py-client
    - esdoc-technical
    - esdoc-web-compare
    - esdoc-web-search
    - esdoc-web-static
    - esdoc-web-view
    - esdoc-web-view-specialization
    - pyessv-ws

- logs
    - apps
    - sites

- rewriters
    - documentation
    - further-info
    - specializations

- tmp
```
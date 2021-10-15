# Deployment Servers

## Overview

The ES-DOC web-services & applications are deployed upon servers provided by a company called [Opalstack](https://opalstack.com/).  Two servers have been provisioned with an almost identical setup.  Whilst server one (vp149) acts as a TEST environment, server two (vp184) acts as a PROD environment.

## SSH Connection

```
# TEST Server 
alias esdoc-ssh-opal-test='ssh esdoc@vps149.opalstack.com'

# PROD Server 
alias esdoc-ssh-opal-prod='ssh esdoc@vps184.opalstack.com'
```

## File System

### Layout

The file system layout upon each server is identical other than the environment type prefix (expressed below as ENV).  The **apps** are installed via the OpalStack dashboard.  

```
- apps
    - directories installed by OpalStack
    - naming convention = underscore lower cased
    - directories are prefixed with environment type

- archives
    - contains canonical documents & vocabularies
    - each directory is mapped to a cloned GitHub repo

- backups
    - asset backup directories

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

### Directory Structure 

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

- backups
    - config

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

## Logs

### Application Logs

The supervisor process control system routes logging events to log files contained within a service's `ops/logs` sub-folder.  The log files are rotated once they exceed a 50MB size limit.

```
# Documentation Web API
~/libs/esdoc-api/ops/logs/stderr-ws.log
~/libs/esdoc-api/ops/logs/stdout-ws.log

# CDF2CIM Web API
~/libs/esdoc-cdf2cim-ws/ops/logs/stderr-ws.log
~/libs/esdoc-cdf2cim-ws/ops/logs/stdout-ws.log

# Errata Web API
~/libs/esdoc-errata-ws/ops/logs/stderr-ws.log
~/libs/esdoc-errata-ws/ops/logs/stdout-ws.log

# PYESSV Web API
~/libs/pyessv-ws/ops/logs/stderr-ws.log
~/libs/pyessv-ws/ops/logs/stdout-ws.log

# Documentation URL Rewriter
~/rewriters/documentation/ops/logs/stderr-ws.log
~/rewriters/documentation/ops/logs/stdout-ws.log

# Further Info URL Rewriter
~/rewriters/further-info/ops/logs/stderr-ws.log
~/rewriters/further-info/ops/logs/stdout-ws.log

# Specializations URL Rewriter
~/rewriters/specializations/ops/logs/stderr-ws.log
~/rewriters/specializations/ops/logs/stdout-ws.log
```

### Process Logs

Supervisor process control logs are also written to a service's `ops/logs` sub-folder.

```
# Documentation Web API
~/libs/esdoc-api/ops/logs/supervisord.log

# CDF2CIM Web API
~/libs/esdoc-cdf2cim-ws/ops/logs/supervisord.log

# Errata Web API
~/libs/esdoc-errata-ws/ops/logs/supervisord.log

# PYESSV Web API
~/libs/pyessv-ws/ops/logs/supervisord.log

# Documentation URL Rewriter
~/rewriters/documentation/ops/logs/supervisord.log

# Further Info URL Rewriter
~/rewriters/further-info/ops/logs/supervisord.log

# Specializations URL Rewriter
~/rewriters/specializations/ops/logs/supervisord.log
```

### Opalstack Apps

Logs related to Opalstack applications (setup from the Opalstack dashboard) are written to the following directory:

```
~/logs/apps/{application-id}
```

For example:

```
~/logs/apps/prod_fe_technical_1
```

**NOTE** - These log directories are normally empty as the supervisor process controller typically intercepts logging events.

### Opalstack Sites

For each application mapped to an Opalstack site, HTTP access & HTTP error logs are written to the following directory:

```
~/logs/sites/{application-id}/access.txt
~/logs/sites/{application-id}/error.txt
```

For example:

```
~/logs/sites/prod_fe_technical_1/access.txt
~/logs/sites/prod_fe_technical_1/error.txt
```

## Environment Settings

3 types of file are used to assign environment specific settings.

```
- $HOME/.esdoc/environment
    - activates sub-shells to streamline server administration from command line

- $HOME/.esdoc/vars
    - sets environment specific variables 

- $HOME/.esdoc/credentials
    - sets credentials for connecting to external services - typically GitHub
```

## Backups

Configuration files & databases are backed upto the `~/backups` folder.  Opalstack automatically backs up all databases.

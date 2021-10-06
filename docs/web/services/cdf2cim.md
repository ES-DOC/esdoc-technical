# CDF2CIM Web Service

## Overview

The cdf2cim web-service exposes a set of endpoints for use by the [cdf2cim-client](https://github.com/ES-DOC/esdoc-cdf2cim).  In particular a data node administrator will use the cdf2cim-client to post JSON encoded climate simulation metadata extracted from scans of directories containing project specific NetCDF files.  

The cdf2cim-client maps each NetCDF file to a simplified JSON metadata file and calculates a unique identifier based upon a hash of it's contents.  If previously unpublished then the JSON metadata file is pushed to the cdf2cim web-service.  The web-service receives the incoming metadata and places it in the [cdf2cim-archive](https://github.com/ES-DOC/esdoc-cdf2cim-archive).

Once archived the cdf2cim metadata is indexed by the [cdf2cim-indexer](https://github.com/ES-DOC/esdoc-cdf2cim-indexer).  The indexer is essentially a distributed map reduce job the output of which is a set of CIM simulation documents.

## Endpoints

**https://cdf2cim.es-doc.org/1/verify**

    - HTTP GET
    - Verifies whether a metadata file has been received or not
    - param: `hashid` = identifier or a cdf2cim metadata  file

**https://cdf2cim.es-doc.org/1/verify-authorization**

    - HTTP GET
    - Verifies whether a GitHub user is authorized to publish
    - param: `login` = a GitHub username
    - param: `token` = a GitHub access token

**https://cdf2cim.es-doc.org/1/cmip5**

    - HTTP POST
    - CMIP5 cdf2cim metadata publishing
    - JSON payload is validated against a [json schema](https://github.com/ES-DOC/esdoc-cdf2cim-ws/blob/master/cdf2cim_ws/schemas/body/1.cmip5.json)

**https://cdf2cim.es-doc.org/1/cmip6**

    - HTTP POST
    - CMIP6 cdf2cim metadata publishing
    - JSON payload is validated against a [json schema](https://github.com/ES-DOC/esdoc-cdf2cim-ws/blob/master/cdf2cim_ws/schemas/body/1.cmip6.json)

# CDF2CIM Web Service

## Overview

The cdf2cim web-service exposes a set of endpoints for use by the [cdf2cim-client](https://github.com/ES-DOC/esdoc-cdf2cim).  In particular a data node administrator will use the cdf2cim-client to post JSON encoded climate simulation metadata extracted from scans of directories containing project specific NetCDF files.  

The cdf2cim-client maps each NetCDF file to a simplified JSON metadata file and calculates a unique identifier based upon a hash of it's contents.  If previously unpublished then the JSON metadata file is pushed to the cdf2cim web-service.  The web-service receives the incoming metadata and places it in the [cdf2cim-archive](https://github.com/ES-DOC/esdoc-cdf2cim-archive).

Once archived the cdf2cim metadata is indexed by the [cdf2cim-indexer](https://github.com/ES-DOC/esdoc-cdf2cim-indexer).  The indexer is essentially a distributed map reduce job the output of which is a set of CIM simulation documents.

## Endpoints

**https://cdf2cim.es-doc.org/1/cmip5**

    - HTTP POST
    - CMIP5 cdf2cim metadata publishing
    - JSON payload is validated against a [json schema](https://github.com/ES-DOC/esdoc-cdf2cim-ws/blob/master/cdf2cim_ws/schemas/body/1.cmip5.json)

**https://cdf2cim.es-doc.org/1/cmip6**

    - HTTP POST
    - CMIP6 cdf2cim metadata publishing
    - JSON payload is validated against a [json schema](https://github.com/ES-DOC/esdoc-cdf2cim-ws/blob/master/cdf2cim_ws/schemas/body/1.cmip6.json)

**https://cdf2cim.es-doc.org/1/verify**

    - HTTP GET
    - Verifies whether a metadata file has been received or not
    - param: `hashid` = identifier or a cdf2cim metadata  file

**https://cdf2cim.es-doc.org/1/verify-authorization**

    - HTTP GET
    - Verifies whether a GitHub user is authorized to publish
    - param: `login` = a GitHub username
    - param: `token` = a GitHub access token

## Authorisation

In order to use the cdf2cim web-service one must register GitHub user credentials with the ES-DOC support team - support@es-doc.org.


## Command Line Interface

The web-service supports a command line interface to streamline operations.

### Activation

Place the following in one's `~/.bashrc` file:

```
source INSTALL_DIR/sh/activate
```

### Installation

**cdf2cim-ws-install**

Installs & configures application.  Virtual environment is created using pipenv.  3 configuration files will be placed in `INSTALL_DIR/ops/config` sub-folder.

**cdf2cim-ws-update**

Updates application code & associated virtual environment. 

### Process Control

**cdf2cim-ws**

Runs application in classic mode.

**cdf2cim-ws-daemon**

Runs application in daemon mode.  The daemonised process is managed by supervisord.

**cdf2cim-ws-daemon-reload**

Reloads application whilst in daemon mode.  This will apply any configuration changes.

**cdf2cim-ws-daemon-status**

Emits to stdout application process status.

**cdf2cim-ws-daemon-stop**

Stops application whilst in daemon mode. 

**cdf2cim-ws-reset-logs**

Resets application logs - found in `INSTALL_DIR/ops/logs`. 

## Virtual Environment

### Pre-requisite

It is assumed that the machine upon which the application will run has `pyenv` pre-installed.  

### Setup

```
cd INSTALL_DIR
pyenv local 3.9.0
pip3 install --upgrade pip
pip3 install --upgrade pipenv
pipenv shell
pip install -r ./requirements.txt
```

## Configuration

Once installed the following files will be in the `INSTALL_DIR/ops/config` folder:

### Files

**supervisor.conf** 

    - configures daemon process
    - no need to touch generally speaking

**ws.conf** 

    - configures application process
    - mode & port are primary settings

### Example

**ws.conf** 

```
{
    "cookie_secret": "p2FAdRUN3DSc",
    "host": "localhost",
    "apply_security_policy": true,
    "mode": "dev",
    "port": 5003
}
```

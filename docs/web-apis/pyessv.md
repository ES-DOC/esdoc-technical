# PYESSV Web Service API

## Overview

The pyessv web-service exposes a set of endpoints for exposing controlled vocabularies to upstream tools & applications.  It runs over the top of an in-momory cached instance of the pyessv-archive.  It serves vocabularies in JSON format on demand.

## Pre-requisites

1.  The [pyessv-archive](https://github.com/ES-DOC/pyessv-archive) repository has been installed upon the machine.

2.  The **PYESSV_ARCHIVE_HOME** environment variable has been set.

3.  The [pyenv](https://github.com/pyenv/pyenv) library has been installed upon the machine.  

## Endpoints

**https://pyessv.es-doc.org**

    - HTTP GET
    - Returns web-service operational status

**https://pyessv.es-doc.org/1/retrieve/{authority}/{scope}/{collection}/{term}**

    - HTTP GET
    - Returns a vocabulary term or set of terms
    - valid authority = copernicus | ecmwf | esdoc | wcrp

**https://pyessv.es-doc.org/1/validate-identifier**

    - HTTP GET
    - Validates an identifier against archived vocabularies
    - param `identifier` = identifier to be validated
    - param `identifierType` = type iof identifier to be validated
    - param `project` = project code

**https://pyessv.es-doc.org/1/validate-identifier-set**

    - HTTP POST
    - Validates a set of identifiers against archived vocabularies
    - param `identifier` = identifier to be validated
    - param `identifierType` = type iof identifier to be validated
    - param `project` = project code

## Command Line Interface

The web-service supports a command line interface to streamline operations.

### Activation

Place the following in one's `~/.bashrc` file:

```
source INSTALL_DIR/sh/activate
```

### Installation

**pyessv-ws-install**

Installs & configures application.  Virtual environment is created using pipenv.  3 configuration files will be placed in `INSTALL_DIR/ops/config` sub-folder.

**pyessv-ws-update**

Updates application code & associated virtual environment. 

### Process Control

**pyessv-ws**

Runs application in classic mode.

**pyessv-ws-daemon**

Runs application in daemon mode.  The daemonised process is managed by supervisord.

**pyessv-ws-daemon-reload**

Reloads application whilst in daemon mode.  This will apply any configuration changes.

**pyessv-ws-daemon-status**

Emits to stdout application process status.

**pyessv-ws-daemon-stop**

Stops application whilst in daemon mode. 

**pyessv-ws-reset-logs**

Resets application logs - found in `INSTALL_DIR/ops/logs`. 

## Virtual Environment

To setup: 

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

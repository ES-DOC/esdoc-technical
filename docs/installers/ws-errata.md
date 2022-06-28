# Errata Web API Installer

## Overview

The **ERRATA** web API can be installed upon a machines in standalone mode.  The installation process is in several steps:

- Step 1: install system dependencies
- Step 2: install pyenv
- Step 3: install python
- Step 4: install stack
- Step 5: install virtual environment
- Step 6: install database

Once the above steps have executed then the **ERRATA** web API daemon can be launched: 

```
errata-ws-daemon
```

## Side Effects

Once installed the web API files will be written to the file system as follows:

```
# Cloned repos.
/opt/errata-fe
/opt/errata-ws
/opt/pyessv-archive

# Environment + Credentials.
/.esdoc/credentials
/.esdoc/environment
```

## Supported installers

- [ubuntu 20.04](https://github.com/ES-DOC/devops/blob/main/setups/ubuntu/errata/workflow.md)

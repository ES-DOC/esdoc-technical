# PYESSV Web API Installer

## Overview

The **PYESSV** web API can be installed upon a machine in standalone mode.  The installation process is in several steps:

- Step 1: install system dependencies
- Step 2: install pyenv
- Step 3: install python
- Step 4: install stack
- Step 5: install virtual environment

Once the above steps have executed then the **PYESSV** web API daemon can be launched: 

```
pyessv-ws-daemon
```

## Side Effects

Once installed the web API files will be written to the file system as follows:

```
# Cloned repos.
/opt/pyessv
/opt/pyessv-archive
/opt/pyessv-js
/opt/pyessv-writers
/opt/pyessv-ws

# Environment + Credentials.
/.esdoc/credentials
/.esdoc/environment
```

## Supported installers

- [ubuntu 20.04](https://github.com/ES-DOC/devops/blob/main/installers/ubuntu/pyessv/workflow.md)

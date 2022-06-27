# Errata Service Deployment

## Overview

The **ERRATA** service can be installed upon a machines in standalone mode.  The installation process is in several steps:

- Step 1: install system dependencies
- Step 2: install pyenv
- Step 3: install python
- Step 4: install stack
- Step 5: install virtual environment
- Step 6: install database

Once the above steps have executed then the **ERRATA** web-service daemon can be launched: 

```
errata-ws-daemon
```

## Supported installers

- [ubuntu 20.04](https://github.com/ES-DOC/devops/blob/main/setups/ubuntu/errata/workflow.md)

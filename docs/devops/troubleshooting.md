# Server Troubleshooting

## Overview

The ES-DOC servers periodically require troubleshooting to resolve deployment issues.  The source of such issues is typically the result of side-effects caused by:

- Opalstack systems maintenance

- operator failures

- service failures

This document details some of the most common troubleshooting scenarios.  In the sections below it is assumed that one has already connected via ssh to the target machine.

## Process States

Most issues are related to daemonised processes having been switched off for some reason or other.  The following comands can be used to determine the status of each daemon process.

```
# Documentation Web API
esdoc-ws-daemon-status

# CDF2CIM Web API
cdf2cim-ws-daemon-status

# Errata Web API
errata-ws-daemon-status

# PYESSV Web API
pyessv-ws-daemon-status

# Documentation URL Rewriter
. ~/rewriters/documentation/sh/activate
rewriter-ws-daemon-status

# Further Info URL Rewriter
. ~/rewriters/further-info/sh/activate
rewriter-ws-daemon-status

# Specializations URL Rewriter
. ~/rewriters/specializations/sh/activate
rewriter-ws-daemon-status
```

## Process Reloading

To reload daemonised process the following set of commands may be executed:

```
# Documentation Web API
esdoc-ws-daemon-reload

# CDF2CIM Web API
cdf2cim-ws-daemon-reload

# Errata Web API
errata-ws-daemon-reload

# PYESSV Web API
pyessv-ws-daemon-reload

# Documentation URL Rewriter
. ~/rewriters/documentation/sh/activate
rewriter-ws-daemon-reload

# Further Info URL Rewriter
. ~/rewriters/further-info/sh/activate
rewriter-ws-daemon-reload

# Specializations URL Rewriter
. ~/rewriters/specializations/sh/activate
rewriter-ws-daemon-reload
```

### Reload Priority 

It is recommended to reload the pyessv web API first as other services depend upon it.

### Socket File Error

The reload commands will start the services even if they are not presently running - in this case one will see the following type of message (they can be **ignored**):

```
ERROR: unix:////esdoc/libs/pyessv-ws/ops/daemon/supervisord.sock no such file (already shut down?)
```

## Process Config Files

Each of the operational services has an `ops/config` subfolder within which service specific configuration files are found.  It is recommended to review the configuration settings in the case of persistent issues:

```
# Documentation Web API
vi ~/libs/esdoc-api/ops/config/pyesdoc.conf
vi ~/libs/esdoc-api/ops/config/supervisord.conf
vi ~/libs/esdoc-api/ops/config/ws.conf

# CDF2CIM Web API
vi ~/libs/esdoc-cdf2cim-ws/ops/config/supervisord.conf
vi ~/libs/esdoc-cdf2cim-ws/ops/config/ws.conf

# Errata Web API
vi ~/libs/esdoc-errata-ws/ops/config/supervisord.conf
vi ~/libs/esdoc-errata-ws/ops/config/ws.conf

# PYESSV Web API
vi ~/libs/pyessv-ws/ops/config/supervisord.conf
vi ~/libs/pyessv-ws/ops/config/ws.conf

# Documentation URL Rewriter
vi ~/rewriters/documentation/ops/config/ws.conf
vi ~/rewriters/documentation/ops/config/supervisord.conf

# Further Info URL Rewriter
vi ~/rewriters/further-info/ops/config/ws.conf
vi ~/rewriters/further-info/ops/config/supervisord.conf

# Specializations URL Rewriter
vi ~/rewriters/specializations/ops/config/ws.conf
vi ~/rewriters/specializations/ops/config/supervisord.conf
```

NOTE: it is highly unlikely that the `supervisord.conf` files will require editing but if so they have been listed above for completeness purposes.

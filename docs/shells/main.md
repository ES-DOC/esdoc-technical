# ES-DOC Main CLI Application

## Overview

A developer wishing to work upon the entire ES-DOC stack needs to install & configure assets hosted in multiple GitHub repos.  To streamline this process a CLI application one can instead install the global ES-DOC shell.  Once installed it will assist the developer in quickly configuring their environment.

## Setup

The installer downloads the entire ES-DOC stack.  Once downloaded one can proceed to setup the tools / services of interest.

```
cd YOUR_WORKING_DIRECTORY
git clone https://github.com/ES-DOC/esdoc-shell.git ./esdoc
source esdoc/activate
esdoc-stack-install
```

Once installed it is recommended to add the following to your ~/.bashrc file:

```
source YOUR_WORKING_DIRECTORY/esdoc/activate
```

## Stack Updating

The updater syncs the entire ES-DOC stack against latest code hosted in GitHub.

```
esdoc-stack-update
```

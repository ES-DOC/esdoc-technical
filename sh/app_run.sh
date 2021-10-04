#!/bin/bash

# Import utils.
source $ESDOC_TECH_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "running ... @ $ESDOC_TECH_DEV_ADDR from $ESDOC_TECH_HOME"

    pushd $ESDOC_TECH_HOME
    mkdocs serve
    popd
}

# Invoke entry point.
main

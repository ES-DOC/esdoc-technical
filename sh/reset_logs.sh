#!/bin/bash

# Import utils.
source $ESDOC_TECH_HOME/sh/utils.sh

# Main entry point.
main()
{
	rm $ESDOC_TECH_HOME/ops/logs/*.log

	log "logs reset"
}

# Invoke entry point.
main

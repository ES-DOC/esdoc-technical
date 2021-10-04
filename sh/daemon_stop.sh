#!/bin/bash

# Import utils.
source $ESDOC_TECH_HOME/sh/utils.sh

# Main entry point.
main()
{
	pushd $ESDOC_TECH_HOME
	supervisorctl -c $ESDOC_TECH_HOME/ops/supervisord.conf stop all
	supervisorctl -c $ESDOC_TECH_HOME/ops/supervisord.conf shutdown
	popd

	log "killed tech-docs daemon"
}

# Invoke entry point.
main

#!/bin/bash

# Import utils.
source $ESDOC_TECH_HOME/sh/utils.sh

# Main entry point.
main()
{
	pushd $ESDOC_TECH_HOME

	source $ESDOC_TECH_HOME/sh/reset_logs.sh
	supervisord -c $ESDOC_TECH_HOME/ops/supervisord.conf
	log "initialized tech-docs daemon"

	sleep 3.0
	source $ESDOC_TECH_HOME/sh/daemon_status.sh

	popd
}

# Invoke entry point.
main

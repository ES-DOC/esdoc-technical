#!/bin/bash

# Import utils.
source $ESDOC_TECH_HOME/sh/utils.sh

# Main entry point.
main()
{
	pushd $ESDOC_TECH_HOME
	supervisorctl -c $ESDOC_TECH_HOME/ops/supervisord.conf status all
	popd
}

# Invoke entry point.
main

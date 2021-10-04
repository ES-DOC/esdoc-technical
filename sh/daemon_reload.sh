#!/bin/bash

# Import utils.
source $ESDOC_TECH_HOME/sh/utils.sh

# Main entry point.
main()
{
	source $ESDOC_TECH_HOME/sh/daemon_stop.sh
	source $ESDOC_TECH_HOME/sh/daemon_start.sh
}

# Invoke entry point.
main

#!/bin/bash

# Import utils.
source $CDF2CIM_WS_HOME/sh/utils.sh

# Main entry point.
main()
{
	source $CDF2CIM_WS_HOME/sh/daemon_stop.sh
	source $CDF2CIM_WS_HOME/sh/daemon_start.sh
}

# Invoke entry point.
main

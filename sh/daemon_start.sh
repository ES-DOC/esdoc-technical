#!/bin/bash

# Import utils.
source $CDF2CIM_WS_HOME/sh/utils.sh

# Main entry point.
main()
{
	pushd $CDF2CIM_WS_HOME

	source $CDF2CIM_WS_HOME/sh/reset_logs.sh
	supervisord -c $CDF2CIM_WS_HOME/ops/config/supervisord.conf
	log "initialized web-service daemon"

	sleep 3.0
	source $CDF2CIM_WS_HOME/sh/daemon_status.sh

	popd
}

# Invoke entry point.
main

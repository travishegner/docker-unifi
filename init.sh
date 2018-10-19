#!/bin/bash

set -e

trap graceful_stop SIGHUP SIGINT SIGTERM

function graceful_stop {
	service unifi stop
	pkill tail
	echo "tetelestai"
}

service unifi start

tail -F /var/log/unifi/server.log &
pid=$!

wait "$pid"

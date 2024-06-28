#!/bin/sh
set -eu

service lsmcd start
exec tail -f /tmp/lsmcd.log
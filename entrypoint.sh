#!/bin/sh
set -eu

/usr/local/lsmcd/bin/lsmcdctrl start
exec tail -f /tmp/lsmcd.log
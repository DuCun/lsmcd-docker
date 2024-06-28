#!/bin/sh
set -eu

systemctl start lsmcd
exec tail -f /tmp/lsmcd.log
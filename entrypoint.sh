#!/bin/sh
set -eu

systemctl start lsmcd.service
exec tail -f /tmp/lsmcd.log
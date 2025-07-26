#!/bin/sh
set -e

CONF="/var/lib/postgresql/data/postgresql.conf"

# Append extension to preload libraries if not present
if grep -q "shared_preload_libraries" "$CONF"; then
  sed -i "s/shared_preload_libraries *= *'\([^']*\)'/shared_preload_libraries = '\1,pg_idkit'/" "$CONF"
else
  echo "shared_preload_libraries = 'pg_idkit'" >> "$CONF"
fi

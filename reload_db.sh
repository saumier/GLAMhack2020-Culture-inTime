#!/bin/sh
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U saumier -d culture-intime_development latest.dump


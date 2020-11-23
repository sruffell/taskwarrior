#!/bin/sh
set -xe

/bin/pwd
TASKW_BUILD_JOB_COUNT=$(grep -c '^processor' /proc/cpuinfo)
cp -ru /source/. .
git clean -fdx .

cmake -DCMAKE_BUILD_TYPE=Debug .
make -j${TASKW_BUILD_JOB_COUNT}
make -j${TASKW_BUILD_JOB_COUNT} -C test
make test

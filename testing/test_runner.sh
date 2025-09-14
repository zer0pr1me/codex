#!/bin/sh
TEST_ROOT=$1
CC=${CC:-cc}
TESTS=`find $TEST_ROOT/ -type f -name "test_*.h"`
INCLUDE=./
SCRIPT_PATH="$(readlink -f "$0")"
CURRENT_DIR="$(dirname $SCRIPT_PATH)"
TEST_RUNNER="$CURRENT_DIR/test_runner.c"

for TEST in "$TESTS"; do
  $CC $CFLAGS -DSUITE_HEADER=\"$TEST\" -DSUITE_SYMBOL=test_suite -o test.bin $TEST_RUNNER -I $INCLUDE
  ./test.bin
  if [ $? -ne 0 ]; then
    exit 1
  fi
done

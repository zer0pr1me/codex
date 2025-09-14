#!/bin/sh

# for includes
ln -s . codex 

testing/test_runner.sh tests
test_result=$?

unlink codex

exit $test_result

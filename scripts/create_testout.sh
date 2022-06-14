#!/bin/bash

echo "Creating test output..."
echo 

BASEDIR=..
EXECUTABLE=$BASEDIR/$1/build/$1

for TEST_IN in $BASEDIR/$1/tests/*.test;
do
  echo "$TEST_IN"
  (./$EXECUTABLE < $TEST_IN) > "$TEST_IN.output"
done

exit 0

#!/bin/bash

echo "Running tests..."
echo 

FAIL=0
BASEDIR=..
EXECUTABLE=$BASEDIR/$1/build/$1


for TEST_IN in $BASEDIR/$1/tests/*.test;
do
  # create tempory file for outputs
  TMPFILE=$(mktemp)
  (./$EXECUTABLE < $TEST_IN) > "$TMPFILE"

  # compare outputs with predefined outputs
  output=$(diff --strip-trailing-cr $TMPFILE  $TEST_IN.output)

  if [ "$output" == "" ] ; then
    echo "Passed: $TEST_IN is correct"
  else
    echo "FAILED: $TEST_IN - $output"
    FAIL=1
  fi

  rm $TMPFILE
done

if [ $FAIL -eq 1 ] ; then
  exit 1
fi


echo
echo "All tests passed."

exit 0

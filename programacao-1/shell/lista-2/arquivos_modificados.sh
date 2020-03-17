#!/bin/bash

pushd ~
	VAR=$( find -mtime -1 )
	echo "${VAR}"
popd

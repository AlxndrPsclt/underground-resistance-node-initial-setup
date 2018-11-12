#!/usr/bin/env bash

for ITER in 0..10
do
	echo "Testing if RPIs are up"
	echo "Iter $ITER"
	ansible -i inventory.yml -m ping
	sleep 15
done

#!/bin/bash

for id in $(pgrep $1); do
    kill -9 $id
done


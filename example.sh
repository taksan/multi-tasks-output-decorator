#!/usr/bin/env bash

source task-decorator.sh

(
    task "important stuff"
    echo "some stuff"
    echo "more stuff"
    sleep 2
) &    

(
    task "parallel stuff" with_timestamp
    echo "this runs in parallel"
    sleep 1
    echo "more parallel stuf"
) &    

wait

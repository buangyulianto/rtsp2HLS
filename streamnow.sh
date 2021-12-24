#!/bin/bash
for Script in stream/*.sh ; do
    bash "$Script" &
done

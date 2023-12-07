#!/bin/bash

echo "================= Start config the condarc... ================="

cp src/condarc $HOME/.condarc

mkdir -p $HOME/.pip
cp src/pip.conf $HOME/.pip/pip.conf

echo "Done."

#!/bin/bash

model=${1}
port=${2:-8012}
python3 -m fmpy.webapp $1.fmu --port 8012

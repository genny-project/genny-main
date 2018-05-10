#!/bin/bash
customercode=${1}
./run-setup.sh -p ${customercode} -r ${customercode} -n 10.123.123.123 up

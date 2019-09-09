#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sun Sep 08 17:06:50 PDT 2019
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto cdf8691d879a421dbf8400c0080e5f3e --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot factorial_tb_behav xil_defaultlib.factorial_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto cdf8691d879a421dbf8400c0080e5f3e --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot factorial_tb_behav xil_defaultlib.factorial_tb xil_defaultlib.glbl -log elaborate.log

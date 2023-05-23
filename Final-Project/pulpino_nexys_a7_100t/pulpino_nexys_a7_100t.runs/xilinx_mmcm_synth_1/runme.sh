#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vivado/2019.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2019.2/bin
else
  PATH=/tools/Xilinx/Vivado/2019.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2019.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/student_22/Documents/final_project/pulpino_students/pulpino_nexys_a7_100t/pulpino_nexys_a7_100t.runs/xilinx_mmcm_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log xilinx_mmcm.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source xilinx_mmcm.tcl

# Create project to check schematic
create_project project_sgdh_schematic ./project_sgdh_schematic -part xc7z020clg400-1
# Add files
read_verilog [ glob ./design/*.v ]
read_verilog [ glob ./testbench/*.v ]
#read_verilog -library bftLib [ glob ./include/*.vh ]
# RTL Analysis (Schematic)
set_property top testbench [current_fileset]
synth_design -rtl -rtl_skip_mlo -name rtl_1

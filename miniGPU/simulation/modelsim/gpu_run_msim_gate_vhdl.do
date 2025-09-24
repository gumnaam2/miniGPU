transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {gpu.vho}

do "C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/sim_src/core_sim_2.tcl"

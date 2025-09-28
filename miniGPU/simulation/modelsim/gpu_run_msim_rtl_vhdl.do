transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/types_pkg.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/thread_struct.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/rf.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/pc_nzp.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/lsu.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/fetcher.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/decoder.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/alu.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/scheduler.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/dcr.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/core.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/prog_mem_rom.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/data_mem_ram.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/mem_controller_2.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/mem_with_controller.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/dispatcher_2.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/gpu_dut.vhd}

do "C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/sim_src/gpu_sim.tcl"

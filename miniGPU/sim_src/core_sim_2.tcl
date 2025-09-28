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
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/core.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/prog_mem_rom.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/data_mem_ram.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/mem_controller_2.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/mem_with_controller.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/core_RAM_dut.vhd}

vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/src/core.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/data_mem_ram.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/prog_mem_rom.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/core_RAM_dut.vhd}
vcom -2008 -work work {C:/Users/Siddhant Kaul/Desktop/college/SoC/miniGPU/miniGPU/mem_sim/core_sim_2.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  core_sim_2

#add wave *
#add wave -position insertpoint sim:/core_sim_2/dut_inst/core/threads(1)/thread/lsu_block/*
#add wave -position insertpoint sim:/core_sim_2/dut_inst/core/fetcher_block/*
#add wave -position insertpoint sim:/core_sim_2/dut_inst/ram/*
#add wave -position insertpoint sim:/core_sim_2/dut_inst/progmem/*

#
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/consumer_ids
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/next_consumer_ids
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/consumer_wens
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/next_wens
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/completed_requests
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/completed_wen
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/consumer_read_addr
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/consumer_read_req
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/consumer_write_req
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/mem_read_addr
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/mem_read_data
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/consumer_read_done
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/n_filled_reg
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/n_completed
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/progmem/cont/clock
#
#
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_ids
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/next_consumer_ids
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_wens
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/next_wens
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/completed_requests
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/completed_wen
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_read_addr
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_write_addr
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_write_data
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_read_req
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_write_req
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/mem_read_addr
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/mem_read_data
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/mem_write_addr
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/mem_write_data
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/mem_write_en
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/consumer_read_done
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/n_filled_reg
#add wave -position insertpoint  \
#sim:/core_sim_2/dut_inst/ram/cont/clock

add wave -position insertpoint sim:/core_sim_2/dut_inst/progmem/cont/*
add wave -position insertpoint sim:/core_sim_2/dut_inst/progmem/cont/read_requests/consumer_req_stored
add wave -position insertpoint sim:/core_sim_2/dut_inst/progmem/cont/read_requests/n_filled
add wave -position insertpoint sim:/core_sim_2/dut_inst/ram/cont/*

#add wave -position insertpoint sim:/core_sim_2/dut_inst/ram/cont/read_requests/*
#add wave -position insertpoint sim:/core_sim_2/dut_inst/ram/cont/handle_channel/*

#view structure
#view signals
run -all

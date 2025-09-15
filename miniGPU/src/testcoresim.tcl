#namespace eval::core_sim{
vcom core.vhd;
vcom core_sim.vhd;
vsim core_sim;
wave add *;
run 100 ns;
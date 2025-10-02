create_clock -name {clk} -period 100 -waveform { 0.000 10.000 } [get_ports {clock}]
derive_clock_uncertainty
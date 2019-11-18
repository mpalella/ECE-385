transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/vga_clk.v}
vlog -vlog01compat -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/audio_interface_plat.v}
vlog -vlog01compat -work work +incdir+C:/ECE_385/FinalProject/db {C:/ECE_385/FinalProject/db/vga_clk_altpll.v}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/Synchronizers.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/HexDriver.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/Final_Project_top.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/KeyMapper.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/controller.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/sample_freq_counter.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/wavetable_synthesizer.sv}
vcom -93 -work work {C:/ECE_385/FinalProject/audio_interface.vhd}
vlib nios_system
vmap nios_system nios_system

vlog -sv -work work +incdir+C:/ECE_385/FinalProject {C:/ECE_385/FinalProject/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L nios_system -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all

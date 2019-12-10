transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/reg_16.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/Address_Incrementer.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/SamplerKeymapper.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/noteCounter.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/incrementControl.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/samplerAddressControl.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/MUX4.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/MultinoteController.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/addressAdder.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/NoteProducer.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/reg_20.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/SamplerKeymapper_drum.sv}
vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/MUX4_1bit.sv}
vlib nios_system
vmap nios_system nios_system

vlog -sv -work work +incdir+C:/ECE_385/FinalProject_synth_sampler {C:/ECE_385/FinalProject_synth_sampler/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L nios_system -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all

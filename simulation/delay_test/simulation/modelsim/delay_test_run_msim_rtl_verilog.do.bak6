transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/delay.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/simulation/delay_test {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/simulation/delay_test/line_buffer_test.v}

vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/simulation/delay_test {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/simulation/delay_test/delay_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  delay_tb

add wave *
view structure
view signals
run -all

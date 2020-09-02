transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/coeff_1.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/square.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/mult.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/gaussian_function.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/coeff_3.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/coeff_2.v}

vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/simulation/componentstest/../.. {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/Demonstration/DE2_CAMERA/simulation/componentstest/../../gaussian_function_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  gaussian_function_tb

add wave *
view structure
view signals
run -all

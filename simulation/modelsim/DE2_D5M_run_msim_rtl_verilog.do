transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/RGB_2_YCbCr.v}
vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/top.v}
vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/sort.v}
vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/sobel.v}
vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/median_filter.v}
vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/linebuffer.v}
vlog -vlog01compat -work work +incdir+D:/altera/FPGAproject/medianfilter {D:/altera/FPGAproject/medianfilter/bufferr.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port/Sdram_FIFO.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/CCD_Capture.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/I2C_CCD_Config.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/I2C_Controller.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/Line_Buffer.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/RAW2RGB.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/Reset_Delay.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/sdram_pll.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/SEG7_LUT.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/SEG7_LUT_8.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/DE2_D5M.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/square.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/mult.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/gaussian_function.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/exp_LUT.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/delay.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/buffer_final.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/algorithm.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/coeff_1.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/coeff_2.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/coeff_3.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port/command.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port/control_interface.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port/sdr_data_path.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/Sdram_Control_4Port/Sdram_Control_4Port.v}
vlog -vlog01compat -work work +incdir+D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V {D:/360MoveData/Users/Administrator/Desktop/TRDB-D5M_v.1.2.4_SystemCD/our_project/V/VGA_Controller.v}


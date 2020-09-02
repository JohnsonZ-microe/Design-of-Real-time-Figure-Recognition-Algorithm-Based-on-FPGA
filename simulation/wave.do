onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /imgtest_tb/clk
add wave -noupdate /imgtest_tb/reset_1
add wave -noupdate /imgtest_tb/src_cel
add wave -noupdate /imgtest_tb/dv_clk
add wave -noupdate /imgtest_tb/dvsyn
add wave -noupdate /imgtest_tb/dhsyn
add wave -noupdate /imgtest_tb/dvd
add wave -noupdate /imgtest_tb/src_sel
add wave -noupdate /imgtest_tb/img_src_ins/reset_1
add wave -noupdate /imgtest_tb/img_src_ins/clk
add wave -noupdate /imgtest_tb/img_src_ins/src_sel
add wave -noupdate /imgtest_tb/img_src_ins/test_vsync
add wave -noupdate /imgtest_tb/img_src_ins/test_dvalid
add wave -noupdate /imgtest_tb/img_src_ins/clk_out
add wave -noupdate /imgtest_tb/img_src_ins/test_data
add wave -noupdate /imgtest_tb/img_src_ins/test_data_reg
add wave -noupdate /imgtest_tb/img_src_ins/test_vsync_temp
add wave -noupdate /imgtest_tb/img_src_ins/test_dvalid_tmp
add wave -noupdate /imgtest_tb/img_src_ins/test_dvalid_r
add wave -noupdate -radix unsigned /imgtest_tb/img_src_ins/h_cnt
add wave -noupdate -radix unsigned /imgtest_tb/img_src_ins/v_cnt
add wave -noupdate /imgtest_tb/img_src_ins/fp_r
add wave -noupdate /imgtest_tb/img_src_ins/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {248256159 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {672046976 ns}

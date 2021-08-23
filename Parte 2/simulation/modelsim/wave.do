onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Yellow -radix decimal /parte2/clock
add wave -noupdate -radix decimal /parte2/wren
add wave -noupdate -color Cyan -radix unsigned /parte2/address
add wave -noupdate -color Red -radix unsigned /parte2/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {377 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 50ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/parte2/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/parte2/wren 
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 50ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 1000ps sim:/parte2/address 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore

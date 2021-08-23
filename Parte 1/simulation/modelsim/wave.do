onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Medium Slate Blue} /parte1/clock
add wave -noupdate -color Cyan -radix unsigned -childformat {{{/parte1/address[4]} -radix unsigned} {{/parte1/address[3]} -radix unsigned} {{/parte1/address[2]} -radix unsigned} {{/parte1/address[1]} -radix unsigned} {{/parte1/address[0]} -radix unsigned}} -subitemconfig {{/parte1/address[4]} {-color Cyan -radix unsigned} {/parte1/address[3]} {-color Cyan -radix unsigned} {/parte1/address[2]} {-color Cyan -radix unsigned} {/parte1/address[1]} {-color Cyan -radix unsigned} {/parte1/address[0]} {-color Cyan -radix unsigned}} /parte1/address
add wave -noupdate -color Yellow -radix unsigned -childformat {{{/parte1/data[7]} -radix unsigned} {{/parte1/data[6]} -radix unsigned} {{/parte1/data[5]} -radix unsigned} {{/parte1/data[4]} -radix unsigned} {{/parte1/data[3]} -radix unsigned} {{/parte1/data[2]} -radix unsigned} {{/parte1/data[1]} -radix unsigned} {{/parte1/data[0]} -radix unsigned}} -subitemconfig {{/parte1/data[7]} {-color Yellow -radix unsigned} {/parte1/data[6]} {-color Yellow -radix unsigned} {/parte1/data[5]} {-color Yellow -radix unsigned} {/parte1/data[4]} {-color Yellow -radix unsigned} {/parte1/data[3]} {-color Yellow -radix unsigned} {/parte1/data[2]} {-color Yellow -radix unsigned} {/parte1/data[1]} {-color Yellow -radix unsigned} {/parte1/data[0]} {-color Yellow -radix unsigned}} /parte1/data
add wave -noupdate -color Green -radix decimal /parte1/wren
add wave -noupdate -color White -radix unsigned -childformat {{{/parte1/q[7]} -radix unsigned} {{/parte1/q[6]} -radix unsigned} {{/parte1/q[5]} -radix unsigned} {{/parte1/q[4]} -radix unsigned} {{/parte1/q[3]} -radix unsigned} {{/parte1/q[2]} -radix unsigned} {{/parte1/q[1]} -radix unsigned} {{/parte1/q[0]} -radix unsigned}} -subitemconfig {{/parte1/q[7]} {-color White -radix unsigned} {/parte1/q[6]} {-color White -radix unsigned} {/parte1/q[5]} {-color White -radix unsigned} {/parte1/q[4]} {-color White -radix unsigned} {/parte1/q[3]} {-color White -radix unsigned} {/parte1/q[2]} {-color White -radix unsigned} {/parte1/q[1]} {-color White -radix unsigned} {/parte1/q[0]} {-color White -radix unsigned}} /parte1/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {275 ps} 0}
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
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/parte1/clock 
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 00111 -type Range -direction Up -period 50ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 1000ps sim:/parte1/address 
wave create -driver freeze -pattern repeater -initialvalue 00000011 -period 50ps -sequence { 00001000  } -repeat forever -range 7 0 -starttime 0ps -endtime 1000ps sim:/parte1/data 
wave create -driver freeze -pattern repeater -initialvalue 1 -period 50ps -sequence { 1 0 0 0 0  } -repeat never -starttime 0ps -endtime 1000ps sim:/parte1/wren 
WaveCollapseAll -1
wave clipboard restore

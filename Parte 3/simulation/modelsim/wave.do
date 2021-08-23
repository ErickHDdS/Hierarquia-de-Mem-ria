onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Input
add wave -noupdate -color Yellow -radix unsigned /parte3/cache/clock
add wave -noupdate -color {Orange Red} -radix unsigned /parte3/cache/wren
add wave -noupdate -color Cyan -radix unsigned -childformat {{{/parte3/cache/data[7]} -radix unsigned} {{/parte3/cache/data[6]} -radix unsigned} {{/parte3/cache/data[5]} -radix unsigned} {{/parte3/cache/data[4]} -radix unsigned} {{/parte3/cache/data[3]} -radix unsigned} {{/parte3/cache/data[2]} -radix unsigned} {{/parte3/cache/data[1]} -radix unsigned} {{/parte3/cache/data[0]} -radix unsigned}} -subitemconfig {{/parte3/cache/data[7]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[6]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[5]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[4]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[3]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[2]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[1]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/data[0]} {-color Cyan -height 15 -radix unsigned}} /parte3/cache/data
add wave -noupdate -color Magenta -radix unsigned -childformat {{{/parte3/cache/tag[4]} -radix unsigned} {{/parte3/cache/tag[3]} -radix unsigned} {{/parte3/cache/tag[2]} -radix unsigned} {{/parte3/cache/tag[1]} -radix unsigned} {{/parte3/cache/tag[0]} -radix unsigned}} -subitemconfig {{/parte3/cache/tag[4]} {-color Magenta -height 15 -radix unsigned} {/parte3/cache/tag[3]} {-color Magenta -height 15 -radix unsigned} {/parte3/cache/tag[2]} {-color Magenta -height 15 -radix unsigned} {/parte3/cache/tag[1]} {-color Magenta -height 15 -radix unsigned} {/parte3/cache/tag[0]} {-color Magenta -height 15 -radix unsigned}} /parte3/cache/tag
add wave -noupdate -divider {Dados de verificação}
add wave -noupdate -radix unsigned /parte3/cache/clock_RAM
add wave -noupdate -radix unsigned /parte3/cache/wren_RAM
add wave -noupdate -radix unsigned /parte3/cache/address_RAM
add wave -noupdate -radix unsigned /parte3/cache/data_RAM
add wave -noupdate /parte3/cache/posicao
add wave -noupdate /parte3/cache/antigoMaior
add wave -noupdate /parte3/cache/HitMiss
add wave -noupdate -divider Cache
add wave -noupdate -color Cyan -radix unsigned -childformat {{{/parte3/cache/cache[0]} -radix unsigned} {{/parte3/cache/cache[1]} -radix unsigned} {{/parte3/cache/cache[2]} -radix unsigned} {{/parte3/cache/cache[3]} -radix unsigned}} -subitemconfig {{/parte3/cache/cache[0]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/cache[1]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/cache[2]} {-color Cyan -height 15 -radix unsigned} {/parte3/cache/cache[3]} {-color Cyan -height 15 -radix unsigned}} /parte3/cache/cache
add wave -noupdate -color White -radix unsigned -childformat {{{/parte3/cache/valido[0]} -radix unsigned} {{/parte3/cache/valido[1]} -radix unsigned} {{/parte3/cache/valido[2]} -radix unsigned} {{/parte3/cache/valido[3]} -radix unsigned}} -expand -subitemconfig {{/parte3/cache/valido[0]} {-color White -height 15 -radix unsigned} {/parte3/cache/valido[1]} {-color White -height 15 -radix unsigned} {/parte3/cache/valido[2]} {-color White -height 15 -radix unsigned} {/parte3/cache/valido[3]} {-color White -height 15 -radix unsigned}} /parte3/cache/valido
add wave -noupdate -color Red -radix unsigned -childformat {{{/parte3/cache/dirty[0]} -radix unsigned} {{/parte3/cache/dirty[1]} -radix unsigned} {{/parte3/cache/dirty[2]} -radix unsigned} {{/parte3/cache/dirty[3]} -radix unsigned}} -expand -subitemconfig {{/parte3/cache/dirty[0]} {-color Red -height 15 -radix unsigned} {/parte3/cache/dirty[1]} {-color Red -height 15 -radix unsigned} {/parte3/cache/dirty[2]} {-color Red -height 15 -radix unsigned} {/parte3/cache/dirty[3]} {-color Red -height 15 -radix unsigned}} /parte3/cache/dirty
add wave -noupdate -color Yellow -radix unsigned -childformat {{{/parte3/cache/LRU[0]} -radix unsigned} {{/parte3/cache/LRU[1]} -radix unsigned} {{/parte3/cache/LRU[2]} -radix unsigned} {{/parte3/cache/LRU[3]} -radix unsigned}} -subitemconfig {{/parte3/cache/LRU[0]} {-color Yellow -height 15 -radix unsigned} {/parte3/cache/LRU[1]} {-color Yellow -height 15 -radix unsigned} {/parte3/cache/LRU[2]} {-color Yellow -height 15 -radix unsigned} {/parte3/cache/LRU[3]} {-color Yellow -height 15 -radix unsigned}} /parte3/cache/LRU
add wave -noupdate -color Magenta -radix unsigned /parte3/cache/saidaCache
add wave -noupdate -radix unsigned -childformat {{{/parte3/cache/saida_RAM[7]} -radix unsigned} {{/parte3/cache/saida_RAM[6]} -radix unsigned} {{/parte3/cache/saida_RAM[5]} -radix unsigned} {{/parte3/cache/saida_RAM[4]} -radix unsigned} {{/parte3/cache/saida_RAM[3]} -radix unsigned} {{/parte3/cache/saida_RAM[2]} -radix unsigned} {{/parte3/cache/saida_RAM[1]} -radix unsigned} {{/parte3/cache/saida_RAM[0]} -radix unsigned}} -subitemconfig {{/parte3/cache/saida_RAM[7]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[6]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[5]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[4]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[3]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[2]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[1]} {-height 15 -radix unsigned} {/parte3/cache/saida_RAM[0]} {-height 15 -radix unsigned}} /parte3/cache/saida_RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1201 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 120
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
WaveRestoreZoom {583 ps} {1207 ps}

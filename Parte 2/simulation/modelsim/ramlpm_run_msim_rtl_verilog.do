transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/PROJETO\ 1-20210823T130439Z-001/PROJETO\ 1/Parte\ 2 {C:/Users/erick/Downloads/PROJETO 1-20210823T130439Z-001/PROJETO 1/Parte 2/ramlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/PROJETO\ 1-20210823T130439Z-001/PROJETO\ 1/Parte\ 2 {C:/Users/erick/Downloads/PROJETO 1-20210823T130439Z-001/PROJETO 1/Parte 2/parte2.v}


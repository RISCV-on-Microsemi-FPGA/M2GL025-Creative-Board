vlib work
vmap SF4 /ihome/potdara/SF4
vlog -work work -f compileList.do
vsim -novopt -L SF4 work.testbench

do wave.do
add log -r *
run 2us

radix h


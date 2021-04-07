force -freeze sim:/info_array/A 0000
force -freeze sim:/info_array/B 0000
force -freeze sim:/info_array/C 0000
force -freeze sim:/info_array/D 0000
run 10 ns
force -freeze sim:/info_array/A 1111
force -freeze sim:/info_array/B 0000
force -freeze sim:/info_array/C 0000
force -freeze sim:/info_array/D 0000
run 10 ns
force -freeze sim:/info_array/A 0000
force -freeze sim:/info_array/B 1111
force -freeze sim:/info_array/C 0000
force -freeze sim:/info_array/D 0000
run 10 ns
force -freeze sim:/info_array/A 0000
force -freeze sim:/info_array/B 0000
force -freeze sim:/info_array/C 1111
force -freeze sim:/info_array/D 0000
run 10 ns
force -freeze sim:/info_array/A 0000
force -freeze sim:/info_array/B 0000
force -freeze sim:/info_array/C 0000
force -freeze sim:/info_array/D 1111
run 10 ns

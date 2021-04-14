force -freeze sim:/compressor/V0 0000000000000
force -freeze sim:/compressor/V1 0000000000000
force -freeze sim:/compressor/V2 0000000000000
force -freeze sim:/compressor/V3 0000000000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- testar entrada unitaria no level 1
force -freeze sim:/compressor/V0 0001011110100
force -freeze sim:/compressor/V1 0000000000000
force -freeze sim:/compressor/V2 0000000000000
force -freeze sim:/compressor/V3 0000000000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- estresse sobre t1,1
force -freeze sim:/compressor/V0 0000000001100
force -freeze sim:/compressor/V1 0000000001100
force -freeze sim:/compressor/V2 0000000001100
force -freeze sim:/compressor/V3 0000000001100
force -freeze sim:/compressor/V4 0000000001100
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t1,2
force -freeze sim:/compressor/V0 0000000010000
force -freeze sim:/compressor/V1 0000000010000
force -freeze sim:/compressor/V2 0000000010000
force -freeze sim:/compressor/V3 0000000010000
force -freeze sim:/compressor/V4 0000000010000
force -freeze sim:/compressor/V5 0000000010000
force -freeze sim:/compressor/V6 0000000010000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t1,3
force -freeze sim:/compressor/V0 0000000100000
force -freeze sim:/compressor/V1 0000000100000
force -freeze sim:/compressor/V2 0000000100000
force -freeze sim:/compressor/V3 0000000100000
force -freeze sim:/compressor/V4 0000000100000
force -freeze sim:/compressor/V5 0000000100000
force -freeze sim:/compressor/V6 0000000100000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t1,4
force -freeze sim:/compressor/V0 0000001000000
force -freeze sim:/compressor/V1 0000001000000
force -freeze sim:/compressor/V2 0000001000000
force -freeze sim:/compressor/V3 0000001000000
force -freeze sim:/compressor/V4 0000001000000
force -freeze sim:/compressor/V5 0000001000000
force -freeze sim:/compressor/V6 0000001000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t1,5
force -freeze sim:/compressor/V0 0000110000000
force -freeze sim:/compressor/V1 0000110000000
force -freeze sim:/compressor/V2 0000110000000
force -freeze sim:/compressor/V3 0000110000000
force -freeze sim:/compressor/V4 0000110000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t1,6
force -freeze sim:/compressor/V0 0011000000000
force -freeze sim:/compressor/V1 0011000000000
force -freeze sim:/compressor/V2 0000000000000
force -freeze sim:/compressor/V3 0000000000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t2,1
force -freeze sim:/compressor/V0 0000000011100
force -freeze sim:/compressor/V1 0000000000100
force -freeze sim:/compressor/V2 0000000000000
force -freeze sim:/compressor/V3 0000000000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t2,2
force -freeze sim:/compressor/V0 0000001111100
force -freeze sim:/compressor/V1 0000001111100
force -freeze sim:/compressor/V2 0000000111000
force -freeze sim:/compressor/V3 0000000110000
force -freeze sim:/compressor/V4 0000000110000
force -freeze sim:/compressor/V5 0000000110000
force -freeze sim:/compressor/V6 0000000100000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t2,3
--                               CBA9876543210
force -freeze sim:/compressor/V0 0001111000000
force -freeze sim:/compressor/V1 0000001000000
force -freeze sim:/compressor/V2 0000001000000
force -freeze sim:/compressor/V3 0000001000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t2,4
--                               CBA9876543210
force -freeze sim:/compressor/V0 0010100000000
force -freeze sim:/compressor/V1 0000100000000
force -freeze sim:/compressor/V2 0000000000000
force -freeze sim:/compressor/V3 0000000000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns
-- teste de estresse sobre t2,5
--                               CBA9876543210
force -freeze sim:/compressor/V0 0110100000000
force -freeze sim:/compressor/V1 0010100000000
force -freeze sim:/compressor/V2 0000100000000
force -freeze sim:/compressor/V3 0000100000000
force -freeze sim:/compressor/V4 0000000000000
force -freeze sim:/compressor/V5 0000000000000
force -freeze sim:/compressor/V6 0000000000000
force -freeze sim:/compressor/V7 0000000000000
run 10 ns

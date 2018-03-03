#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright(C) Hiroshi Takekawa
# Calculating harmonic summation, which will tend to infinity...

i = 1
# Summation must be bounded, summation tends to infinify.
Max = 30000000
sum = 0
prev = -1
println("Calculating harmonic series summation, which tends to infinity, so it will stop at Max = $Max")
while prev < sum && i < Max
	global prev = sum
	global sum += 1 / i
	global i += 1
	if i % 1000000 == 0
		println("i = $i, prev = $prev, sum = $sum")
	end
end
println("Max = $Max")
println("sum = $sum")

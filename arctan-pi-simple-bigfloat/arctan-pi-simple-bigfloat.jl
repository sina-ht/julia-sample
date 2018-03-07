#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Approximating Pi by using Arctan(1) series
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.
# Note that using BigFloat and more iteration doesn't help much for precision.
# This series is slow to converge.

# Iteration count
Loop = BigInt(50000000)

i = BigFloat(1.0)
sum = BigFloat(0.0)
while i < Loop
	global sum += 1/i
	global i += 2
	global sum -= 1/i
	global i += 2
end

Pi = sum * 4

println("Iteration = $Loop")
println("Estimated Pi            = $Pi")
PiC = Base.MathConstants.pi
println("Defined constant Pi = $PiC")

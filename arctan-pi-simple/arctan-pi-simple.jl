#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Approximating Pi by using Arctan(1) series
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.

# Iteration count
Loop = 10000000

function arctan1(loop)
    i = 1
    sum = 0
    while i < loop
	sum += 1/i
	i += 2
	sum -= 1/i
	i += 2
    end
    return sum
end

Pi = arctan1(Loop) * 4

println("Iteration = $Loop")
println("Estimated Pi        = $Pi")
PiC = BigFloat(Base.MathConstants.pi)
println("Defined constant Pi = $PiC")

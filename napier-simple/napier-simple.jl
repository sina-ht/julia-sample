#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Calculating the value of Napier number (e)
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.

# Iteration count
Loop = 20

function napier(loop)
    i = 0
    sum = 0
    while i < Loop
	sum += 1 / factorial(i)
	i += 1
    end
    return sum
end

Napier = napier(Loop)

println("Iteration = $Loop")
println("Estimated e         = $Napier")
NapierC = BigFloat(Base.MathConstants.e)
println("Defined constant is = $NapierC")

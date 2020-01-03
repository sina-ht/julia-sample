#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Approximating Pi by using Machin's formula \pi/4 = 4 * arctan(1/5) - arctan(1/239)
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm may not be efficient, just for demonstration.

# Iteration count.  This value would be enough.
Loop = BigInt(500)

function machin(loop)
    # Initial using rational numbers
    x = 1 // BigInt(5)
    y = 1 // BigInt(239)

    # Terms
    xn = x
    yn = y

    # Variables for accumulation
    sumx = BigFloat(0.0)
    sumy = BigFloat(0.0)

    i = 1
    while i < Loop
	# Odd terms
	sumx += xn // i
	sumy += yn // i
	i += 2
	xn = xn // BigInt(5 * 5)
	yn = yn // BigInt(239 * 239)

	# Even terms
	sumx -= xn // i
	sumy -= yn // i
	i += 2
	xn = xn // BigInt(5 * 5)
	yn = yn // BigInt(239 * 239)
    end
    return (BigFloat(4) * sumx - sumy)
end

Pi = machin(Loop) * BigFloat(4)

println("Iteration = $Loop")
println("Estimated Pi        = $Pi")
PiC = BigFloat(Base.MathConstants.pi)
println("Defined constant Pi = $PiC")

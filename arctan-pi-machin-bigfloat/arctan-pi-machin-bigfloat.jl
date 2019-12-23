#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Approximating Pi by using Machin's formula \pi/4 = 4 * arctan(1/5) - arctan(1/239)
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm may not be efficient, just for demonstration.

# Iteration count.  This value would be enough.
Loop = BigInt(100)

function machin(loop)
    # Initial
    x = BigFloat(1/5)
    y = BigFloat(1/239)

    # Terms
    xn = x
    yn = y

    # Variables for accumulation
    sumx = BigFloat(0.0)
    sumy = BigFloat(0.0)

    i = 1
    while i < Loop
	# Odd terms
	sumx += xn/i
	sumy += yn/i
	i += 2
	xn *= x^2
	yn *= y^2

	# Even terms
	sumx -= xn/i
	sumy -= yn/i
	i += 2
	xn *= x^2
	yn *= y^2
    end
    return (BigFloat(4) * sumx - sumy)
end

Pi = machin(Loop) * BigFloat(4)

println("Iteration = $Loop")
println("Estimated Pi        = $Pi")
PiC = BigFloat(Base.MathConstants.pi)
println("Defined constant Pi = $PiC")

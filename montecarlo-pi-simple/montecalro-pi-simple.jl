#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Estimating Pi using Monte Carlo method
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is FAR FROM efficient, just for demonstration.

# Iteration count
Loop = 100000000

println("Wait a minute.  Note that this is the Monte Carlo method, so an estimated value will be different each time.")

function montecalro_pi(loop)
    i = 0
    sum = 0
    while i < Loop
	# Generate a random point within the rectangle [0,1) x [0,1)
	x = rand()
	y = rand()
	# Is the generated point inside the unit circle?
	# This is intended to estimate the area of the unit circle, and in turn estimate the value of Pi.
	if x^2 + y^2 <= 1
	    sum += 1
	end
	i += 1
    end
    return sum
end

sum = montecalro_pi(Loop)
# sum / Loop is an estimation for Pi/4
Pi = sum / Loop * 4

println("Iteration = $Loop")
println("Estimated Pi        = $Pi")
PiC = BigFloat(Base.MathConstants.pi)
println("Defined constant Pi = $PiC")

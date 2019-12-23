#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Calculating Euler-Mascheroni constant
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.

# Max iteration
Loop = 10000000

function euler_mascheroni(loop)
    i = 1
    sum = 0
    prev = 0
    em = 0
    while i < Loop
	sum += 1 / i
	em = sum - log(i)
	# Break if precision is enough
	if (i > 5 && em == prev)
	    break
	end
	prev = em
	i += 1
    end
    return em
end

em = euler_mascheroni(Loop)

println("Iteration = $Loop")
println("Estimated Euler-Mascheroni constant = $em")
print("More precise value is               = ")
println(BigFloat(Base.MathConstants.eulergamma))

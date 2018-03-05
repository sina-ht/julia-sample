#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Calculating Euler-Mascheroni constant
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.

# Max iteration
Loop = 10000000

i = 1
sum = 0
prev = 0
em = 0
while i < Loop
	global sum += 1 / i
	global em = sum - log(i)
	# Break if precision is not enough
	if (i > 5 && em == prev)
		break
	end
	global prev = em
	global i += 1
end

println("Iteration = $Loop")
println("Iterated = $i")
println("Estimated Euler-Mascheroni constant = $em")
EulerGamma = Base.MathConstants.eulergamma;
println("More precise value is           = $EulerGamma")

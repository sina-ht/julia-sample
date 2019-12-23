#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Calculating Bazel Series
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.
# This code is slow but precise.

# Iteration count
Loop = BigInt(100000000)
println("Iteration = $Loop")
println("Please wait...")

function bazel(loop)
    i = 1
    sum = BigFloat(0.0)
    while i < Loop
	sum += 1 / (i ^ 2)
	i += 1
    end
    return sum
end

sum = bazel(Loop)

println("Estimated Basel Series            = $sum")
PiC = Base.MathConstants.pi
Bazel = BigFloat((PiC ^ 2) / 6)
println("Derived from the defined constant = $Bazel")

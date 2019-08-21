#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Calculating Bazel Series
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is NOT efficient, just for demonstration.

# Iteration count
Loop = 10000000
println("Iteration = $Loop")

i = 1
sum = 0
while i < Loop
	global sum += 1 / (i ^ 2)
	global i += 1
end

println("Estimated Basel Series            = $sum")
PiC = Base.MathConstants.pi
Bazel = BigFloat((PiC ^ 2) / 6)
println("Derived from the defined constant = $Bazel")

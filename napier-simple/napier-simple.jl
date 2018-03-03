#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Calculating the value of Napier number (e)
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algotithm is NOT efficient, just for demonstration. 

# Iteration count
Loop = 20

i = 0
sum = 0
while i < Loop
	global sum += 1 / factorial(i)
	global i += 1
end
Napier = sum

println("Iteration = $Loop")
println("Estimated e             = $Napier")
NapierC = Base.MathConstants.e
println("Defined constant is = $NapierC")

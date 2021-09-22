#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Estimating Pi using Monte Carlo method
# Copyright(C) Hiroshi Takekawa
#
# WARNING: This algorithm is FAR FROM efficient, just for demonstration.

### Iteration count
# To utilize the power of Julia's JIT compiler, we generate samples in memory
# and estimate pi/4 from them.  It consumes as much memory as samples you want
# to generate.  To avoid out-of-memory situation, we iterate a simulation many
# times so that one simulation generates moderate amount of samples.
#
# How many samples do we generate per simulation?
Samples = 1000000
# How many times do we do simulations?
Sims = 300

# Filter function: Is p inside a unit circle?
incircle(p) = first(p) ^ 2 + last(p) ^ 2 <= 1

# Do a montecarlo simulation.
function montecarlo_pi_main(n)
    # Generate n samples (we consume memory here)
    points = [ (rand(), rand()) for _ in 1:n ]
    # Use incircle filter to count points in a unit circle.
    count = length(filter(incircle, points))
    # Divide it by the number of points to estimate a quarter of the area of a unit circle (pi/4).
    return count / n
end

# Do m-sample montecarlo simulation n times.
function montecarlo_pi(m, n)
    return sum([ montecarlo_pi_main(m) for _ in 1:n ]) / n
end

println("Wait a minute.  Note that this is the Monte Carlo method, so an estimated value will be different each time.")

Pi = montecarlo_pi(Samples, Sims) * 4

println("Iteration = $Samples * $Sims")
println("Estimated Pi        = $Pi")
PiC = BigFloat(Base.MathConstants.pi)
println("Defined constant Pi = $PiC")

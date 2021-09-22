#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Estimating even dice value event probability using Monte Carlo method
# Copyright(C) Hiroshi Takekawa

N = 10000000

println(sum([iseven(rand(1:6) + rand(1:6)) for i in 1:N])/N)
println("True probability is 0.5")

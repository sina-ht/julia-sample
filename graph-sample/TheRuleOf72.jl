#!/usr/bin/env julia
# SPDX-License-Identifier: GPL-2.0-only
#
# The Rule of 72: An investment with n% annual return takes 72/n years to double.
# Copyright(C) Hiroshi Takekawa

using Plots; pyplot()

# (1 + (x / 100)^y = 2, solve for y
# y log (1 + (x / 100)) = log 2
# y = log 2 / log (1 + (x / 100))
x = [ t * 0.5 for t in 1:20 ]
y = [ log(2) / log(1 + (t / 100)) for t in x ]
z = [ 72 / t for t in x ]
p = plot(x, y, xticks = (1:10), yticks = [t * 10 for t in 1:15], xlim = (0, 11), ylim = (0, 150), title="The Rule of 72", label="Real value")
plot!(p, x, z, color=:red, seriestype=:scatter, label="Estimated", xlabel="Annual return", ylabel="Years to double")
gui(p)
println(x, y)
savefig("TheRuleOf72.png")
readline()

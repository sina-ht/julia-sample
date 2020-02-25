#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a Julia set by Fatou package
# Copyright(C) Hiroshi Takekawa

using PyPlot
using Fatou

c = -0.06 + 0.67im
println("Wait a minute.")
nf = juliafill(:(z^2 + $c),∂=[-1.5, 1.5, -1, 1], N=80, n=1501, cmap="gnuplot", iter=true)
plot(fatou(nf), bare=true)
show()
println("Done.")

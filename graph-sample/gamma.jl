#!/usr/bin/env julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a gamma function graph
# Copyright(C) Hiroshi Takekawa

using GR
using SpecialFunctions

x = [t * 0.1 for t in 1:50]
y = [SpecialFunctions.gamma(t)::Float64 for t in x]
plot(x, y)
readline()

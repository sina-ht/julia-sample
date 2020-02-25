#!/usr/bin/env julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a polynomial graph
# Copyright(C) Hiroshi Takekawa

using GR

x = [-3.3 + t * 0.1 for t in 0:66]
y = [(t^5 - 13 * t^3 + 36 * t)::Float64 for t in x]
plot(x, y)
readline()

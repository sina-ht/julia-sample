#!/usr/bin/env julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a sin function graph
# Copyright(C) Hiroshi Takekawa

using GR

x = [-5.5 + t * 0.1 for t in 0:110]
y = [sin(t)::Float64 for t in x]
plot(x, y)
readline()

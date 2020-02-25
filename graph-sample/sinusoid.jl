#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a sinusoid graph
# Copyright(C) Hiroshi Takekawa

using GR

x = [-5.5 + t * 0.1 for t in 0:110]
y = sin.(3 * x + 4 * cos.(2 * x))
plot(x, y, color="red")
title("A sinusoidally modulated sinusoid")
readline()

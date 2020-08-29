#!/usr/bin/env julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a 3D function graph
# Copyright(C) Hiroshi Takekawa

using GR
#using Plots
#Plots.gr()

x= -2:0.005:4
y= -2:0.005:4
h(x,y) = x^2 - y^2;

surface(x, y, h)
#wireframe(x, y, h)

readline()

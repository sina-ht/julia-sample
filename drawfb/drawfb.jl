#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw an random pixel image via a plain RGB framebuffer
# Copyright(C) Hiroshi Takekawa

println("Random pixel drawing")
println("Loading packages...")

using ImageCore
using ImageView

println("Drawing...")

width = 256
height = 256

fb = fill(RGB(0.0, 0.0, 0.0), width, height)

y = 1
while y <= height
    global x = 1
    while x <= width
        fb[x, y] = RGB(rand(), rand(), rand())
        x = x + 1
    end
    global y = y + 1
end
println("Rendering...")

img = colorview(RGB, fb)
imshow(img)
println("Done.  Press any key to finish.")
readline()

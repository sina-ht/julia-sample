#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a Mandelbrot set
# Copyright(C) Hiroshi Takekawa

println("Mandelbrot set")
println("Loading packages...")

using ImageCore
using ImageView
using FileIO

println("Drawing...")

width = 1200.0
height = 1200.0
adjustx = -0.5
adjusty = 0.0
threshold = 100.0

fb = fill(RGB(0.0, 0.0, 0.0), Int64(height), Int64(width))

for y = 1:height
    if y % 100 == 0
        println("y ", y)
    end
    for x = 1:width
        # c = a + bi
        a = ((x - (width / 2)) / (width / 3) + adjustx)
        b = ((y - (height / 2)) / (height / 3) + adjusty)
        zr = 0
        zi = 0
        #println("zr ", zr, " zi ", zi)
        loop = 1.0
        while loop < threshold
            zr2 = zr * zr - zi * zi + a
            zi2 = 2 * zr * zi + b
            zr = zr2
            zi = zi2
            distance = zr * zr + zi * zi
            #println("zr ", zr, " zi ", zi, " loop ", loop, " distance ", distance)
            if distance > 4.0
                break
            end
            loop += 1
        end
        loop -= 1
        r = 0
        g = 0
        b = 0
        if loop < threshold / 10
            r = (loop * 4) / threshold
            g = (loop * 4) / threshold
            b = 0.3 + (loop * 4) / threshold
        elseif loop < threshold / 4
            r = 0.7 + (loop * 4 / threshold)
            g = 0.7 + (loop * 4 / threshold)
            b = 0.3 + (loop * 4 / threshold)
        end
        fb[Int64(y), Int64(x)] = RGB(r, g, b)
    end
end
println("Rendering...")

img = colorview(RGB, fb)
imshow(img)
save("mandelbrot.png", img)
println("Done.  Press any key to finish.")
readline()

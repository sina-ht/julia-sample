#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a Mandelbrot set
# Copyright(C) Hiroshi Takekawa

println("Mandelbrot set")
println("Loading packages...")

pls = time_ns()
using ImageCore
using ImageView
using FileIO
ple = time_ns()
println("Loaded in ", (ple - pls) / 1000000, "ms")

width = 1200.0
height = 1200.0
adjustx = -0.5
adjusty = 0.0
threshold = 100.0

function mandelbrot(w, h, ax, ay, th)
    fb = fill(RGB(0.0, 0.0, 0.0), Int64(h), Int64(w))

    ds = time_ns()
    println("Draw start ", ds)

    for y = 1:h
        #if y % 100 == 0
        #    println("y ", y)
        #end
        for x = 1:w
            # c = a + bi
            a = ((x - (w / 2)) / (w / 3) + ax)
            b = ((y - (h / 2)) / (h / 3) + ay)
            zr = 0
            zi = 0
            loop = 1.0
            while loop < th
                zr2 = zr * zr - zi * zi + a
                zi2 = 2 * zr * zi + b
                zr = zr2
                zi = zi2
                distance = zr * zr + zi * zi
                if distance > 4.0
                    break
                end
                loop += 1
            end
            loop -= 1
            r = 0
            g = 0
            b = 0
            if loop < th / 10
                r = (loop * 4) / th
                g = (loop * 4) / th
                b = 0.3 + (loop * 4) / th
            elseif loop < th / 4
                r = 0.7 + (loop * 4 / th)
                g = 0.7 + (loop * 4 / th)
                b = 0.3 + (loop * 4 / th)
            end
            fb[Int64(y), Int64(x)] = RGB(r, g, b)
        end
    end
    rs = time_ns()
    println("Render start ", rs)

    img = colorview(RGB, fb)
    imshow(img)

    ss = time_ns()
    println("Save start ", ss)

    save("mandelbrot.png", img)

    fin = time_ns()
    println("All finish ", fin)

    println("")
    println("Draw   time ", (rs - ds) / 1000000, " ms (", rs - ds, " ns)")
    println("Render time ", (ss - rs) / 1000000, " ms (", ss - rs, " ns)")
    println("Save   time ", (fin -ss) / 1000000, " ms (", fin -ss, " ns)")
end

@time mandelbrot(width, height, adjustx, adjusty, threshold)

println("Done.  Press any key to finish.")
readline()

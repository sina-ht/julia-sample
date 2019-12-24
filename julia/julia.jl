#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Draw a Julia set
# Copyright(C) Hiroshi Takekawa

println("Julia set")
println("Loading packages...")

pls = time_ns()
using ImageCore
using ImageView
using FileIO
ple = time_ns()
println("Loaded in ", (ple - pls) / 1000000, "ms")

width = 1200.0
height = 1200.0
adjustx = 0.0
adjusty = 0.0
threshold = 20.0

function julia(w, h, ax, ay, th)
    fb = fill(RGB(0.0, 0.0, 0.0), Int64(h), Int64(w))

    ds = time_ns()
    println("Draw start ", ds)

    for y = 1:h
        for x = 1:w
            # c = a + bi
            a = 0.2
            b = 0.8
            zr = ((x - (w / 2)) / (w / 3) + ax)
            zi = ((y - (h / 2)) / (h / 3) + ay)
            loop = 1.0
            while loop < th
                zr2 = zr * zr - zi * zi + a
                zi2 = 2 * zr * zi + b
                zr = zr2
                zi = zi2
                distance = zr * zr + zi * zi
                if distance > 9.0
                    break
                end
                loop += 1
            end
            loop -= 1
            r = 0
            g = 0
            b = 0
            gamma = (loop / th)
            r = gamma
            g = gamma
            b = gamma
            if gamma < 0.1
                r = gamma
                g = gamma
                b = gamma
            elseif gamma < 0.2
                r = 0.3 + gamma
                g = gamma
                b = gamma
            elseif gamma < 0.3
                r = gamma
                g = 0.4 + gamma
                b = gamma
            else
                r = gamma
                g = gamma
                b = 0.5 + gamma
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

    save("julia.png", img)

    fin = time_ns()
    println("All finish ", fin)

    println("")
    println("Draw   time ", (rs - ds) / 1000000, " ms (", rs - ds, " ns)")
    println("Render time ", (ss - rs) / 1000000, " ms (", ss - rs, " ns)")
    println("Save   time ", (fin -ss) / 1000000, " ms (", fin -ss, " ns)")
end

@time julia(width, height, adjustx, adjusty, threshold)

println("Done.  Press any key to finish.")
readline()

#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright(C) Hiroshi Takekawa

using CSV, DataFrames, Dates, TimeSeries, Statistics, Plots; pyplot()

### Read data and simple processing
rawdata = CSV.read("data.csv", DataFrame; types = [String, Int, Int, Int, Float64, Float64, String], missingstring = "NA")
# Drop N/A.
data = dropmissing(rawdata, :weight)
data = dropmissing(data, :low)

### Convert data for further processing
# Parse date
format = Dates.DateFormat("m/d/y H:M:S")
xdates = Date.(data[:, :date], format)
# Insert dates as timestamps
data[:, :timestamp] = xdates
# Convert DataFrame into TimeArray
ta = TimeArray(data, timestamp = :timestamp)

# Calculate means per month
monthlyw = collapse(ta[:weight], month, last, mean)
monthlyl = collapse(ta[:low], month, last, mean)

### Plot
plot(monthlyw, yticks = 60:5:100, title = "Weight/Low", label = "Weight", xlabel = "Date", ylabel = "Value", legend = :bottomright, color=:red)
plot!(monthlyl, label = "Low", xlabel = "Date", color=:black)

# Resize
plot!(size=(1024, 768))

savefig("output.png")

# Is there any correlation between weight and low blood pressure?
println("Correation coefficient form the beginning to years")
cors = [cor(values(to(ta, Date(Year(y)))[:weight]), values(to(ta, Date(Year(y)))[:low])) for y in 2023:2032]
println(cors)

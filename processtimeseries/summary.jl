#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright(C) Hiroshi Takekawa

using CSV, DataFrames, Dates, TimeSeries, Statistics, Plots; pyplot()

### Read data and simple processing
rawdata = CSV.read("data.csv", DataFrame; types = [String, Int, Int, Int, Float64, Float64, String], missingstring = "NA")
# Drop N/A.
data = dropmissing(rawdata, :weight)

### Convert data for further processing
# Parse date
format = Dates.DateFormat("m/d/y H:M:S")
xdates = DateTime.(data[:, :date], format)
# Insert dates as timestamps
data[:, :timestamp] = xdates
# Convert DataFrame into TimeArray
ta = TimeArray(data, timestamp = :timestamp)

### Plot
# Plot moving average of weight
plot(moving(mean, ta[:weight], 90), yticks = 60:5:100, title = "Weight/Low", label = "Weight", xlabel = "Date", ylabel = "Value", legend = :bottomright, color=:red)
plot!(moving(mean, ta[:low], 90), label = "Low", xlabel = "Date", color=:black)

# Resize
plot!(size=(1024, 768))

savefig("output.png")

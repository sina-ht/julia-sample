#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Iterator sample
# Copyright(C) Hiroshi Takekawa
#
# Based on the sample code snippets from https://docs.julialang.org/en/latest/manual/interfaces/

using Statistics

struct Squares
	count::Int
end

# Squares implementation
Base.firstindex(::Squares) = 1
Base.lastindex(S::Squares) = length(S)
Base.iterate(S::Squares, state = 1) = state > S.count ? nothing : (state * state, state + 1)
Base.eltype(::Type{Squares}) = Int # Note that this is defined for the type
Base.length(S::Squares) = S.count

println("Squares from 1 to 7")
for i in Squares(7)
	println(i)
end
println("")

if 25 in Squares(6)
	println("25 is in the set of Squares(6)")
end
println("")

println("Means: 1^2 + .. + 100^2");
println(Statistics.mean(Squares(100)))
println("")

Base.sum(S::Squares) = (n = S.count; return (n * (n + 1) * (2n + 1) ÷ 6))
println("1^2 + .. + 1803^2")
println(sum(Squares(1803)))
println("")

function Base.getindex(S::Squares, i::Int)
	1 <= i <= S.count || throw(BoundsError(S, i))
	return i * i
end
println("Squares(100)[23], which creates the set of squares from 1 to 100, then return 23th element")
println(Squares(100)[23]);

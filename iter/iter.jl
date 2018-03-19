#!/usr/bin/julia
# SPDX-License-Identifier: GPL-2.0-only
#
# Iterator sample
# Copyright(C) Hiroshi Takekawa

# See https://docs.julialang.org/en/latest/manual/interfaces/
# Almost all code are shamelessly stolen from this site.
struct Squares
	count::Int
end

# Squares implementation
Base.start(::Squares) = 1
Base.next(S::Squares, state) = (state*state, state+1)
Base.done(S::Squares, state) = state > S.count
Base.eltype(::Type{Squares}) = Int # Note that this is defined for the type
Base.length(S::Squares) = S.count

for i in Squares(7)
	println(i)
end

if 25 in Squares(6)
	println("25 is in Squares(6)")
end

println("Means: 1^2 + ... + 100+2");
println(mean(Squares(100)))

Base.sum(S::Squares) = (n = S.count; return n*(n+1)*(2n+1)÷6)
println("1^2 + .. + 1803^3")
println(sum(Squares(1803)))

function Base.getindex(S::Squares, i::Int)
	1 <= i <= S.count || throw(BoundsError(S, i))
	return i*i
end
println("Squares(100)[23]")
println(Squares(100)[23]);

using GenieStatic

using Test: @test

# ----------------------------------------------------------------------------------------------- #

# ---- #

const HT = joinpath(tempdir(), "1.html")

GenieStatic.fetch(HT, "http://localhost:8000")

println(read(HT, String))

# ---- #

GenieStatic.make(tempdir())

module GenieStatic

using Genie.Router: routes

using HTTP: get

function _get_write(fi, ur)

    @info "$ur 📥 $fi"

    write(fi, String(get(ur).body))

end

function make(di, ba, co = r"^/(?!_devtools_|genie|stipple)")

    for ro in routes()

        if ro.method == "GET" && contains(ro.path, co)

            re = ro.path[2:end]

            fi = isempty(re) ? "index" : re

            fi = joinpath(di, contains(basename(fi), '.') ? fi : "$fi.html")

            mkpath(dirname(fi))

            _get_write(fi, joinpath(ba, re))

        end

    end

end

end

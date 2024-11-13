module GenieStatic

using Genie.Router: routes

using HTTP: get

function _get_write(fi, ur)

    @info "$ur 📥 $fi"

    write(fi, String(get(ur).body))

end

function make(di, ur)

    for ro in routes()

        pa = ro.path[2:end]

        if ro.method == "GET" && !(
            startswith(pa, "_devtools_") ||
            startswith(pa, "genie") ||
            startswith(pa, "stipple")
        )

            fi = joinpath(di, isempty(pa) ? "index.html" : "$pa.html")

            mkpath(dirname(fi))

            _get_write(fi, joinpath(ur, pa))

        end

    end

end

end

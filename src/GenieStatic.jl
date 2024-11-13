module GenieStatic

using Genie.Router: routes

using HTTP: get

function _get_write(ht, ur)

    @info "$ur ➡ $ht"

    write(ht, String(get(ur).body))

end

function make(di, ba)

    for ro in routes()

        pa = ro.path

        if ro.method == "GET" &&
           !(contains(pa, "_devtools_") || contains(pa, "genie") || contains(pa, "stipple"))

            na = ro.path[2:end]

            _get_write(
                joinpath(di, isempty(na) ? "index.html" : "$na.html"),
                joinpath(ba, na),
            )

        end

    end

end

end

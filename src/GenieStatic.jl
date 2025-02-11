module GenieStatic

# ----------------------------------------------------------------------------------------------- #

using Genie.Router: routes

using HTTP: get

function _write(fi, ur)

    write(fi, replace(String(get(ur).body), r" +|\n" => ' '))

end

function writ(di, ur, co = r"^/(_devtools_|genie|stipple)")

    for ro in routes()

        if ro.method != "GET" || contains(ro.path, co)

            continue

        end

        pa = ro.path[2:end]

        fi = joinpath(di, if isempty(pa)

            "index.html"

        elseif isempty(splitext(pa)[2])

            "$pa.html"

        else

            pa

        end)

        mkpath(dirname(fi))

        _write(fi, joinpath(ur, pa))

    end

end

end

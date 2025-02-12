module GenieStatic

# ----------------------------------------------------------------------------------------------- #

using Genie.Router: routes

using HTTP: get

function writ(di, ur, re = r"^/(_devtools_|genie|stipple)")

    for ro in routes()

        if ro.method != "GET" || contains(ro.path, re)

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

        write(fi, replace(String(get(joinpath(ur, pa)).body), r" +|\n" => ' '))

    end

end

end

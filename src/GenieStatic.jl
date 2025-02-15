module GenieStatic

# ----------------------------------------------------------------------------------------------- #

using Genie.Router: routes

using HTTP: get

function writ(di, u1, re = r"^/(_devtools_|genie|stipple)")

    for ro in routes()

        if ro.method != "GET" || contains(ro.path, re)

            continue

        end

        u2 = ro.path[2:end]

        fi = joinpath(di, if isempty(u2)

            "index.html"

        elseif isempty(splitext(u2)[2])

            "$u2.html"

        else

            u2

        end)

        mkpath(dirname(fi))

        write(fi, replace(String(get(joinpath(u1, u2)).body), r" +|\n" => ' '))

    end

end

end

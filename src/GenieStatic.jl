module GenieStatic

# ----------------------------------------------------------------------------------------------- #

using Genie.Router: routes

using HTTP: get

function _get_write(fi, ur)

    write(fi, replace(String(get(ur).body), r" +|\n" => ' '))

end

function make(di, ur, co = r"^/(?!_devtools_|genie|stipple)")

    for ro in routes()

        if ro.method == "GET" && contains(ro.path, co)

            pa = ro.path[2:end]

            fi = joinpath(di, if isempty(pa)

                "index.html"

            elseif isempty(rsplit(pa, '.'; limit = 2)[2])

                "$pa.html"

            else

                pa

            end)

            mkpath(dirname(fi))

            _get_write(fi, joinpath(ur, pa))

        end

    end

end

end

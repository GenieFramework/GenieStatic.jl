module GenieStatic

using Genie.Router: routes

using HTTP: get

function _get_write(fi, ur)

    @info "$ur 📥 $fi"

    write(fi, replace(String(get(ur).body), r" +|\n" => ' '))

end

function make(di, ba, se = r"^/(?!_devtools_|genie|stipple)")

    for ro in routes()

        if ro.method == "GET" && contains(ro.path, se)

            re = ro.path[2:end]

            fi = if isempty(re)

                "index.html"

            elseif isempty(splitext(re)[2])

                "$re.html"

            else

                re

            end

            fi = joinpath(di, fi)

            mkpath(dirname(fi))

            _get_write(fi, joinpath(ba, re))

        end

    end

end

end

module GenieStatic

# ------------------------------------ #

using Genie.Router: routes

using HTTP: get

function write2(p1, p2, st = r"^/(_devtools_|genie|stipple)")

    for an in routes()

        if an.method != "GET" || contains(an.path, st)

            continue

        end

        p3 = an.path[2:end]

        p4 = joinpath(p1, if isempty(p3)

            "index.html"

        elseif isempty(splitext(p3)[2])

            "$p3.html"

        else

            p3

        end)

        mkpath(dirname(p4))

        write(p4, replace(String(get(joinpath(p2, p3)).body), r" +|\n" => ' '))

    end

end

end

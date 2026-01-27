module GenieStatic

const P1 = pkgdir(GenieStatic, "in")

const P2 = pkgdir(GenieStatic, "ou")

# ------------------------------------ #

using Genie.Router: routes

using HTTP: get

function write2(
    p1,
    p2,
    fu = st ->
        startswith(st, "/_devtools_") ||
        startswith(st, "/genie") ||
        startswith(st, "/stipple"),
)

    for an in routes()

        if an.method != "GET" || fu(an.path)

            continue

        end

        p3 = an.path[2:end]

        p4 = joinpath(p1, if isempty(p3)

            "index.html"

        elseif isempty(splitext(p3)[2])

            "$p3.html"

        else

            @warn p3

            p3

        end)

        mkpath(dirname(p4))

        write(
            p4,
            strip(
                replace(
                    String(get(joinpath(p2, p3)).body),
                    r"\s+" => ' ',
                    r">\s+<" => "><",
                    r"<\s+" => '<',
                    r"\s+>" => '>',
                ),
            ),
        )

    end

end

end

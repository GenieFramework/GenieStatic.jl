module GenieStatic

using Genie.Router: routes

using HTTP: get

function _get_write(fi, ur)

    @info "$ur 📥 $fi"

    write(fi, String(get(ur).body))

end

# TODO: Ignore URLs
function make(di, ba)

    for ro in routes()

        ru = ro.path[2:end]

        if ro.method == "GET" &&
           !(startswith(ru, "_devtools_") || startswith(ru, "geniepackagemanager"))

            rf = isempty(ru) ? "index" : ru

            if !contains(basename(rf), '.')

                rf *= ".html"

            end

            fi = joinpath(di, rf)

            mkpath(dirname(fi))

            _get_write(fi, joinpath(ba, ru))

        end

    end

end

end

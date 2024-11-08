module GenieStatic

using Genie.Router: routes

using HTTP: get

function fetch(ht, ur::AbstractString)

    write(ht, String(get(ur).body))

end

# TODO: Iterate over ur_ and fetch
function fetch(di, ur_)

    routes

end

# TODO: Make paths, save HTMLs, and make /public
function build(di)

    mkpath

end

end

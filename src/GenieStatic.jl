module GenieStatic

using Genie.Router: routes

using GeniePlugins

using HTTP: get

function install(de)

    GeniePlugins.install(pkgdir(GenieStatic, "install", "plugins"), de; force = true)

end

function get_write(ht, ur::AbstractString)

    write(ht, String(get(ur).body))

end

function make(di)

    @info di routes()

end

end

# Static website generator for [the Genie Framework](https://genieframework.com)

[KwatMDPhD.com](https://KwatMDPhD.com) is made using this plugin.

## Instruction

```bash
cd MyApp

mkdir public

ls public

julia --project
```

```julia
]add https://github.com/GenieFramework/GenieStatic.jl

#using GenieFramework
using Genie

using GenieStatic

Genie.loadapp()

Genie.up()

GenieStatic.make("public", "http://localhost:8000")
```

```bash
ls public
```

---

Made by [Kata](https://github.com/KwatMDPhD/Kata.jl) 🥋

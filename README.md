# Static website generator for [the Genie Framework](https://genieframework.com)

[KwatMDPhD.com](https://KwatMDPhD.com) is made using this plugin.

## Instruction

```bash
cd MyApp

julia --project
```

```julia
]add https://github.com/GenieFramework/GenieStatic.jl

using Genie
# or
#using GenieFramework

using GenieStatic

Genie.loadapp()

Genie.up()

GenieStatic.make("public", "http://localhost:8000")
```

```bash
ls public
```

```bash
open public/index.html
```

The default layout does not render correctly; try removing `<style>`.

---

Made by [Kata](https://github.com/KwatMDPhD/Kata.jl) 🥋

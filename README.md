# Static website generator for [the Genie Framework](https://genieframework.com) 🖨️

[KwatMDPhD.com](https://KwatMDPhD.com) is made using this.

```julia
]add https://github.com/GenieFramework/GenieStatic.jl

using Genie

using GenieStatic

Genie.loadapp()

up()

GenieStatic.writ("public", "http://localhost:8000")
```

```bash
open public/index.html
```

---

Made by [Kata](https://github.com/KwatMDPhD/Kata.jl) 🥋

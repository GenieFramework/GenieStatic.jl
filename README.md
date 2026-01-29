# Static website generator for the [Genie Framework](https://genieframework.com) 🖨️

Published [KwatMDPhD.com](https://KwatMDPhD.com).

## Use

```julia
using Genie: loadapp, up

using GenieStatic: write2

loadapp()

up()

write2("public", "http://localhost:8000")
```

```zsh
open public/index.html
```

---

Made by [Kata](https://github.com/KwatMDPhD/Kata.jl) ✅

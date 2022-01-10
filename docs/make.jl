using Documenter
using AiEmpires

push!(LOAD_PATH,"../src/")
makedocs(sitename="AiEmpires.jl Documentation",
         pages = [
            "Index" => "index.md",
            "AiEmpires" => "api.md",
         ],
         format = Documenter.HTML(prettyurls = false)
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/AiEmpires/AiEmpires.jl.git",
    devbranch = "master"
)
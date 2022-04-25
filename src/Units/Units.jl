"""
    Units module

    Module which holds all the different units and their specific methods.
"""
module Units

export Unit, MeleeUnit, RangedUnit
export Knight, Peasant
export id, player, pos, hp, ap
export id!, player!, pos!, hp!, ap!


# Include different unit classes.
include("UnitsInterface.jl")
include("Knights.jl")
include("Peasants.jl")

end # module
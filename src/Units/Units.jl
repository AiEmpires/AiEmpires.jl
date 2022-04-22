"""
    Units module

    Module which holds all the different units and their specific methods.
"""
module Units

export AbstractUnit, Unit
export Knight, Peasant
export id, player, pos, hp, attack

# ------------------------------------------------------------------------------------------

"""
Abstract classes
"""
abstract type Unit end

abstract type MeleeUnit  <: Unit end
abstract type RangedUnit <: Unit end


# Include different unit classes.
include("Knights.jl")
include("Peasants.jl")

# ------------------------------------------------------------------------------------------
# GENERAL METHODS FOR ABSTRACT UNITS

# General getters
id(u::T)      where T <: Unit = u.id
player(u::T)  where T <: Unit = u.player
pos(u::T)     where T <: Unit = u.pos
hp(u::T)      where T <: Unit = u.hp
attack(u::T)  where T <: Unit = u.attack

# General setters
function id!(u::T, new_id::Int) where T <: Unit
    u.id = new_id
end

function player!(u::T,new_player::Int) where T <: Unit
    u.player = new_player
end

function pos!(u::T, new_pos::CartesianIndex{2}) where T <: Unit
    u.pos = new_pos
end

function hp!(u::T, new_hp::Int) where T <: Unit
    u.hp = new_hp
end

function attack!(u::T, new_attack::Int) where T <: Unit
    u.attack = new_attack
end

end # module

# ABSTRACT CLASSES FOR THE UNIT LIBRARY

abstract type Unit end

abstract type MeleeUnit  <: Unit end
abstract type RangedUnit <: Unit end



# ------------------------------------------------------------------------------------------
# GENERAL METHODS FOR ABSTRACT UNITS

# General getters
id(u::Unit)     = u.id
player(u::Unit) = u.player
pos(u::Unit)    = u.pos
hp(u::Unit)     = u.hp
ap(u::Unit)     = u.ap
dp(u::Unit)     = u.dp

# General setters
function id!(u::Unit, new_id::Int)
    u.id = new_id
end

function player!(u::Unit,new_player::Int)
    u.player = new_player
end

function pos!(u::Unit, new_pos::CartesianIndex{2})
    u.pos = new_pos
end

function hp!(u::Unit, new_hp::Int)
    u.hp = new_hp
end

function ap!(u::Unit, new_ap::Int)
    u.ap = new_ap
end

function dp!(u::Unit, new_dp::Int)
    u.dp = new_dp
end
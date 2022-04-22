
const PEASANT_MAX_HP = 10
const PEASANT_ATTACK = 5

"""
  Peasant unit: Basic melee unit. Not fitted for combat. Used to capture land tiles. 
"""
mutable struct Peasant <: MeleeUnit
  id     :: Int
  player :: Int
  pos    :: CartesianIndex{2}
  hp     :: Int
  attack :: Int
end

function Peasant(id::Int,player::Int,pos::CartesianIndex{2}) :: Peasant
  return Peasant(id,player,pos,PEASANT_MAX_HP,PEASANT_ATTACK)
end


const PEASANT_HP = 10
const PEASANT_AP = 1
const PEASANT_DP = 5

"""
  Peasant unit: Basic melee unit. Not fitted for combat. Used to capture land tiles. 
"""
mutable struct Peasant <: MeleeUnit
  id     :: Int
  player :: Int
  pos    :: CartesianIndex{2}
  hp     :: Int
  ap     :: Int
  dp     :: Int
end

function Peasant(id::Int,player::Int,pos::CartesianIndex{2}) :: Peasant
  return Peasant(id,player,pos,PEASANT_HP,PEASANT_AP,PEASANT_DP)
end

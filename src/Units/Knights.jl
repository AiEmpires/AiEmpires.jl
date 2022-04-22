
const KNIGHT_MAX_HP  = 30
const KNIGHT_ATTACK  = 10

"""
  Knight unit: Basic offensive melee unit.
"""
mutable struct Knight <: MeleeUnit
  id     :: Int
  player :: Int
  pos    :: CartesianIndex{2}
  hp     :: Int
  attack :: Int
end

function Knight(id::Int,player::Int,pos::CartesianIndex{2}) :: Knight
  return Knight(id,player,pos,KNIGHT_MAX_HP,KNIGHT_ATTACK)
end

const KNIGHT_HP  = 30
const KNIGHT_AP  = 1
const KNIGHT_DP  = 10

"""
  Knight unit: Basic offensive melee unit.
"""
mutable struct Knight <: MeleeUnit
  id     :: Int
  player :: Int
  pos    :: CartesianIndex{2}
  hp     :: Int
  ap     :: Int
  dp     :: Int
end

function Knight(id::Int,player::Int,pos::CartesianIndex{2}) :: Knight
  return Knight(id,player,pos,KNIGHT_HP,KNIGHT_AP,KNIGHT_DP)
end
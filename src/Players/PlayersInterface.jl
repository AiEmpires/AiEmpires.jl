

abstract type Player end

id(p::Player) = p.id

"""
Template for a player: 

    struct Player <: AbstractPlayer
        id    :: Int
    end
"""
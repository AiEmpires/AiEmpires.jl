
module Players

export AbstractPlayer
export id

abstract type AbstractPlayer end

id(p::T) where {T <: AbstractPlayer} = p.id

"""
Template for a player: 

    struct Player <: AbstractPlayer
        id    :: Int
    end
"""

end
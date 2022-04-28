
module Gameplay

    using DataStructures
    using AiEmpires.Units
    using AiEmpires.Players

    # export Game, play

    export Board, Cell, Entity
    export entity, player, terrain, cell, entities, entity
    export in_board, get_entities

    include("Boards.jl")
    # include("Games.jl")

end
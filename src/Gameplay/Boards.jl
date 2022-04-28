
# Parameters
const MAX_NUM_ENTITIES = 200
const NO_ENTITY        = CartesianIndex(0,0)  

@enum Terrain begin
    grass
    mountain
    water
end


# Types
const Entity = Union{Unit,Nothing} #TODO: Expand to buildings, natural blockers, ...

mutable struct Cell
    entity  :: Entity
    player  :: Int
    terrain :: Terrain
end

mutable struct Board
    size     :: Tuple{Int,Int}
    cells    :: Matrix{Cell}

    nument   :: Int
    entities :: Vector{CartesianIndex{2}}
end


# Constructors
function Board(size::Tuple{Int,Int})
    # TODO: Create a procedural generator for the terrain.
    return Board(size, [Cell(nothing,0,grass) for i in 1:size[1], j in 1:size[2]], 
                    0, fill(NO_ENTITY,MAX_NUM_ENTITIES)
                )
end


# Getters
entity(c::Cell)  = deepcopy(c.entity)
player(c::Cell)  = c.player
terrain(c::Cell) = c.terrain

cells(b::Board) = b.cells
cell(b::Board, pos::CartesianIndex{2}) = deepcopy(b.cells[pos])

entities(b::Board) = b.entities
entity(b::Board, uid::Int) = entity(b.cells[b.entities[uid]])
entity(b::Board, pos::CartesianIndex{2}) = entity(b.cells[pos])


# Setters
function entity!(b::Board, pos::CartesianIndex{2}, new_entity::Entity) 
    b.cells[pos].entity = deepcopy(new_entity)
    if new_entity !== nothing
        b.entities[id(new_entity)] = pos
    end
end

entity!(b::Board, uid::Int, new_entity::Entity) = entity!(b, b.entities[uid], new_entity)


function player!(c::Cell, new_player::Int) 
    c.player = new_player
end

function terrain!(c::Cell, new_terrain::Terrain)
    c.terrain = new_terrain
end

function cells!(b::Board, new_cells::Matrix{Cell})
    b.size  = size(new_cells)
    b.cells = new_cells
end

function cell!(b::Board, pos::CartesianIndex{2}, new_cell::Cell)
    b.cells[pos] = deepcopy(new_cell)
end

############################################################################################

"""
    inboard(b::Board, pos::CartesianIndex{2}) :: Bool

    Returns true if pos is inside the board, false otherwise. 
"""
function in_board(b::Board, pos::CartesianIndex{2}) :: Bool
    return pos[1] >= 1 && pos[1] <= b.size[1] && pos[2] >= 1 && pos[2] <= b.size[2]
end

"""
    kill!(b::Board, id::Int)

    Removes Unit from Board by id.
"""
function kill!(b::Board, id::Int)
    entity!(b,id,nothing)
    b.entities[id] = NO_ENTITY
end

"""
    kill!(b::Board, u::Unit)

    Removes Unit from Board.
"""
kill!(b::Board, u::Unit) = kill!(b, id(u))

"""
    spawn!(b::Board, pos::CartesianIndex{2}, p::Player, etype::Type{T}) where T <: AbstractUnit

    Spawns Unit into Board for a certain Player by position.
"""
function spawn!(b::Board, pos::CartesianIndex{2}, p::Player, etype::Type{T}) where T <: Unit
    id = findfirst(==(NO_ENTITY), b.entities)
    entity!(b,pos,etype(id,id(p),pos))
    b.entities[id] = pos
end



"""
    get_entities(b::Board, id::Int) :: Vector{Int}

    Returns an index list for all Entities belonging to an AbstractPlayer by id.
"""
function get_entities(b::Board, id::Int) :: Vector{Int}
    return findall( x -> (x !=(NO_ENTITY) && id == player(entity(b,x))) ,b.entities)
end

"""
    get_entities(b::Board, p::Player) :: Vector{Int}

    Returns an index list for all Entities belonging to a Player.
"""
get_entities(b::Board, p::Player) = get_entities(b, id(p))
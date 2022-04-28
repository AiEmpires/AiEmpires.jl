

macro publish(mod,name)
    quote
      using AiEmpires.$mod: $name; export $name
    end
end



@publish Units Peasant
@publish Units Knight
@publish Units id
@publish Units player
@publish Units pos
@publish Units hp
@publish Units ap
@publish Units id!
@publish Units player!
@publish Units pos!
@publish Units hp!
@publish Units ap!


@publish Players Player
@publish Players id

@publish Gameplay Board
@publish Gameplay Entity
@publish Gameplay get_entities
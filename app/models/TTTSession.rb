class TTTSession
    GAMEKEY = "game_state"

    def initialize(session)
        @session = session
    end

    def set_game_state(game)
        @session[GAMEKEY] = game.to_h
    end

    def get_game_state
        data = @session[GAMEKEY]
        data ? GameState.from_h(data) : GameState.new
    end
end

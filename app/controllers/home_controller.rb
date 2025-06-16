class HomeController < ApplicationController
  def index
    ttt = TTTSession.new(session)
    @game = ttt.get_game_state()
    if @game.won != 0
      #someone has won, reset everything but still display message
      @game = GameState.new(won: @game.won)
      ttt.set_game_state(@game) #overwrites the previous game
    end
  end

  def place
    x = params[:x].to_i
    y = params[:y].to_i

    ttt = TTTSession.new(session)
    @game = ttt.get_game_state()
    @game.won = 0 #reset who won so game can loop but message can display

    if @game.grid[y][x] == 0
      @game.grid[y][x] = @game.current_player
      @game.switch_player
      @game.won = @game.check_winner
    end

    ttt.set_game_state(@game)
    redirect_to root_path
  end
end

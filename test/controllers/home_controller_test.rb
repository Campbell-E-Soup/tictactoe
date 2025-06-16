require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should place player mark and redirect" do
    game = GameState.new
    starting_player = game.current_player
    post session_path, params: { game_state: game.to_h } # Or set directly if needed

    get place_home_url(x: 1, y: 1)
    assert_response :redirect
    follow_redirect!
    assert_response :success

    updated_game = GameState.from_h(session[:game_state])
    assert_equal starting_player, updated_game.grid[1][1]
  end
end

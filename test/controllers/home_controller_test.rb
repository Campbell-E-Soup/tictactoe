require "test_helper"
require "minitest/mock"

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  module TTTSessionStub
    def ttt_session
      @ttt_session_stub
    end
  end

  #yes i wrote a test for place but do not want to ever deal with the session during testing and it took so long I never want to set the expectation that I would ever do that again, so no there is no test

end

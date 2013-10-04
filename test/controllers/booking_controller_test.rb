require 'test_helper'

class BookingControllerTest < ActionController::TestCase
  test "should get test" do
    ## this is a dummy test. We should be using RSpec!
    # Arrange
    controller = BookingsController.new

    # Act
    result = controller.index

    # Assert
    assert result.count > -1
  end

end

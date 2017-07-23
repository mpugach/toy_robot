require "test_helper"

describe ToyRobot::Robot do
  before do
    @robot = ::ToyRobot::Robot.new
  end

  def test_no_report_when_unplaced
    assert_silent { @robot.report }
  end

  describe "#place" do
    def test_it_can_be_placed
      @robot.place("0", "0", "north")

      assert_output("0,0,NORTH\n") { @robot.report }
    end

    def test_it_can_be_re_placed
      @robot.place("0", "0", "north")
      @robot.place("4", "4", "east")

      assert_output("4,4,EAST\n") { @robot.report }
    end

    def test_it_can_not_be_placed_on_invalid_x
      @robot.place("-1", "0", "north")

      assert_silent { @robot.report }

      @robot.place(::ToyRobot::Robot::FIELD_DIMENSION_X, "0", "north")

      assert_silent { @robot.report }
    end

    def test_it_can_not_be_placed_on_invalid_y
      @robot.place("0", "-1", "north")

      assert_silent { @robot.report }

      @robot.place("0", ::ToyRobot::Robot::FIELD_DIMENSION_Y, "north")

      assert_silent { @robot.report }
    end

    def test_it_can_not_be_placed_on_invalid_direction
      @robot.place("0", "0", "trololo")

      assert_silent { @robot.report }
    end
  end
end

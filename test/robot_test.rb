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

  describe "#move" do
    def test_it_can_move_east
      @robot.place("2", "2", "east")
      @robot.move

      assert_output("2,3,EAST\n") { @robot.report }
    end

    def test_it_can_move_west
      @robot.place("2", "2", "west")
      @robot.move

      assert_output("2,1,WEST\n") { @robot.report }
    end

    def test_it_can_move_north
      @robot.place("2", "2", "north")
      @robot.move

      assert_output("3,2,NORTH\n") { @robot.report }
    end

    def test_it_can_move_south
      @robot.place("2", "2", "south")
      @robot.move

      assert_output("1,2,SOUTH\n") { @robot.report }
    end

    def test_it_does_not_fall_east
      @robot.place("0", "4", "east")
      @robot.move

      assert_output("0,4,EAST\n") { @robot.report }
    end

    def test_it_does_not_fall_west
      @robot.place("0", "0", "west")
      @robot.move

      assert_output("0,0,WEST\n") { @robot.report }
    end

    def test_it_does_not_fall_north
      @robot.place("4", "0", "north")
      @robot.move

      assert_output("4,0,NORTH\n") { @robot.report }
    end

    def test_it_does_not_fall_south
      @robot.place("0", "0", "south")
      @robot.move

      assert_output("0,0,SOUTH\n") { @robot.report }
    end
  end
end

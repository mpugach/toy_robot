require "test_helper"

describe ToyRobot::Client do
  def simulate_stdin(*inputs, &block)
    io = StringIO.new

    inputs.flatten.each { |str| io.puts(str) }

    io.rewind

    actual_stdin, $stdin = $stdin, io

    yield
  ensure
    $stdin = actual_stdin
  end

  def test_it_should_pass_place_to_robot
    ToyRobot::Robot.any_instance.expects(:place).with("1", "1", "north")

    simulate_stdin("place 1,1,north", "\cC") { ToyRobot::Client.start }
  end

  def test_it_should_pass_move_to_robot
    ToyRobot::Robot.any_instance.expects(:move)

    simulate_stdin("move", "\cC") { ToyRobot::Client.start }
  end

  def test_it_should_pass_report_to_robot
    ToyRobot::Robot.any_instance.expects(:report)

    simulate_stdin("report", "\cC") { ToyRobot::Client.start }
  end

  def test_it_should_pass_right_to_robot
    ToyRobot::Robot.any_instance.expects(:right)

    simulate_stdin("right", "\cC") { ToyRobot::Client.start }
  end

  def test_it_should_pass_left_to_robot
    ToyRobot::Robot.any_instance.expects(:left)

    simulate_stdin("left", "\cC") { ToyRobot::Client.start }
  end

  def test_it_should_pass_other_to_robot
    ToyRobot::Robot.any_instance.expects(:other).never

    simulate_stdin("other", "\cC") { ToyRobot::Client.start }
  end
end

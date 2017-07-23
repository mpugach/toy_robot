module ToyRobot
  class Client
    def self.start
      robot = ToyRobot::Robot.new

      while (input = gets)
        command, *arguments = input.chomp.split(/[\s,]+/).map(&:downcase)

        next unless ToyRobot::Robot::COMMANDS.include?(command)

        robot.public_send(command, *arguments)
      end
    end
  end
end

module ToyRobot
  class Robot
    FIELD_DIMENSION_X = 5
    FIELD_DIMENSION_Y = 5

    DIRECTIONS = {
      north: { x:  1, y:  0 },
      west:  { x:  0, y: -1 },
      south: { x: -1, y:  0 },
      east:  { x:  0, y:  1 }
    }

    COMMANDS = %w[place move report left right]

    attr_reader :x, :y, :facing

    def place(new_x, new_y, new_facing)
      x_integer = new_x.to_i
      return unless x_valid?(x_integer)

      y_integer = new_y.to_i
      return unless y_valid?(y_integer)

      downcased_facing = new_facing.to_sym
      return unless facing_valid?(downcased_facing)

      @x = x_integer
      @y = y_integer
      @facing = downcased_facing
    end

    def move
      direction = DIRECTIONS[facing]

      new_x = x + direction[:x]
      return unless x_valid?(new_x)

      new_y = y + direction[:y]
      return unless y_valid?(new_y)

      @x = new_x
      @y = new_y
    end

    def report
      puts "#{x},#{y},#{facing.upcase}" if placed?
    end

    def left
      @facing = rotate(:left)
    end

    def right
      @facing = rotate(:right)
    end

    private

    def placed?
      !!(x && y && facing)
    end

    def facing_valid?(new_facing)
      DIRECTIONS.key? new_facing
    end

    def x_valid?(new_x)
      (0...FIELD_DIMENSION_X).cover? new_x
    end

    def y_valid?(new_y)
      (0...FIELD_DIMENSION_Y).cover? new_y
    end

    def rotate(rotation_direction)
      directions = DIRECTIONS.keys
      new_index = directions.index(facing) + (rotation_direction == :right ? -1 : 1)

      directions[new_index] || directions[0]
    end
  end
end

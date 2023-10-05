require 'matrix'

class LeapingRobot
  def initialize(instructions)
    @instructions = []

    instructions.each_line do |line|
      command = line.split(' ')
      @instructions << [command[0], command[1]]
    end

    @max_number = 600_000


    # Columns
    horizontal_instructions = @instructions.select do |instruction|
      ['D', 'E'].include?(instruction[0])
    end

    columns_infos = calculates_matrix_infos(horizontal_instructions)
    @start_column = columns_infos[:start_position]
    @number_of_columns =  columns_infos[:array].length


    # Lines
    vertical_instructions = @instructions.select do |instruction|
      ['C', 'B'].include?(instruction[0])
    end

    lines_infos = calculates_matrix_infos(vertical_instructions)
    @start_line = lines_infos[:start_position]
    @number_of_lines = lines_infos[:array].length
  end

  def calculates_matrix_infos(instructions)
    aux_array = Array.new(@max_number, 'O')
    start_position = @max_number / 2
    pivot = start_position

    aux_array[pivot] = 'X'

    instructions.each do |a|
      if a[0] == 'D' || a[0] == 'B'
        pivot += a[1].to_i
        aux_array[pivot] = 'X'
      elsif a[0] == 'E' || a[0] == 'C'
        pivot -= a[1].to_i
        aux_array[pivot] = 'X'
      end
    end

    first = aux_array.find_index('X')

    last = first

    (first..@max_number).each do |index|
      if aux_array[index] == 'X'
        last = index
      end
    end

    start_position -= first
    last -= first
    first = 0

    final_array = []
    (first..last).each do
      final_array << 'O'
    end

    {start_position: start_position, array: final_array}
  end

  def move
    matrix = Matrix.build(@number_of_lines, @number_of_columns) { 'O' }

    current_line = @start_line
    current_column = @start_column

    matrix[current_line, current_column] = 'X'

    @instructions.each do |instruction|
      case instruction[0]
      when 'D'
        current_column += instruction[1].to_i
      when 'E'
        current_column -= instruction[1].to_i
      when 'B'
        current_line   += instruction[1].to_i
      when 'C'
        current_line   -= instruction[1].to_i
      end

      matrix[current_line, current_column] = 'X'
    end

    matrix.to_a
  end
end

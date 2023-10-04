class Polynoms
  def initialize
    @results = {}
    @results[:constant] = []
  end

  def simplification(polynom)
    polynom.split(/\+/).each do |expressions|
      expressions.split(/\-/).each_with_index do |expr, index|
        literal = expr[/[a-zA-Z]+/]
        coefficient = expr[/[0-9]+/] || 1

        if literal
          literal = literal.chars.sort.join

          @results[literal.to_sym] ||= []
        end

        @results[literal ? literal.to_sym : :constant] << if coefficient.nil?
          1
        elsif index == 0
          coefficient.to_i
        else
          -coefficient.to_i
        end
      end
    end


    final_hash = @results.map do |key, value|
      [key, value.sum]
    end.to_h

    is_first_expr = true
    answer = ""

    final_hash.sort.map do |key, value|
      next if key == :constant

      signal = if value > 0 && !is_first_expr
        '+'
      elsif value == -1
        '-'
      end

      unless value == 0
        answer << "#{signal}#{value != 1 && value != -1 ? value.to_s : ''}#{key.to_s}"
        is_first_expr = false
      end
    end

    constant = final_hash[:constant]
    answer << "#{'+' if constant > 0}#{constant}" unless constant == 0

    answer.empty? ? '0' : answer
  end
end

require 'color_diff'

class QualityControl
  def initialize(original_tones_files, copied_tones_files, paintings)
    @original_tones = File.new("data/" + original_tones_files, 'r').map do |line|
      line_parts = line.split(':')
      [line_parts[0].to_sym, line_parts[1]]
    end.to_h

    @copied_tones   = File.new("data/" + copied_tones_files, 'r').map do |line|
      line_parts = line.split(':')
      [line_parts[0].to_sym, line_parts[1]]
    end.to_h

    @paintings = paintings
  end

  def tone_checking
    @paintings.map do |painting|
      originals = transform_string_in_hex_colors(@original_tones, painting)
      copies    = transform_string_in_hex_colors(@copied_tones, painting)

      number_of_colors = originals.length

      results = []

      number_of_colors.times do |i|
        original = originals[i]
        copy = copies[i]

        diff = ColorDiff.between copy, original

        results << if diff == 0
          'excelente'
        elsif diff <= 5
          'bom'
        elsif diff <= 20
          'aceitável'
        else
          'ruim'
        end
      end

      half = results.length / 2
      result = if results.count('excelente') > half
        'excelente'
      elsif results.count('bom') > half
        'boa'
      elsif results.count('aceitável') > half
        'aceitável'
      else
        'ruim'
      end

      "#{painting}:Cópia #{result}"
    end.to_a
  end

  private

  def transform_string_in_hex_colors(tones, painting)
    arr = tones[painting.to_sym].split('//').map do |tone|
      tone.gsub(/[()\n]/, '').split(',').map do |hex|
        hex.to_i
      end
    end

    arr.map do |hex|
      ColorDiff::Color::RGB.new(hex[0], hex[1], hex[2])
    end
  end
end

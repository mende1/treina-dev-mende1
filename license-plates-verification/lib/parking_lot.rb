class ParkingLot
  def initialize(license_rules, vehicles)
    @license_rules = license_rules
    @vehicles = vehicles
  end

  def license_plates_verification
    arr = []
    rules = @license_rules.split('||')

    @vehicles.each do |vehicle|
      rule_check = false

      rules.each do |rule|
        chars = vehicle.plate.split('')

        rule_check = true if chars_verification_by_rule(chars, rule)
      end

      arr << (rule_check ? 'Válido' : 'Inválido')
    end

    arr
  end

  private

  def chars_verification_by_rule(chars, rule)
    chars.each_with_index do |char, index|
      if rule[index] == 'L'
        unless char.match?(/[A-Z]/)
          return false
        end
      elsif rule[index] == 'N'
        unless char.match?(/[0-9]/)
          return false
        end
      else
        unless char == rule[index]
          return false
        end
      end
    end

    true
  end
end

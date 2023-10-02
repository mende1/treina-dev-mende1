class HungerGames
  def initialize(participants, log)
    @participants = participants
    @log = log
    @weapons_info = {}
    @weapon_result = {}

    @weapon_result[:Cenario] = {} if log.include?('eliminado')

    @final_score = @participants.map do |participant, weapons_infos|
      weapons_infos.each do |weapon|
        info = weapon.split(':')

        @weapons_info[info[0].to_sym] = info[1].to_i
        @weapon_result[info[0].to_sym] = 0
      end

      [participant, 0]
    end.to_h

    populate_results
  end

  def score
    @final_score
  end

  def weapons_summary
    @weapon_result
  end

  private

  def populate_results
    lines = @log.split("\n")

    lines.each do |line|
      info = line.split('-')[1].split(' ')

      next if info[0] == 'Inicio' || info[0] == 'Fim'

      weapon_ref = info[4].split(';')[0].to_sym

      if info[1] == 'e'
        @final_score[info[0].to_sym] -= 3

        @weapon_result[:Cenario][weapon_ref] ||= 0
        @weapon_result[:Cenario][weapon_ref] += 1
      else
        @final_score[info[0].to_sym] += @weapons_info[weapon_ref]
        @final_score[info[2].to_sym] -= 1

        @weapon_result[weapon_ref] += 1
      end
    end

    @final_score
  end
end

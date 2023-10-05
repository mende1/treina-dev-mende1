require 'spec_helper'

describe LeapingRobot do
  it '1.Segue instruções de um movimento e traça caminho no mapa' do
    instructions = <<~INSTRUCTIONS
      D 1
    INSTRUCTIONS
    traced_map = [['X','X']]

    expect(LeapingRobot.new(instructions).move).to eq traced_map
  end

  it '2.Segue instruções de dois movimentos e traça caminho no mapa' do
    instructions = <<~INSTRUCTIONS
      B 1
      D 1
    INSTRUCTIONS
    traced_map = [['X','O'],
                  ['X','X']]

    expect(LeapingRobot.new(instructions).move).to eq traced_map
  end

  it '3.Segue instruções de dois movimentos e traça caminho no mapa' do
    instructions = <<~INSTRUCTIONS
      B 1
      D 2
    INSTRUCTIONS
    traced_map = [['X','O','O'],
                  ['X','O','X']]

    expect(LeapingRobot.new(instructions).move).to eq traced_map
  end

  it '4.Segue instruções de movimentos e traça caminho no mapa' do
    instructions = <<~INSTRUCTIONS
      B 2
      D 1
      C 1
      E 2
    INSTRUCTIONS
    traced_map = [['O','X','O'],
                  ['X','O','X'],
                  ['O','X','X']]

    expect(LeapingRobot.new(instructions).move).to eq traced_map
  end

  it '5.Segue instruções de movimentos e traça caminho no mapa' do
    instructions = <<~INSTRUCTIONS
      B 3
      D 1
      B 1
      C 1
      E 2
      D 3
      E 5
      C 2
    INSTRUCTIONS
    traced_map = [['O', 'O', 'O', 'X', 'O', 'O'],
                  ['X', 'O', 'O', 'O', 'O', 'O'],
                  ['O', 'O', 'O', 'O', 'O', 'O'],
                  ['X', 'O', 'X', 'X', 'X', 'X'],
                  ['O', 'O', 'O', 'O', 'X', 'O']]

    expect(LeapingRobot.new(instructions).move).to eq traced_map
  end

  it '6.Segue instruções de movimentos e traça caminho no mapa' do
    instructions = <<~INSTRUCTIONS
      C 3
      D 6
      C 2
      C 1
      E 2
      D 3
      E 1
      C 2
      B 1
      E 7
    INSTRUCTIONS
    traced_map = [["O", "O", "O", "O", "O", "O", "O", "X", "O"],
                  ["X", "O", "O", "O", "O", "O", "O", "X", "O"],
                  ["O", "O", "O", "O", "O", "X", "O", "X", "X"],
                  ["O", "O", "O", "O", "O", "O", "O", "X", "O"],
                  ["O", "O", "O", "O", "O", "O", "O", "O", "O"],
                  ["O", "X", "O", "O", "O", "O", "O", "X", "O"],
                  ["O", "O", "O", "O", "O", "O", "O", "O", "O"],
                  ["O", "O", "O", "O", "O", "O", "O", "O", "O"],
                  ["O", "X", "O", "O", "O", "O", "O", "O", "O"]]

    expect(LeapingRobot.new(instructions).move).to eq traced_map
  end
end

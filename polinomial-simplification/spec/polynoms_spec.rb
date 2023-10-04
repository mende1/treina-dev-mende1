require 'spec_helper'

describe 'Polynoms' do
  it '1. Recebe um polinômio e o retorna simplificado' do
    polynom = '2x+4x'

    expect(Polynoms.new.simplification(polynom)).to eq('6x')
  end

  it '2. Recebe um polinômio e o retorna simplificado' do
    polynom = '3z+4z-7z'

    expect(Polynoms.new.simplification(polynom)).to eq('0')
  end

  it '3. Recebe um polinômio e o retorna simplificado' do
    polynom = '3y+4y-8y+7y-10y'

    expect(Polynoms.new.simplification(polynom)).to eq('-4y')
  end

  it '4. Recebe um polinômio e o retorna simplificado' do
    polynom = '3a+2b'

    expect(Polynoms.new.simplification(polynom)).to eq('3a+2b')
  end

  it '5. Recebe um polinômio e o retorna simplificado' do
    polynom = '7z+2x-4z-4y+y-3z'

    expect(Polynoms.new.simplification(polynom)).to eq('2x-3y')
  end

  it '6. Recebe um polinômio e o retorna simplificado' do
    polynom = '2xy+7y+5xy-15x'

    expect(Polynoms.new.simplification(polynom)).to eq('-15x+7xy+7y')
  end

  it '7. Recebe um polinômio e o retorna simplificado' do
    polynom = '7bcd+12-67y+212adf-12dcb+17cdb-300afd+12xy-x'

    expect(Polynoms.new.simplification(polynom)).to eq('-88adf+12bcd-x+12xy-67y+12')
  end
end

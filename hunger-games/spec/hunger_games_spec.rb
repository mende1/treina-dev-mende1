require 'spec_helper'

describe 'HungerGames' do
  it '1. Recebe o log de uma partida e uma hash das informações e retorna o sumário de pontos' do
    participants = { catnip: ['ArcoeFlecha:5'], beedle: ['Besouros:10'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:15 - catnip elimina beedle com ArcoeFlecha;
      00:40 - catnip elimina beedle com ArcoeFlecha;
      00:55 - beedle elimina catnip com Besouros;
      01:15 - catnip elimina beedle com ArcoeFlecha;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).score).to eq({ catnip: 14, beedle: 7 })
  end

  it '2. Recebe o log de uma partida e uma hash das informações e retorna o sumário de armas' do
    participants = { catnip: ['ArcoeFlecha:5'], beedle: ['Besouros:10'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:15 - catnip elimina beedle com ArcoeFlecha;
      00:40 - catnip elimina beedle com ArcoeFlecha;
      00:55 - beedle elimina catnip com Besouros;
      01:15 - catnip elimina beedle com ArcoeFlecha;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).weapons_summary).to eq({ ArcoeFlecha: 3, Besouros: 1 })
  end

  it '3. Recebe o log de uma partida e uma hash das informações e retorna o sumário de pontos' do
    participants = { catnip: ['ArcoeFlecha:5'], beedle: ['Besouros:10'],
                     link: ['EspadaMestre:5'], zelda: ['Magia:7'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:10 - catnip elimina link com ArcoeFlecha;
      00:23 - zelda elimina catnip com Magia;
      00:41 - zelda elimina beedle com Magia;
      00:42 - link elimina zelda com EspadaMestre;
      00:43 - link elimina catnip com EspadaMestre;
      00:51 - beedle elimina zelda com Besouros;
      00:55 - beedle elimina catnip com Besouros;
      01:00 - link elimina beedle com EspadaMestre;
      01:10 - catnip elimina beedle com ArcoeFlecha;
      01:15 - link elimina zelda com EspadaMestre;
      01:20 - link elimina beedle com EspadaMestre;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).score).to eq({ catnip: 7, beedle: 16, link: 24, zelda: 11 })
  end

  it '4. Recebe o log de uma partida e uma hash das informações e retorna o sumário de armas' do
    participants = { catnip: ['ArcoeFlecha:5'], beedle: ['Besouros:10'],
                     link: ['EspadaMestre:5'], zelda: ['Magia:7'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:10 - catnip elimina link com ArcoeFlecha;
      00:23 - zelda elimina catnip com Magia;
      00:41 - zelda elimina beedle com Magia;
      00:42 - link elimina zelda com EspadaMestre;
      00:43 - link elimina catnip com EspadaMestre;
      00:51 - beedle elimina zelda com Besouros;
      00:55 - beedle elimina catnip com Besouros;
      01:00 - link elimina beedle com EspadaMestre;
      01:10 - catnip elimina beedle com ArcoeFlecha;
      01:15 - link elimina zelda com EspadaMestre;
      01:20 - link elimina beedle com EspadaMestre;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).weapons_summary).to eq({
      ArcoeFlecha: 2, Magia: 2,
      EspadaMestre: 5, Besouros: 2 
    })
  end

  it '5. Recebe o log de uma partida e uma hash das informações e retorna o sumário de pontos' do
    participants = { catnip: ['ArcoeFlecha:5', 'FrutaVenenosa:15'], beedle: ['Besouros:10', 'Lagartos:10'],
                     link: ['EspadaMestre:5', 'Bumerangue:15'], zelda: ['Magia:7', 'ArcodeLuz:5'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:01 - link elimina zelda com EspadaMestre;
      00:22 - zelda elimina link com Magia;
      00:31 - beedle elimina catnip com Besouros;
      00:42 - beedle elimina link com Lagartos;
      00:43 - zelda elimina beedle com ArcodeLuz;
      00:51 - catnip elimina zelda com FrutaVenenosa;
      00:52 - catnip elimina link com FrutaVenenosa;
      01:00 - beedle elimina catnip com Besouros;
      01:10 - catnip elimina link com ArcoeFlecha;
      01:15 - link elimina zelda com Bumerangue;
      01:20 - link elimina beedle com EspadaMestre;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).score).to eq({ catnip: 33, beedle: 28, link: 21, zelda: 9 })
  end

  it '6. Recebe o log de uma partida e uma hash das informações e retorna o sumário de armas' do
    participants = { catnip: ['ArcoeFlecha:5', 'FrutaVenenosa:15'], beedle: ['Besouros:10', 'Lagartos:10'],
                     link: ['EspadaMestre:5', 'Bumerangue:15'], zelda: ['Magia:7', 'ArcodeLuz:5'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:01 - link elimina zelda com EspadaMestre;
      00:22 - zelda elimina link com Magia;
      00:31 - beedle elimina catnip com Besouros;
      00:42 - beedle elimina link com Lagartos;
      00:43 - zelda elimina beedle com ArcodeLuz;
      00:51 - catnip elimina zelda com FrutaVenenosa;
      00:52 - catnip elimina link com FrutaVenenosa;
      01:00 - beedle elimina catnip com Besouros;
      01:10 - catnip elimina link com ArcoeFlecha;
      01:15 - link elimina zelda com Bumerangue;
      01:20 - link elimina beedle com EspadaMestre;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).weapons_summary).to eq({ 
      EspadaMestre: 2, Magia: 1, Besouros: 2, Lagartos: 1,
      ArcodeLuz: 1, FrutaVenenosa: 2, ArcoeFlecha: 1, Bumerangue: 1 
    })
  end

  it '7. Recebe o log de uma partida e uma hash das informações e retorna o sumário de pontos' do
    participants = { catnip: ['ArcoeFlecha:5', 'FrutaVenenosa:15'], beedle: ['Besouros:10', 'Lagartos:10'], 
                     link: ['EspadaMestre:5', 'Bumerangue:15'], zelda: ['Magia:7', 'ArcodeLuz:5'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:01 - zelda elimina catnip com ArcodeLuz;
      00:05 - beedle elimina link com Besouros;
      00:22 - catnip elimina beedle com FrutaVenenosa;
      00:25 - catnip e eliminada por CoelhosSelvagens;
      00:31 - link elimina zelda com EspadaMestre;
      00:32 - catnip elimina link com ArcoeFlecha;
      00:42 - beedle e eliminado por AguaPodre;
      00:43 - link elimina catnip com Bumerangue;
      00:50 - zelda elimina beedle com Magia;
      00:51 - catnip elimina zelda com FrutaVenenosa;
      00:52 - link elimina catnip com EspadaMestre;
      00:55 - link e eliminado por Queda;
      01:00 - beedle elimina catnip com Lagartos;
      01:10 - zelda elimina catnip com Magia;
      01:15 - link elimina zelda com Bumerangue;
      01:20 - link e eliminado por Furacao;
      01:20 - catnip e eliminada por Furacao;
      01:20 - beedle e eliminado por Furacao;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).score).to eq({ 
      catnip: 24, beedle: 12, link: 32, zelda: 16 
    })
  end

  it '8. Recebe o log de uma partida e uma hash das informações e retorna o sumário de armas' do
    participants = { catnip: ['ArcoeFlecha:5', 'FrutaVenenosa:15'], beedle: ['Besouros:10', 'Lagartos:10'],
                     link: ['EspadaMestre:5', 'Bumerangue:15'], zelda: ['Magia:7', 'ArcodeLuz:5'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:01 - zelda elimina catnip com ArcodeLuz;
      00:05 - beedle elimina link com Besouros;
      00:22 - catnip elimina beedle com FrutaVenenosa;
      00:25 - catnip e eliminada por CoelhosSelvagens;
      00:31 - link elimina zelda com EspadaMestre;
      00:32 - catnip elimina link com ArcoeFlecha;
      00:42 - beedle e eliminado por AguaPodre;
      00:43 - link elimina catnip com Bumerangue;
      00:50 - zelda elimina beedle com Magia;
      00:51 - catnip elimina zelda com FrutaVenenosa;
      00:52 - link elimina catnip com EspadaMestre;
      00:55 - link e eliminado por Queda;
      01:00 - beedle elimina catnip com Lagartos;
      01:10 - zelda elimina catnip com Magia;
      01:15 - link elimina zelda com Bumerangue;
      01:20 - link e eliminado por Furacao;
      01:20 - catnip e eliminada por Furacao;
      01:20 - beedle e eliminado por Furacao;
      01:30 - Fim da partida
    PARTIDA

    expect(HungerGames.new(participants, log).weapons_summary).to eq({ 
      ArcodeLuz: 1, EspadaMestre: 2, Bumerangue: 2, FrutaVenenosa: 2,
      Magia: 2, Besouros: 1, Lagartos: 1, ArcoeFlecha: 1,
      Cenario: {CoelhosSelvagens: 1, AguaPodre: 1, Queda: 1,Furacao: 3}
    })
  end
end
